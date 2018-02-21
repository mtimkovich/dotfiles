autoload -U colors && colors

PS1="%n@%m %1~ %(!.#.$) "

# Aliases
alias openthisdir='xdg-open .'
alias toclip='xclip -selection c'

alias rm='rm -vi'
alias cp='cp -vi'
alias mv='mv -vi'
alias ..='cd ..'
alias ls='ls -Ap --color=auto'
alias :q='exit'

# Functions
mdc() { mkdir -p "$1" && cd "$1" }

up() { for i in $(seq 1 $1); do cd ..; done }

EDITOR=vim
VISUAL=vim

source ~/.local/bin/bashmarks.sh

## load zsh modules
autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup

## Options
setopt inc_append_history share_history
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
setopt ZLE
setopt NO_HUP
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB
setopt IGNORE_EOF
setopt NO_AUTO_LIST
setopt AUTO_MENU
setopt ALL_EXPORT
setopt correct

zstyle ':completion:*' menu select
zmodload zsh/complist

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
