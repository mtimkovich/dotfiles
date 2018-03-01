autoload -U colors && colors

# PS1="%n@%m %1~ %(!.#.$) "
PS1="%B%F{green}%n@%m%f %F{blue}%1~ %(!.#.$)%f%b "

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

export EDITOR=vim
export VISUAL=vim

source ~/.local/bin/bashmarks.sh

## load zsh modules
autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup

## Options
setopt inc_append_history
setopt share_history
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
setopt histignoredups

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Up to search through history
bindkey '\e[A'  up-line-or-history
bindkey '\e[B'  down-line-or-history
bindkey '\e[C'  forward-char
bindkey '\e[D'  backward-char
bindkey '\eOA'  up-line-or-history
bindkey '\eOB'  down-line-or-history
bindkey '\eOC'  forward-char
bindkey '\eOD'  backward-char

HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000

setopt EXTENDED_HISTORY		# puts timestamps in the history

setopt HIST_VERIFY		# when using ! cmds, confirm first
setopt HIST_IGNORE_DUPS		# ignore same commands run twice+
setopt APPEND_HISTORY		# don't overwrite history
setopt SHARE_HISTORY		# _all_ zsh sessions share the same history files
#setopt hist_ignore_space       # ignore commands that have a leading space
setopt INC_APPEND_HISTORY	# write after each command

# Search history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end
