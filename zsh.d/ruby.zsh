PATH=`echo $PATH |
  addpath /opt/homebrew/opt/ruby/bin`
export PATH
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include $CPPFLAGS"

alias b='bundle'
alias be='bundle exec'
alias r='bin/rails'
alias serve='ruby -run -e httpd . -p 9000'
whichX rbenv && eval "$(rbenv init -)"

if [[ -f /opt/homebrew/share/chruby/chruby.sh ]]; then
  setopt no_aliases
  source /opt/homebrew/share/chruby/chruby.sh
  source /opt/homebrew/share/chruby/auto.sh
  setopt aliases
fi
