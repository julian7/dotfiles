alias t="tmux -u"
alias tvh="tmux split-window -p75 '$REATTACH_CMD vim .'"

function _set_tmux_title
    set -l title "$1"
    or set -l title "$hostname"

    switch $TERM
    case "screen*"
        printf "\ek%s\e\\" $title
    case "xterm*"
        printf "\e]0;%s\a" $title
    end
end
isatty && _set_tmux_title
