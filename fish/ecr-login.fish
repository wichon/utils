function ecr-login
    set region "us-east-1"
    if count $argv > /dev/null
        set region $argv[1]
    end

    set loginCommand (aws ecr get-login --region $region)
    eval $loginCommand
end
