set wsl2_pageant "$HOME/.ssh/wsl2-ssh-pageant.exe"

if [ -x "$wsl2_pageant" ]
  set -x SSH_AUTH_SOCK $HOME/.ssh/agent.sock
  ss -a | grep -q $SSH_AUTH_SOCK
  if [ $status != 0 ]
    rm -f $SSH_AUTH_SOCK
    setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"$wsl2_pageant" >/dev/null 2>&1 &
  end

  set -x GPG_AGENT_SOCK $HOME/.gnupg/S.gpg-agent
  ss -a | grep -q $GPG_AGENT_SOCK
  if [ $status != 0 ]
    rm -rf $GPG_AGENT_SOCK
    setsid nohup socat UNIX-LISTEN:$GPG_AGENT_SOCK,fork EXEC:"'$wsl2_pageant' --gpg S.gpg-agent" >/dev/null 2>&1 &
  end
end
