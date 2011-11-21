which joe > /dev/null || alias joe=vim
which mate > /dev/null && alias mate_wait='mate -w'
for editor in mate_wait joe mvim gvim vim vi; do
  if which $editor > /dev/null; then
    export EDITOR="$editor"
    break
  fi
done
if [[ $EDITOR = mvim ]] > /dev/null
then
  alias vi=mvim
  alias gvim=mvim
else
  alias vi=vim
fi
