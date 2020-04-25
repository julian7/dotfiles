# Julian7's dotfiles

This is my more or less educated guess on how to use a unix system. I use ZSH and FISH,
therefore you won't find any other configurations (maybe bash later, as a fallback).

## ZSH config

Most parts of the config is separated into various .zsh files in ~/.zsh.d.
Notable settings:

* editor: finds proper EDITOR var, creates some convenience aliases
* git: git prompt
* osx-proxy-icons: adds proxy icon support to OSX Terminal
* paths: extra path
* chruby: chruby bootstrap (if installed)
* rbenv: rbenv bootstrap (if installed)
* ruby: some ruby and ruby on rails aliases
* settings: ZSH settings
* ssh: GnuPG agent support
* GBT: Powerline-like prompt (if installed). Alternatively, you can use powerline-go.
* tmux: aliases and ssh title replacer function

## FISH config

Fish settings are in ~/.config/fish/conf.d directory, which is 100% controlled by
this repository. Notable settings:

* paths: it adds a lot of convenience paths such as $HOME/bin and $HOME/.bin
* chefdk: aliases
* direnv: loads fish hooks for direnv
* docker: convenience aliases
* editor: selects best editor, sets EDITOR environment variable, convenience aliases
* fisher-bootstrap: downloads and runs fisher package manager
* go: best practice variables
* k8s: convenience aliases
* node: yarn settings
* ruby: convenience aliases
* ssh: yubikey's OpenPGP ssh agent handling
* tmux: aliases
* vault: auth alias

Fish plugins are managed by fisher, and installed fisher plugins are controlled by
this repository.

### Plugins

* [fisher](https://github.com/jorgebucaran/fisher): package manager for fish
* [spacefish](https://github.com/matchai/spacefish): fish shell prompt

## Other dotfiles

* ack
* git: global gitconfig and gitignore
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
* killagent: more drastic `gpg-agent` restarter, when `reagent` is not enough
* kubesh: runs a docker image on kubernetes interactively
* mate\_wait: non-forking textmate
* r: script/rails (ruby)
* reagent: re-runs `gpg-agent` in case it becomes unavailable
* serve: simple ruby-based static webserver
* t: tmux -u (tmux)
* vaultauth: runs userpass authentication to vault
* vi: set to vim or mvim (if installed)

## GIT aliases

* aa: add --all
* br: branch
* ci: commit
* co: checkout
* dc: diff --cached
* di: diff
* fb: new-fb (reqires git-process gem)
* fm: full merge (merge --no-ff)
* h: pretty oneline history
* largest: shows largest *n* (default: 10) files in git repository
* man: help
* st: status -sb (shorter status)
* unadd: reset HEAD
* upstream: shows current branch's default remote

## scripts

* repostat: finds git repos in your path, and shows repo cleanliness

## Installation

* Clone repo: `git clone https://github.com/julian7/dotfiles.git`
* Change to `dotfiles` dir
* Run `./INSTALL.sh`
* Update your .gitconfig file to contain the changes you might need from
  `~/.config/git/config`.

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

which are loaded at the end of the respective original scripts.

## Upgrading

* Fetch changes from GitHub
* Merge changes with your changes (rebase works pretty well if you don't want
  to publish your repo anywhere)
* Enjoy

## Requirements

* zsh / fish
* git

### OSX-specific

Use [Homebrew](https://brew.sh/). This is the easiest way of
managing packages.

## Extensions in mind

* ack: power search. Install: brew install ack (on OSX), apt-get install
  ack-grep (on Debian / Ubuntu)
* [chruby](https://github.com/postmodern/chruby): ruby selector environment
* [direnv](https://github.com/direnv/direnv): Environment switcher for
  shell. Install with `go get -u github.com/direnv/direnv`.
* [git-process](https://github.com/jdigger/git-process): gem install
  git-process
* [GNU Privacy Guard](https://gnupg.org/): OpenPGP implementation.
  Currently requires a MacOS-only pinentry program. Install: brew install gnupg
* [GBT](https://github.com/jtyr/gbt): Go Bullet Train. A highly configurable, powerline-like shell prompt. Preferred over powerline-go.
* gvim / macvim: powerful text file editor. brew install macvim / apt-get
  install vim-gnome.
* [Iosevka](https://github.com/be5invis/Iosevka) font. Narrow, but
  well-readable. It has ligatures and powerline support. Install:
  `brew tap caskroom/fonts && brew cask install font-iosevka`
* [Nerd forts for Iosevka](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka): an extended Iosevka font for GBT use.
* [pinentry-mac](https://github.com/GPGTools/pinentry-mac): GUI-based
  pinentry app for MacOS. Currently this is the pinentry application for
  GnuPG. Install: brew install pinentry-mac
* [rbenv](https://github.com/sstephenson/rbenv): ruby selector environment:
  brew install rbenv / see README
* [powerline-go](https://github.com/justjanne/powerline-go): Powerline-like shell prompt. Use of GBP is more recommended. Install: `go get -u github.com/justjanne/powerline-go`
* [rbenv-vars](https://github.com/sstephenson/rbenv-vars): `mkdir
  ~/.rbenv/plugins; cd ~/.rbenv/plugins; git clone
  https://github.com/sstephenson/rbenv-vars.git`
* [ruby-install](https://github.com/postmodern/ruby-install): ruby builder for
  chruby: see README
* [ruby-build](https://github.com/sstephenson/ruby-build): ruby builder for
  rbenv: see README
* tmux: terminal multiplexer. You will love it, especially if you use PuTTY or
  any non-tabbed terminal clients.
* [rust](https://www.rust-lang.org/): Rust programming language. Install with `curl https://sh.rustup.rs -sSf | sh`.
* [vim-plug](https://github.com/junegunn/vim-plug): Minimalist Vim Plugin Manager.
  Run `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim` to install, and then run `vim -c PlugInstall -c exit -c exit` to configure.
* [yarn](https://yarnpkg.com/): Alternative to Node Package Manager,
  especially for client-base javascript frameworks. Install with `sudo
  npm -g install yarn`.

## Copyright

[![Creative Commons Licence](http://i.creativecommons.org/l/by/3.0/88x31.png)](http://creativecommons.org/licenses/by/3.0/)
This work is licensed under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).
