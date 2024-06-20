require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
      "bash", "dockerfile", "fish", "git_config", "gitignore", "gitattributes", "git_rebase",
      "glimmer", "go", "gomod", "gosum", "gowork", "graphql", "hcl", "html", "http", "ini",
      "javascript", "jq", "json", "json5", "jsonc", "lua", "make", "mermaid", "perl", "php",
      "proto", "python", "ruby", "rust", "scss", "sql", "svelte", "terraform", "toml",
      "typescript", "vue", "yaml"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

