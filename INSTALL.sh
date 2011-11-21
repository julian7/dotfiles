#!/bin/sh

handle_file() {
  instfile="$HOME/.$file"
  fullname="$PWD/$file"
  if [ -e "$instfile" ]; then
    if test -L "$instfile" -a "x"`readlink "$instfile"` = "x$fullname"; then
      return
    fi
    /bin/echo -n ".$file already exists. What now? Diff / Replace / Skip [drs]: "
    read R
    case $R in
      d|D)
        diff -sudw $HOME/.$file $file
        handle_file "$file"
        return
        ;;
      r|R)
        mv $HOME/.$file $HOME/.$file.dotfile-$$
        ;;
      s|S)
        return
        ;;
    esac
  fi
  ln -s $PWD/$file $HOME/.$file
}

cd `dirname $0`

for file in [a-z]*; do
  handle_file $file
done
