begin
    set -l fisher $__fish_config_dir/functions/fisher.fish
    if [ ! -e $fisher ]
        curl https://git.io/fisher --create-dirs -sLo $fisher
        source $fisher
        fisher
    end
end
