function map-container
    set host $argv[1]
    set containerName $argv[2]

    set containerIp (docker inspect $containerName | jq '.[0].NetworkSettings.IPAddress' | sed 's/\"//g')

    if grep -c "$host" /etc/hosts
        set escapedHost (echo $host | sed 's,\&,\\\&,g')
        set sedExp "s/[^\s]\+\s\+$escapedHost/$containerIp $escapedHost/g"
        sudo sed -i -e "$sedExp" /etc/hosts
    else
        echo "$containerIp  $host" | sudo tee -a /etc/hosts
    end
end
