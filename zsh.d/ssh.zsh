if [[ -z "$SSH_TTY" ]]; then
    export _authsockets=$HOME/.ssh/sockets.conf

    if whichX gpg-connect-agent; then
        gpg-connect-agent /bye 2>&1 > /dev/null || echo "Cannot start gpg-agent"
        alias killagent='killall -9 gpg-agent && gpg-connect-agent /bye'
        alias reagent='gpg-connect-agent killagent /bye && gpg-connect-agent /bye'
    fi

    function set-ssh-auth-sock() {
        local socketname="$1"

        if [[ "$socketname" == "none" ]]; then
            unset SSH_AUTH_SOCK
            return
        fi

        if [[ ! -f "$_authsockets" ]]; then
            echo "no auth sockets found"
            return
        fi

        while read name file; do
            if [[ "$name" == "$socketname" ]]; then
                export SSH_AUTH_SOCK="$(eval echo $file)"
                return
            fi
        done < "$_authsockets"

        echo "no auth socket found by name"
    }

    if [[ -f "$HOME/.ssh/defaultsocket.conf" ]]; then
        set-ssh-auth-sock $(cat $HOME/.ssh/defaultsocket.conf)
    fi
fi
