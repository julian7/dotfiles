if command -qs zellij && status is-interactive
    eval (zellij setup --generate-completion fish | string collect)
end
