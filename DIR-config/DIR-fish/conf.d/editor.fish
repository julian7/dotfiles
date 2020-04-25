command -qs joe || alias joe=vim

begin
    set -l editor
    for editor in "code -w" "subl -w" "mate -w" "mvim -f" vim joe vi
        if command -qs (string split " " $editor)[1]
            set -x EDITOR "$editor"
            break
        end
    end
end

if [ "$EDITOR" = mvim ]
    alias vi=mvim
    alias gvim=mvim
else
    alias vi=vim
end
