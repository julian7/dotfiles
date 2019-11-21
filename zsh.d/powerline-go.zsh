if whichX powerline-go; then
    PROMPT='$(powerline-go -error $? -shell zsh -colorize-hostname -cwd-mode plain -modules venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root,docker)'
fi
