PATH=`echo $PATH |
  addpath /usr/local/opt/ruby/bin`
export PATH
export LDFLAGS="-L/usr/local/opt/ruby/lib $LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/ruby/include $CPPFLAGS"

alias b='bundle'
alias be='bundle exec'
alias r='bin/rails'
alias serve='ruby -run -e httpd . -p 9000'
