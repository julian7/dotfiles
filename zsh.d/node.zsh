export DISABLE_LEEK=true
if which yarn >/dev/null 2>&1; then
    path+=( $(yarn global bin) )
    export path
fi
