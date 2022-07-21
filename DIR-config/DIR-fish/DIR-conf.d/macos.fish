alias ldd='otool -L'
alias proute='netstat -nrf inet | grep -v H'

if command -qs reattach-to-user-namespace
  set -x REATTACH_CMD "reattach-to-user-namespace"
  set -x REATTACH_SHELL "$REATTACH_CMD -l $SHELL"
end
