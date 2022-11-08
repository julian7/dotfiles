for homebrew in /usr/local/opt /opt/homebrew/opt
    if [ -f $homebrew/ruby/bin ]
        set -ga fish_user_paths $homebrew/ruby/bin
        set -xp LDFLAGS "-L$homebrew/ruby/lib"
        set -xp CPPFLAGS "-I$homebrew/ruby/include"
        set -U XDG_DATA_DIRS "$homebrew/chruby-fish/share"
    end
end

alias b='bundle'
alias be='bundle exec'
alias r='bin/rails'
alias serve='ruby -run -e httpd . -p 9000'
