if command -qs eza
  alias ls=eza
else if command -qs exa
  alias ls=exa
end

command -qs starship && starship init fish | source
