begin
    if ! functions -q fisher
        curl https://git.io/fisher | source &&
        fisher install jorgebucaran/fisher
    end
end
