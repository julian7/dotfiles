set -x DISABLE_LEEK true

command -qs yarn && set -xa path (yarn global bin)
set -x NODE_VERSIONS $HOME/.local/share/nvm
set -x NODE_VERSION_PREFIX v
