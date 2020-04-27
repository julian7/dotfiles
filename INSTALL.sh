#!/usr/bin/env bash

LANG=C

fixpath () (
  if [[ -d $1 ]]; then
    OLDPWD=- CDPATH= cd -P -- "$1" && pwd
  else
    OLDPWD=- CDPATH= cd -P -- "${1%/*}" && printf '%s/%s\n' "$PWD" "${1##*/}"
  fi
)

install_dir() {
  local source="${1}"
  local destination="${2}"
  local prefix="${3:-}"

  for name in "${source}"/*; do
    [[ "$name" =~ /\*$ ]] && break
    [[ "$name" =~ /[A-Z]*\.[a-z0-9]*$ ]] && continue
    local base="${name#${source}/}"
    base=${base#DIR-}
    local indest="${destination}/${prefix}${base}"
    if [[ -d "${name}" && "${name}" =~ /DIR-[^/]*$ ]]; then
      mkdir -p "${indest}"
      install_dir "${name}" "${indest}"
    else
      install_file "${name}" "${indest}"
    fi
  done
}

install_file() {
  local source="${1}"
  local destination="${2}"

  if [[ -e "${destination}" ]]; then
    if [[ -L ${destination} && "$(readlink "${destination}")" == "$(fixpath "${source}")" ]]; then
      return
    fi
    echo -n "${destination#$HOME/} already exists. What now? Diff / Replace / Skip [drs]: "
    read R
    case $R in
      d|D)
        diff -sudw "${destination}" "${source}"
        install_file "${source}" "${destination}"
        return
        ;;
      r|R)
        local newdest="${destination}.dotfile-$$"
        mv "${destination}" "${newdest}"
        echo "Storing '${destination}' as '${newdest}'"
        ;;
      s|S)
        return
        ;;
    esac
  fi
  test -e "${destination}" || ln -s "${source}" "${destination}"
}

cd `dirname $0`

install_dir "$PWD" "$HOME" "."

touch $HOME/.gitconfig
