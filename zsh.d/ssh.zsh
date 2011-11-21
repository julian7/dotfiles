: ${HOSTNAME:=$(hostname)}
: ${SSHTOKEN:=$HOME/.ssh/token-$HOSTNAME}
function _save_ssh_agent() {
  set | grep -a SSH_AUTH_SOCK > $SSHTOKEN
}

function _set_ssh_agent() {
  source $SSHTOKEN
}

function setagent() {
  if [[ ! -e ${SSH_AUTH_SOCK:-none} ]]; then
    _set_ssh_agent
  fi
}

function saveagent() {
  if [[ -e $SSH_AUTH_SOCK ]]; then
    _save_ssh_agent
  fi
}
saveagent