# Julian7's dotfiles

This is my more or less educated guess on how to use a unix system. My shell of choice is ZSH, therefore you won't find any other configurations (maybe bash later, as a fallback).

## ZSH config

Most parts of the config is separated into various .zsh files in ~/.zsh.d. Notable settings:

* ClearCase: aliases and paths
* editor: finds proper EDITOR var, creates some convenience aliases
* git: git prompt
* osx-proxy-icons: adds proxy icon support to OSX Terminal
* paths: extra path
* pow: pow commands
* chruby: chruby bootstrap (if installed)
* rbenv: rbenv bootstrap (if installed)
* ruby: some ruby and ruby on rails aliases
* settings: ZSH settings
* ssh: SSH agent save / restore (it comes handy with long running tmux sessions)
* tmux: aliases and ssh title replacer function

## Other dotfiles

* ack
* git: global gitconfig and gitignore
* tmux

## ZSH aliases and functions

* ack: ack-grep (if ack-grep is installed)
* b: bundle (ruby)
* be: bundle exec (ruby)
* ct: cleartool (ClearCase)
* grep: grep -a --color=always (general)
* gvim: set to mvim (if installed)
* joe: set to 'vim' on systems where joe is not installed
* mate\_wait: non-forking textmate
* mt: multitool (ClearCase)
* powit: configures pow to pick up rack app in current dir
* r: script/rails (ruby)
* sct: sudo cleartool (ClearCase)
* smt: sudo multitool (ClearCase)
* t: tmux -u (tmux)
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
* man: help
* st: status -sb (shorter status)
* unadd: reset HEAD

## Installation

* Clone repo: `git clone https://github.com/julian7/dotfiles.git`
* Change to `dotfiles` dir
* Run `./INSTALL.sh`

## Making changes

These changes are good for me, but you might want to have other settings (you don't want to publish your changes into git using my email address, do you?). This is where git comes handy.

* Clone the repo and install (see above)
* Make your changes
* Commit changes (creating a local branch is a bonus)

## Upgrading

* Fetch changes from GitHub
* Merge changes with your changes (rebase works pretty well if you don't want to publish your repo anywhere)
* Enjoy

## Requirements

* zsh
* git

### OSX-specific

Use [Homebrew](http://mxcl.github.com/homebrew/). This is the easiest way of managing packages.

## Extensions in mind

* ack: power search. Install: brew install ack (on OSX), apt-get install ack-grep (on Debian / Ubuntu)
* tmux: terminal multiplexer. You will love it, especially if you use PuTTY or any non-tabbed terminal clients.
* gvim / macvim: powerful text file editor. brew install macvim / apt-get install vim-gnome.
* [pow](http://pow.cx) (OSX only): zero-config rack app server.
* [chruby](https://github.com/postmodern/chruby): ruby selector environment
* [rbenv](https://github.com/sstephenson/rbenv): ruby selector environment: brew install rbenv / see README
* [rbenv-vars](https://github.com/sstephenson/rbenv-vars): `mkdir ~/.rbenv/plugins; cd ~/.rbenv/plugins; git clone https://github.com/sstephenson/rbenv-vars.git`
* [ruby-build](https://github.com/sstephenson/ruby-build): ruby builder for rbenv: see README
* [git-process](https://github.com/jdigger/git-process): gem install git-process
* [vundle](https://github.com/gmarik/vundle): VIM plugin manager. Clone repo to ~/.vim/bundle/vundle

## Copyright

[![Creative Commons Licence](http://i.creativecommons.org/l/by/3.0/88x31.png)](http://creativecommons.org/licenses/by/3.0/)  
This work is licensed under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).
