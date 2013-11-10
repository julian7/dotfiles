# Automatically run Ruby scripts from binstubs if exist.
# Github: https://github.com/gma/bundler-exec

## Functions

within-bundled-project()
{
    local dir=${PWD}
    while [ ${dir} != "/" ]; do
        if [ -f "$dir/Gemfile" ]; then
            echo "$dir"
            return 0
        fi
        dir=$(dirname $dir)
    done
    return 1
}

run-with-bundler()
{
    local cmd=$1
    shift
    `call-with-bundler $cmd` "$@"
}

call-with-bundler()
{
    local cmd=$1
    local binstub=$(within-bundled-project)
    if [ -n "${binstub}" ]; then
        binstub="${binstub}/bin/${cmd}"
        if [ -x ${binstub} ]; then
            echo ${binstub}
        else
            echo "bundle exec $cmd"
        fi
    else
        which -p ${cmd}
    fi
}

## Main program

BUNDLED_COMMANDS="${BUNDLED_COMMANDS:-
cap
capify
cucumber
foreman
guard
haml
html2haml
mina
pry
puma
rackup
rake
rake2thor
rump
rspec
sass
sass-convert
serve
shotgun
slimrb
spork
thin
thor
tilt
tt
turn
unicorn
unicorn_rails
yard
yardoc
yri
}"

echo $BUNDLED_COMMANDS | while read CMD; do
    if [[ $CMD != "" && $CMD != "bundle" && $CMD != "gem" ]]; then
        alias $CMD="run-with-bundler $CMD"
    fi
done
