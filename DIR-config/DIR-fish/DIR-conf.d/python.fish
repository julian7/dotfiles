set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
if command -qs pyenv
    pyenv init - | source
end
