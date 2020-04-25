if isatty && command -qs gpg-connect-agent
    set -x SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"
    gpg-connect-agent /bye 2>&1 > /dev/null || echo "Cannot start gpg-agent"
    alias killagent='killall -9 gpg-agent && gpg-connect-agent /bye'
    alias reagent='gpg-connect-agent killagent /bye && gpg-connect-agent /bye'
end
