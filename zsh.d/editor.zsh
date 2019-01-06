whence -p joe > /dev/null || alias joe=vim
for editor in "code -w" "subl -w" "mate -w" "mvim -f" vim joe vi; do
  if whence -p ${editor% *} > /dev/null; then
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
