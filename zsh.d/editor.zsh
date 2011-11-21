which mate > /dev/null && alias mate_wait='mate -w'
for editor in mate_wait joe mvim gvim vim vi; do
  if which $editor > /dev/null; then
    export EDITOR="$editor"
    break
  fi
done