set -ga fish_user_paths /usr/local/opt/ruby/bin
set -xp LDFLAGS "-L/usr/local/opt/ruby/lib"
set -xp CPPFLAGS "-I/usr/local/opt/ruby/include"

alias b='bundle'
alias be='bundle exec'
alias r='bin/rails'
alias serve='ruby -run -e httpd . -p 9000'
