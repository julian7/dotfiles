functions -q fzf_key_bindings || source (string join / (string split / (realpath (command -s fzf)))[1..-3])/shell/key-bindings.fish
