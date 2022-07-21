command -qs joe || alias joe=vim

begin
    set -l editor
    for editor in "codium -w" "code -w" "subl -w" "mate -w" "neovide" "nvim" "mvim -f" vim joe vi
        if command -qs (string split " " $editor)[1]
            set -x EDITOR "$editor"
            break
        end
    end
end

switch "$EDITOR";
case 'mvim*'
    alias vi=mvim
    alias gvim=mvim
case '*'
    alias vi=vim
end

if command -qs nvim
    alias vi=nvim
    alias vim=nvim
    alias gvim=nvim
end
