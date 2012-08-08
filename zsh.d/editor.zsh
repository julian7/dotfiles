which joe > /dev/null || alias joe=vim
for editor in "subl -w" "mate -w" joe mvim gvim vim vi; do
  if which ${editor% *} > /dev/null; then
    export EDITOR=${editor}
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
