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

PATH=`echo $PATH |
  addpath /usr/local/share/npm/bin |
  addpath /usr/local/sbin |
  addpath /usr/local/bin |
  addpath $HOME/bin`
export PATH
