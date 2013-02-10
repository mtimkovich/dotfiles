alias rm='rm -vi'
alias cp='cp -vi'
alias mv='mv -vi'
alias vim='vi'
alias ..='cd ..'
alias ls='ls -Ap --color=auto'

mdc() { mkdir -p "$1" && cd "$1" }

up() { for i in $(seq 1 $1); do cd ..; done }

# extract() 
# {
#      if [ -f $1 ] ; then
#          case $1 in
#              *.tar.bz2)   tar xjf $1        ;;
#              *.tar.gz)    tar xzf $1     ;;
#              *.bz2)       bunzip2 $1       ;;
#              *.rar)       unrar x $1     ;;
#              *.gz)        gunzip $1     ;;
#              *.tar)       tar xf $1        ;;
#              *.tbz2)      tar xjf $1      ;;
#              *.tgz)       tar xzf $1       ;;
#              *.zip)       unzip $1     ;;
#              *.jar)       unzip $1     ;;
#              *.Z)         uncompress $1  ;;
#              *.7z)        7z x $1    ;;
#              *)           echo "'$1' cannot be extracted via extract()" ;;
#          esac
#      else
#          echo "'$1' is not a valid file"
#      fi
# }
# 
