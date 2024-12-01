# Julian7's dotfiles

This is my more or less educated guess on how to use a unix system. I use ZSH and FISH,
therefore you won't find any other configurations (maybe bash later, as a fallback).

## ZSH config

Most parts of the config is separated into various .zsh files in ~/.zsh.d.
Notable settings:

* editor: finds proper EDITOR var, creates some convenience aliases
* osx-proxy-icons: adds proxy icon support to OSX Terminal
* paths: extra path settings for rust, rbenv, Rancher Desktop
* ruby: some ruby and ruby on rails aliases, sets up chruby / rbenv
* settings: ZSH settings
* ssh: GnuPG / Secretive agent support, Updates terminal titles on SSH
* tmux: aliases and ssh title replacer function

## FISH config

Fish settings are in ~/.config/fish/conf.d directory, which is 100% controlled by
this repository. Notable settings:

* paths: it adds a lot of convenience paths such as $HOME/bin and $HOME/.bin, keybase, homebrew, etc.
* chefdk: aliases
* direnv: loads fish hooks for direnv
* docker: convenience aliases
* editor: selects best editor, sets EDITOR environment variable, convenience aliases
* fisher-bootstrap: downloads and runs fisher package manager
* go: best practice variables
* k8s: convenience aliases
* node: yarn settings
* python: python settings, pyenv (if installed).
* ruby: convenience aliases, chruby-fish (if installed).
* ssh: yubikey's OpenPGP ssh agent handling
* tmux: aliases
* tools: [modern unix tool alternatives](https://zaiste.net/posts/shell-commands-rust/)
* vault: auth alias
* wsl2: Yubikey support on Windows WSL2 environment: connects gpg-agent and
  ssh-agent with gpg4win, if wsl2-ssh-pageant.exe is available

Fish plugins are managed by fisher, and installed fisher plugins are controlled by
this repository.

### Plugins

* [fisher](https://github.com/jorgebucaran/fisher): package manager for fish

## Other dotfiles

* ack
* git: global gitconfig and gitignore
* terraform/tofu: to have a central plugin cache. Set `TF_CLI_CONFIG_FILE`
  variable to a different file if you want to modify it.
* tmux

## aliases and functions

* ack: ack-grep (if ack-grep is installed)
* b: bundle (ruby)
* be: bundle exec (ruby)
* ce: chef exec (chefdk)
* cbe: chef exec bundle exec (chefdk)
* dex: docker exec -ti, running sh by default
* dstat (dip) shows docker images' IP addresses and memory consumption
* dps: nicer docker ps
* grep: grep -a --color=always (general)
* gvim: set to mvim (if installed)
* joe: set to 'vim' on systems where joe is not installed
* k: kubectl
* killagent: more drastic `gpg-agent` restarter, when `reagent` is not enough
* kubesh: runs a docker image on kubernetes interactively
* ls: uses [exa](https://github.com/ogham/exa) if available
* mate\_wait: non-forking textmate
* r: script/rails (ruby)
* reagent: re-runs `gpg-agent` in case it becomes unavailable
* serve: simple ruby-based static webserver
* t: tmux -u (tmux)
* tax: tofu apply x
* tf: tofu
* tpx: tofu plan -out x
* vaultauth: runs userpass authentication to vault
* vi: set to nvim, vim or mvim (if installed)
* vim: set to nvim (if installed)

## GIT aliases

* aa: add --all
* br: branch
* ci: commit
* co: checkout
* cp: cherry-pick
* dc: diff --cached
* di: diff
* fm: full merge (merge --no-ff)
* h: pretty oneline history
* largest: shows largest *n* (default: 10) files in git repository
* man: help
* s: switch (replacing checkout)
* st: status -sb (shorter status)
* unadd: reset HEAD
* upstream: shows current branch's default remote

## scripts

* colorcolumn: just like 'column', but ANSI-colors-aware
* kcx: kubernetes context switcher
* kns: kubernetes namespace switcher
* repostat: finds git repos in your path, and shows repo cleanliness
* set-ssh-auth-sock: changing current SSH_AUTH_SOCK value. Currently `1pw` (1Password), `gpg` and `secretive` are supported.

## Installation

* Clone repo: `git clone https://github.com/julian7/dotfiles.git`
* Change to `dotfiles` dir
* Run `./INSTALL.sh`
* Modify your `~/.config/git/config` file to reflect your personal setup
  (like user.name and user.email settings), as ~/.gitconfig is managed
  by dotfiles.

Example `~/.config/git/config` file:

```init
[user]
  name = Random J. Hacker
  email = rjh@example.com
[includeIf "gitdir:/Volumes/Work/**"]
  path = /Volumes/Work/.gitconfig
```

* Set default SSH_AUTH_SOCK setter: if the system-provided `SSH_AUTH_SOCK` is
  not enough, you can choose from extra sockets (see `~/.ssh/sockets.conf`).
  The file format is `<NAME> <Path to socket>`. No comments allowed.

  Create the file `~/.ssh/defaultsocket.conf` with a single line containing
  the name of your chosen socket provider, like `1pw`, `gpg` or `secretive`.

* Install `vim-plug` for vim plugins. Neovim config uses `git` to install `lazy.nvim` on first run.

## Making changes

These changes are good for me, but you might want to have other settings (you
don't want to publish your changes into git using my email address, do you?).
This is where git comes handy.

* Clone the repo and install (see above)
* Make your changes
* Commit changes (creating a local branch is a bonus)

Local changes can go to

* `~/.zshrc.local`
* `~/.zshenv.local`
* `~/.zlogin.local`
* `~/.config/fish/config.fish` (in case of using fish shell)
* `~/.gitconfig.local` (local git config)
* `~/.config/nvim/lua/local/init.lua` (local neovim config)
* `~/.config/wezterm/local.lua` (local wezterm config)

which are loaded at the end of the respective original scripts.

## Upgrading

* Fetch changes from GitHub
* Merge changes with your changes (rebase works pretty well if you don't want
  to publish your repo anywhere)
* Enjoy

## Requirements

* zsh / fish
* git

### MacOS-specific

An independent script, `MAC.sh` is provided to do the first steps for installing basic applications. It

* Installs [Homebrew](https://brew.sh/). This is the easiest way of managing packages.
* Runs `brew bundle install` to install all taps, brews, and casks, defined in `Brewfile`.
* Installs Mac AppStore apps with `mas` CLI.
* Sets sensible defaults to the Dock, and restarts it.

## Extensions in mind

* [chruby](https://github.com/postmodern/chruby): ruby selector environment: install with `brew install chruby`.
* [chruby-fish](https://github.com/JeanMertz/chruby-fish): wrapper around chruby for fish shell. Install with `brew install chruby-fish`.
* [direnv](https://github.com/direnv/direnv): Environment switcher for shell (included).
* [dust](https://github.com/bootandy/dust): a more intuitive du, written in rust (included).
* [eza](https://github.com/eza-community/eza): Modern ls replacement, written in rust (included).
* [fzf](https://github.com/junegunn/fzf): command line fuzzy finder in shell history (included).
* [GNU Privacy Guard](https://gnupg.org/): OpenPGP implementation. Currently requires a MacOS-only pinentry program (included)
* [kitty](https://sw.kovidgoyal.net/kitty/) terminal: fast, feature-rich, GPU-based terminal emulator for Linux, Mac, and BSDs
* [lazygit](https://github.com/jesseduffield/lazygit): CLI UI for git. Its neovim plugin allows lazygit integration, which makes fugitive basically obsolete (included).
* [Neovim](https://neovim.io/): Vim-based text editor, successor of Vim (included).
* [Neovide](https://neovide.dev/): Simple cross-platform GUI for Neovim (included).
* [lazy.nvim](https://github.com/folke/lazy.nvim): Neovim plugin manager. Installs automatically using `git`.
* [pinentry-mac](https://github.com/GPGTools/pinentry-mac): GUI-based pinentry app for MacOS. Currently this is the pinentry application for GnuPG (included).
* [rbenv](https://github.com/sstephenson/rbenv): ruby selector environment: `brew install rbenv` / see README
* [ripgrep](https://github.com/BurntSushi/ripgrep): blazing fast `grep -r` replacement (included).
* [ruby-install](https://github.com/postmodern/ruby-install): ruby builder for chruby: see README
* [ruby-build](https://github.com/sstephenson/ruby-build): ruby builder for rbenv: see README
* [rust](https://www.rust-lang.org/): Environment setup for the Rust programming language. Run `rustup-init` to install rust packages. Subsequent updates can be done running `rustup update` (included).
* [Secretive](https://github.com/maxgoedjen/secretive): stores SSH keys in Secure Enclave (mac only; included).
* [starship](https://starship.rs/): blazing-fast multi-shell command prompt (included).
* [tmux](https://github.com/tmux/tmux): terminal multiplexer. You will love it, especially if you use PuTTY or any non-tabbed terminal clients (included).
* [vim-plug](https://github.com/junegunn/vim-plug): Minimalist Vim Plugin Manager, used for vim installations (not for Neovim!).
  Run `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim` to install, and then run `vim -c PlugInstall -c exit -c exit` to configure.
* [wezterm](https://wezfurlong.org/wezterm/): cross-platform terminal emulator and multiplexer written in rust (included).
* [wsl2-ssh-pageant](https://github.com/BlackReloaded/wsl2-ssh-pageant): tunnels gpg4win's gpg agent into wsl2. To install, put the windows executable into your `$HOME/.ssh` in your wsl2 environment.
* [zellij](https://zellij.dev/): terminal multiplexer. I love this one better than tmux or screen.

## Text font recommendations

The following fonts are all available in `homebrew/cask` (default) cask. Install individual fonts with `brew install --cask font-XXX` (where `font-XXX` is the font name).

Shell Prompt generators, Vim statuslines require extra characters, [Nerdfonts](https://nerdfonts.com/) are recommended.

* Comic Mono: only for the lulz. Cask font name: `font-comic-mono` (included). Unfortunately, its Nerdfont version doesn't have a convenient install, it has to be installed manually from [xtevenx/ComicMonoNF](https://github.com/xtevenx/ComicMonoNF) repo.
* [FiraCode](https://github.com/tonsky/FiraCode): the first code font with ligatures (included). Font names: `font-fira-code`, `font-fira-code-nerd-font`.
* [Iosevka](https://github.com/be5invis/Iosevka) font. Narrow, but well-readable. It has ligatures and powerline support. Font names: `font-iosevka`, `font-iosevka-nerd-font` (included).
* [JetBrains Mono](https://www.jetbrains.com/lp/mono/): monospace font from JetBrains. Font names: `font-jetbrains-mono`, `font-jetbrains-mono-nerd-font`. Note: this is the default font in all GUI settings (included).
* Source Code Pro / Sauce Code Pro Nerd font: Font names: `font-source-code-pro`, `font-sauce-code-pro-nerd-font`.

## Copyright

[![Creative Commons Licence](http://i.creativecommons.org/l/by/3.0/88x31.png)](http://creativecommons.org/licenses/by/3.0/)
This work is licensed under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).
