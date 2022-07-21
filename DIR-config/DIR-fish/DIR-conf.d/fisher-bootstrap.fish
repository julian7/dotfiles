begin
    if status --is-interactive && ! functions -q fisher && command -qs curl && [ -z "$_fish_installing" ]
        set -x _fish_installing 1
        curl -sSL https://git.io/fisher | source &&
        fisher update
        set -u _fish_installing
    end
end
