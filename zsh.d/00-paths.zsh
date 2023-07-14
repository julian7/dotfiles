addpath() {
  new="$1"
  read orig
  test -d "$new" || { echo "$orig"; return; }
  test -z "$orig" && { echo "$new"; return; }
  orig=":$orig:"
  left=${orig%:$new:*}
  if [[ "$left" != "$orig" ]]; then
    orig="$left:"${orig#*:$new:}
  fi
  echo "$new${${orig%:}%:}"
}

path=(
  $HOME/bin
  $HOME/.bin
  $HOME/.cargo/bin
  $HOME/.rbenv/bin
  $HOME/.yarn/bin
  $HOME/.rd/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /opt/X11/bin
  /Applications/Keybase.app/Contents/SharedSupport/bin
)

export path
