########################
#      zshrc file      # 
########################

case $TERM in
	xterm*|*rxvt*)
	precmd () {print -Pn "\e]0;%~\a"}
	;;
esac

# /usr/bin/fortune -s -n 300
# echo ""

autoload -U colors && colors

PS1="%n@%m %4c %(!.#.$) "

#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

#PS1="%F{blue}%B%m%b%F{blue}[%F{green}%~%F{blue}]%f "

#PS1="%F{blue}[%F{green}%~%F{blue}] $%f "
# PS1="%F{blue}[%F{green}%~%F{blue}] $%f "
#PS1="[%~] $ "


#PS1="%F{blue}%m %F{green}%~ %F{blue}$%f "
#PS1="%F{green}%~ %F{blue}$%f "
#PS1="%F{green}%~%f $ "
#PS1="%m[%~] "


#PS1="%{$bold_color$fg[blue]%}%m%{$reset_color%}%{$fg[green]%} %~%{$reset_color%} "

## If not running interactively, do nothing 
[ -z "$PS1" ] && return

## load zsh modules
autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup

## Options
#setopt printexitvalue          # alert me if something's failed
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
#setopt RM_STAR_WAIT		# waits 10 seconds before deleting
setopt ZLE
setopt NO_HUP
#setopt VI
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB
setopt IGNORE_EOF
setopt MENUCOMPLETE
setopt ALL_EXPORT

setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent 
setopt   autopushd pushdminus extendedglob rcquotes mailwarning

unsetopt bgnice autoparamslash
unsetopt ALL_EXPORT

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

## Variables
PATH="/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:$PATH:$HOME/bin:$HOME/.gem/ruby/1.9.1/bin:$HOME/.gem/ruby/2.1.0/bin:/opt/android-sdk/tools"
manpath=(/usr/local/share/man:/usr/share/man $manpath)
TZ="US/Central"
HOSTNAME="`uname -n`"
PAGER='less'
EDITOR='vim'
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C

SCALA_HOME=/usr/local/share/scala

GOPATH=~/go_path

## Color completion
## this module should be automatically loaded if u use menu selection
## but to be sure we do it here
zmodload -i zsh/complist
ZLS_COLORS=$LS_COLORS

bindkey -e
## Keys
bindkey '\e[A'  up-line-or-history
bindkey '\e[B'  down-line-or-history
bindkey '\e[C'  forward-char
bindkey '\e[D'  backward-char
bindkey '\eOA'  up-line-or-history
bindkey '\eOB'  down-line-or-history
bindkey '\eOC'  forward-char
bindkey '\eOD'  backward-char

bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
# mappings for Ctrl-left-arrow and Ctrl-right-arrow for word moving
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line

bindkey "^e" end-of-line
bindkey "^a" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line


#kill-it-all() {
#	exit
#}
#
#zle -N kill-it-all
#bindkey '^D' kill-it-all

#zle-line-init() { echoti smkx; }  
#zle-line-finish() { echoti rmkx; }
#zle -N zle-line-init
#zle -N zle-line-finish

# Colored Manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export EDITOR=/usr/bin/vim
# Don't change this to 'pacman-color', stupid
export PACMAN=pacman

#compdef pacman-color=pacman
#compdef absorb=pacman

###################
##    ALIASES    ##
###################

# Directory navigation aliases
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Pacman Aliases
if [ -e "/usr/bin/pacman-color" ]; then
	alias -g pacman='pacman-color'
else
	alias -g pacman='pacman'
fi

alias cp='nocorrect cp -vi'
alias rm='nocorrect rm -vi'
alias mv='nocorrect mv -vi'
alias mkdir='nocorrect mkdir'

alias sudo='nocorrect sudo'

alias man='nocorrect man'
alias packer='nocorrect packer'
alias pacaur='nocorrect pacaur'
#alias pacman='nocorrect pacman'

alias dev_appserver.go='/opt/google-appengine-go/dev_appserver.py'
alias appcfg.go='/opt/google-appengine-go/appcfg.py'

alias reboot="sudo reboot"
#alias shutdown="sudo shutdown"
alias poweroff="sudo poweroff"
alias halt="sudo halt"

alias Syu='sudo pacman -Syu'
alias S='sudo pacman -S'
alias Ss='pacman -Ss'
alias Syy='sudo pacman -Syy'
alias Si='sudo pacman -Si'
#alias R='sudo pacman -R'
alias Rs='sudo pacman -Rs'
alias Qu='pacman -Qu'
alias Syud='sudo pacman -Syu --noconfirm; poweroff'

alias fucking='sudo'

# Suffix Aliases
alias -s png=feh
alias -s jpg=feh
alias -s jpeg=feh
#alias -s html=elinks
#alias -s org=elinks
alias -s avi=mplayer
alias -s sh=sh
alias -s pdf=epdfview

#alias ping='ping -c 3'
alias phpsh='phpsh -C'
alias fehbg='feh --bg-scale'
alias scrot='scrot -cd 5 -q 100'
alias x='xinit'
alias alisa='alsamixer'
alias amani='acpi'
alias qalc='qalc 2>/dev/null'
alias alysa='mplayer http://kanm5.tamu.edu:4040'

alias wcd='wicd-curses'
alias am='alsamixer'

# alias fun
alias rename='perl-rename'
alias ssed='perl -pe'
alias pl='perl'
alias ls='ls --color=auto -Ap'
alias mc='mc -u'
alias pseudo='sudo'
alias fu="exit"
alias fuck="exit"
#alias shutdown='~/shutdown.sh'
alias hon='~/shutdown.sh'
alias mplaya='mplayer'
alias gmail='elinks mail.google.com/mail/h/'
alias soundconverter='soundconverter -b -m audio/mpeg -s .mp3 *'
alias opera='opera -notrayicon'
# alias vim='vim -p'
alias clear='clear && fortune && echo ""'
alias :q='exit'
alias ed='ed -p:'
#alias cp='rsync -avP'

mdc() { mkdir -p "$1" && cd "$1" }

up() { for i in $(seq 1 $1); do cd ..; done }

# cdls() { 
# 
# 	cd ${1-~} || return
# 
# 	if [ $(ls | wc -l) -lt 200 ]; then
# 		ls 
# 	fi
# }
# 
# alias cd='cdls'

# Extract archives
extract() 
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       unrar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.jar)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Console fonts
alias terminus14='consolechars -f Lat2-Terminus14.psf'
alias terminus16='consolechars -f Lat2-Terminus16.psf'
alias fixed14='consolechars -f Lat2-Fixed14.psf'
alias fixed13='consolechars -f Lat15-Fixed13.psf'
alias fixed16='consolechars -f Lat2-Fixed16.psf'
alias alt14='consolechars -f alt-8x14.psf'	

###################
##    HISTORY    ##
###################

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


######################
##    COMPLETION    ##
######################

setopt CORRECT			# command CORRECTION

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Prevent CVS files/directories from being completed
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command' 

zstyle ':completion:*:*:killall:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*:processes' command 'ps --forest -A -o pid,user,cmd'

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}'


zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion Styles

# list of completers to use
#zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Ignore binary files and class files
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.(o|class)'


# Automatically start up X if in tty1
# if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
#     startx
# else
#    /usr/bin/fortune
#    echo ""
# fi

export PERL_LOCAL_LIB_ROOT="/home/max/perl5";
export PERL_MB_OPT="--install_base /home/max/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/max/perl5";
export PERL5LIB="/home/max/perl5/lib/perl5/x86_64-linux-thread-multi:/home/max/perl5/lib/perl5";
export PATH="/home/max/perl5/bin:$PATH";
