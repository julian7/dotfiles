function addpath {
  orig=$1
  new=$2
  if [[ -d "$new" && ":$orig:" != *":$new:"* ]]; then
    echo "$new:$orig"
  else
    echo "$orig"
  fi
}

# Add function path
fpath=($HOME/.zsh.d $fpath)

# Load configuration source files
for srcfile ($HOME/.zsh.d/*.zsh) source $srcfile

# Load and run compinit
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit

# Default aliases
[[ $(uname) = *BSD ]] || alias grep='grep -a --color=always'
which ack-grep > /dev/null && alias ack=ack-grep

# Load local customizations
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
