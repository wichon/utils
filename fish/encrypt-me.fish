function encrypt-me
    if count $argv > /dev/null
        set file $argv[1]
        gpg --symmetric --cipher-algo aes256 $file
    else
        echo "Please provide an input file"
    end
end

