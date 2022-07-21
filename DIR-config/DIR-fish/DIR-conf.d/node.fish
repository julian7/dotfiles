set -x DISABLE_LEEK true

command -qs yarn && set -xa path (yarn global bin)
