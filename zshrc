function pathadd {
  [[ -d "$1" ]] && path=("$1" ${path:#$1})
}

# Add function path
fpath=($HOME/.zsh.d $fpath)

# Load configuration source files
for srcfile ($HOME/.zsh.d/*.zsh) source $srcfile

# Load and run compinit
autoload -U compinit
compinit -i

# Default aliases
alias grep='grep -a --color=always'
which ack-grep > /dev/null && alias ack=ack-grep

# Load local customizations
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
