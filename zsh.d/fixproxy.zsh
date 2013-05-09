: ${NETWORKSERVICE:=Wi-Fi}
function fixproxy() {
  local NS=/usr/sbin/networksetup
  local i var setting
  for i in web:http secureweb:https ftp:ftp; do
    setting=${i%:*}
    var=${i#*:}
    __setproxyaddress ${var}_proxy `$NS -get${setting}proxy ${NETWORKSERVICE} | __getproxyaddress`
  done
  setting=`$NS -getproxybypassdomains ${NETWORKSERVICE} | tr '\n' , | sed 's/,$//'`
  __setproxyaddress NO_PROXY ${setting}
}

function __getproxyaddress() {
  local key val
  local server="" port="80"
  while IFS=' ' read key val; do
    case $key in
      "Enabled:")
        [ ${val} = "No" ] && return
        ;;
      "Server:")
        server=${val} ;;
      "Port:")
        port=${val} ;;
    esac
  done
  echo "http://$server:$port"
}

function __setproxyaddress() {
  local variable=$1
  local setting=$2
  if [ -n "$setting" ]; then
    export $variable=$setting
  else
    unset $variable
  fi
}
