export PAGER=less
export LESS="-R -m"
HISTFILE=$HOME/.zshist
HISTSIZE=1000
SAVEHIST=2000
PROMPT='%n@%m [%{$fg[blue]%}%~%{$reset_color%}]$(__git_prompt_info " %%{$fg[green]%%}‹%s›%%{$reset_color%%}") %# '
test -f $HOME/.zshenv.local && source $HOME/.zshenv.local
