if test -f /usr/local/share/chruby/chruby.sh; then
  setopt no_aliases
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  setopt aliases
fi
