if [[ -z "$SSH_AUTH_SOCK" ]] && whichX gpg-connect-agent; then
    export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
    gpg-connect-agent /bye 2>&1 > /dev/null || echo "Cannot start gpg-agent"
    alias reagent='gpg-connect-agent killagent /bye && gpg-connect-agent /bye'
fi
