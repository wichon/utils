function decrypt-me
    if count $argv > /dev/null
        set file $argv[1]
        gpg --decrypt $file
    else
        echo "Please provide an input file"
    end
end

