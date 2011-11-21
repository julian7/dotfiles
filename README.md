# Julian7's dotfiles

This is my more or less educated guess on how to use a unix system. My shell of choice is ZSH, therefore you won't find any other configurations (maybe bash later, as a fallback).

## ZSH config

Most parts of the config is separated into various .zsh files in ~/.zsh.d. Notable settings:

* ClearCase: aliases and paths
* editor: finds proper EDITOR var, creates some convenience aliases
* git: git prompt
* osx-proxy-icons: adds proxy icon support to OSX Terminal
* paths: extra paths
* rbenv: rbenv bootstrap (if installed)
* ruby: some ruby and ruby on rails aliases
* settings: ZSH settings
* ssh: SSH agent save / restore (it comes handy with long running tmux sessions)
* tmux: aliases and ssh title replacer function

## Other dotfiles

* ack
* git: global gitconfig and gitignore
* tmux

## ZSH aliases

* ack: ack-grep (if ack-grep is installed)
* b: bundle (ruby)
* be: bundle exec (ruby)
* ct: cleartool (ClearCase)
* grep: grep -a --color=always (general)
* gvim: set to mvim (if installed)
* joe: set to 'vim' on systems where joe is not installed
* mate\_wait: non-forking textmate
* mt: multitool (ClearCase)
* r: script/rails (ruby)
* sct: sudo cleartool (ClearCase)
* smt: sudo multitool (ClearCase)
* t: tmux -u (tmux)
* vi: set to vim or mvim (if installed)

## GIT aliases

* br: branch
* ci: commit
* co: checkout
* ff: flow feature (git flow's feature commands)
* man: help
* st: status -sb (shorter status)
* unadd: reset HEAD

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
* [rbenv](https://github.com/sstephenson/rbenv): ruby selector environment: brew install rbenv / see README
* [ruby-build](https://github.com/sstephenson/ruby-build): ruby builder for rbenv: see README
* [gitflow](https://github.com/nvie/gitflow): git workflow: brew install git-flow / see README

## Copyright

[![Creative Commons Licence](http://i.creativecommons.org/l/by/3.0/88x31.png)](http://creativecommons.org/licenses/by/3.0/)  
This work is licensed under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).
This work 
