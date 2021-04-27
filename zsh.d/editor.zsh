whence -p joe > /dev/null || alias joe=vim
for editor in "code -w" "subl -w" "mate -w" "nvim" "mvim -f" vim joe vi; do
  if whence -p ${editor% *} > /dev/null; then
    export EDITOR=${editor}
    break
  fi
done
case ${EDITOR% *} in
    mvim)
        alias vi=mvim
        alias gvim=mvim
        ;;
    *)
        alias vi=vim
        alias gvim=vim
esac

if whence -p nvim > /dev/null; then
    alias vi=nvim
    alias vim=nvim
    alias gvim=nvim
fi
