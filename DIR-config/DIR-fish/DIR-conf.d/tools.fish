if command -qs eza
  alias ls=eza
else if command -qs exa
  alias ls=exa
end

if command -qs starship
  function starship_transient_prompt_func
    starship prompt --profile transient
  end
  starship init fish | source
  enable_transience
end
