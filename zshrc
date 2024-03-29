SHELL=${0#-}
# Add function path
fpath=($HOME/.zsh.d $fpath)

# Load and run compinit
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
autoload -U promptinit
promptinit
setopt PROMPT_SUBST

whichX() {
    whence -c "$@" > /dev/null 2>&1
}

# Default aliases
[[ $(uname) = *BSD ]] || alias grep='grep -a --color=always'
whichX ack-grep && alias ack=ack-grep

# Default variables
export PROMPT='%n@%m [%F{blue}%~%f] %# '

# Load configuration source files
for srcfile ($HOME/.zsh.d/*.zsh) source $srcfile

# Load local customizations
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
