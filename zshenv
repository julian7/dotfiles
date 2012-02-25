PAGER=less
LESS="-R -m"
HISTFILE=$HOME/.zshist
HISTSIZE=1000
SAVEHIST=2000
PROMPT='%n@%m-[%~]$(__git_prompt_info " %%{%%B${fg[green]}%%}‹%s›%%{${reset_color}%%b%%}") %# '
test -f $HOME/.zshenv.local && source $HOME/.zshenv.local
