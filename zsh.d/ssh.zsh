: ${HOSTNAME:=$(hostname)}
: ${SSHTOKEN:=$HOME/.ssh/token-$HOSTNAME}
function _save_ssh_agent() {
  set | command grep -a SSH_AUTH_SOCK > $SSHTOKEN
}

function _set_ssh_agent() {
  source $SSHTOKEN
  export SSH_AUTH_SOCK
}

function getagent() {
  if [[ ! -e ${SSH_AUTH_SOCK:-none} ]]; then
    _set_ssh_agent
  fi
  ssh-add -l
}

function setagent() {
  if [[ -e $SSH_AUTH_SOCK ]]; then
    _save_ssh_agent
  fi
}
setagent
