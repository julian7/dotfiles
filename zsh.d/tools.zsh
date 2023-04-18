whence -p exa > /dev/null && alias ls=exa
if whence -p starship > /dev/null; then
    eval "$(starship init zsh)"
elif whence -p powerline-go > /dev/null; then
    PROMPT='$(powerline-go -error $? -shell zsh -colorize-hostname -cwd-mode plain -modules venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root,docker)'
fi
