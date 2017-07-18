if test $(uname) = "Darwin"; then
  update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
    printf '\e]0;%s\a' ${PWD/#$HOME/\~}
  }
  autoload add-zsh-hook
  add-zsh-hook chpwd update_terminal_cwd
  update_terminal_cwd

  alias ldd='otool -L'
  alias proute='netstat -nrf inet | grep -v H'

  # use reattach with tmux if there is one
  if whichX reattach-to-user-namespace; then
    export REATTACH_CMD="reattach-to-user-namespace"
    export REATTACH_SHELL="$REATTACH_CMD -l zsh"
  fi

  scutil_query() {
    local key=$1
    scutil <<-EOT
      open
      get $key
      d.show
      close
EOT
  }
  scutil_value_query() {
    local key=$1
    local val=$2
    scutil_query "$1" | grep "$2" | sed 's/^.* : //'
  }

  function __getproxyaddress() {
    local key val
    local server="" port="80" url=""
    while IFS=' ' read key val; do
      case $key in
        "Enabled:")
          [ ${val} = "No" ] && return
          ;;
        "Server:")
          server=${val} ;;
        "Port:")
          port=${val} ;;
        "URL:")
          url=${val} ;;
      esac
    done
    if [[ -n "$url" ]]; then
      echo $url
    else
      echo "http://$server:$port"
    fi
  }

  function __setproxyaddress() {
    local variable=$1
    local setting=$2
    if [ -n "$setting" ]; then
      export $variable=$setting
      return 0
    else
      unset $variable
      return 1
    fi
  }

  function networkservice() {
    SERVICE_GUID=$(scutil_value_query State:/Network/Global/IPv4 PrimaryService)
    NETWORKSERVICE=$(scutil_value_query Setup:/Network/Service/$SERVICE_GUID UserDefinedName)
    export NETWORKSERVICE
  }

  function fixproxy() {
    local SERVICE_GUID=$(scutil_value_query State:/Network/Global/IPv4 PrimaryService)
    local NETWORKSERVICE="$(scutil_value_query Setup:/Network/Service/$SERVICE_GUID UserDefinedName)"
    local NS=${NETWORKSETUP:-/usr/sbin/networksetup}
    local i var setting addr
    local -i success=0
    for i in web:http secureweb:https ftp:ftp; do
      setting=${i%:*}
      var=${i#*:}
      __setproxyaddress ${var}_proxy $($NS -get${setting}proxy ${NETWORKSERVICE} | __getproxyaddress) &&
        success+=1
    done
    setting=`$NS -getproxybypassdomains ${NETWORKSERVICE} | tr '\n' , | sed 's/,$//'`
    __setproxyaddress NO_PROXY ${setting}

    if ((success==0)); then
      setting=$($NS -getautoproxyurl ${NETWORKSERVICE} | __getproxyaddress)
      if [[ -n ${setting} ]]; then
        var=$(curl -s $setting |
          grep PROXY |
          tr -d \; |
          cut -d'"' -f2 |
          cut -d' ' -f2 |
          head -1)
        for i in http https ftp; do
          __setproxyaddress ${i}_proxy http://$var
        done
      fi
    fi
  }

  networkservice > /dev/null
fi
