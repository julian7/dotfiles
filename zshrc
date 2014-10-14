# Add function path
fpath=($HOME/.zsh.d $fpath)

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

# Load configuration source files
for srcfile ($HOME/.zsh.d/*.zsh) source $srcfile

# Load local customizations
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
