_find_rack_root() {
  local basedir=${PWD}
  while [[ ${basedir} != '' ]]; do
    test -e ${basedir}/config.ru && break
    basedir=${basedir%/*}
  done
  echo $basedir
}

_find_dev_host() {
  echo ${${1##*/}%.*}
}

powit() {
  local vhost=$1
  local basedir=$(_find_rack_root)
  local hostlink
  : ${vhost:=$(_find_dev_host $basedir)}
  local powdir=${HOME}/.pow
  if [[ ${basedir} == '' ]]; then
    echo No rack application found
    echo "(or, don't put a rack app to the root directory)"
    return 1
  fi
  if [ -h ${powdir}/$vhost ]; then
    echo A pow link already exists:
    readlink ${powdir}/${vhost}
    return 1
  fi
  if [ -e ${powdir}/$vhost ]; then
    echo Something is in the way:
    ls -ld ${powdir}/$vhost
    return 1
  fi
  ls ${powdir} | while read hostlink; do
    if [[ $(readlink ${powdir}/$hostlink) == ${basedir} ]]; then
      echo This app is already registered with pow with a different name:
      echo $hostlink
      echo Please try to browse http://$hostlink.dev/
      return 1
    fi
  done
  echo ln -s ${basedir} ${powdir}/$vhost
}
