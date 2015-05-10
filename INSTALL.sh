#!/bin/sh

LANG=C

handle_file() {
  file=${1}
  prefix=${2:-}
  dirname=${3:-}
  instfile="$HOME/.${prefix}${file}"
  fullname="$PWD/${dirname}${file}"
  if [ -e "$instfile" ]; then
    if test -L "$instfile" -a "x"`readlink "$instfile"` = "x$fullname"; then
      return
    fi
    echo -n "${instfile#$HOME/} already exists. What now? Diff / Replace / Skip [drs]: "
    read R
    case $R in
      d|D)
        diff -sudw ${instfile} ${fullname}
        handle_file ${file} ${prefix} ${dirname}
        return
        ;;
      r|R)
        mv ${instfile} ${instfile}.dotfile-$$
        ;;
      s|S)
        return
        ;;
    esac
  fi
  test -e ${instfile} || ln -s ${fullname} ${instfile}
}

cd `dirname $0`

for file in `ls -d [a-z]*`; do
  handle_file ${file}
done

for dir in `ls -d DIR-[a-z]* 2>/dev/null`; do
  prefix=${dir#DIR-}
  mkdir -p "${HOME}/.${prefix}"
  for file in `ls ${dir}`; do
    handle_file ${file} ${prefix}/ ${dir}/
  done
done

touch $HOME/.gitconfig
