[[ -e $HOME/.dvm/dvm.sh ]] && source $HOME/.dvm/dvm.sh

alias dps="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'"
