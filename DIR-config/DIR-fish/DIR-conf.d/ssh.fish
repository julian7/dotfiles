if isatty
    set -x _authsockets $HOME/.ssh/sockets.conf

    if command -qs gpg-connect-agent
        gpg-connect-agent /bye 2>&1 > /dev/null || echo "Cannot start gpg-agent"
        alias killagent='killall -9 gpg-agent && gpg-connect-agent /bye'
        alias reagent='gpg-connect-agent killagent /bye && gpg-connect-agent /bye'
    end

    function set-ssh-auth-sock -a socketname
        if [ $socketname = "none" ]
            unset -x SSH_AUTH_SOCK
            return
        end

        if [ ! -f $_authsockets ]
            echo "no auth sockets found"
            return
        end

        while read name file
            if [ $name = $socketname ]
                echo set -x SSH_AUTH_SOCK $file | source
                return
            end
        end < $_authsockets

        echo "no auth socket found by name"
    end

    if [ -f $HOME/.ssh/defaultsocket.conf ]
        set-ssh-auth-sock (cat $HOME/.ssh/defaultsocket.conf)
    end
end

complete -c set-ssh-auth-sock -f
complete -c set-ssh-auth-sock -a "(cut -d' ' -f1 $_authsockets)"
