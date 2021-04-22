set PATH $PATH ~/bin ~/.local/bin ~/.cargo/bin ~/go/bin

bind \cf accept-autosuggestion execute

set GOPRIVATE "github.com/Bestowinc/*"
set -x FZF_DEFAULT_OPTS '
    --height 40% --reverse --border
    --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
    --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'

bind \ct __fzf_search_current_dir

# Aliases
alias rm 'rm -vi'
alias cp 'cp -vi'
alias mv 'mv -vi'
alias ls 'ls -ApG'
alias .. 'cd ..'
alias :q 'exit'
alias grep 'grep -s'
alias please 'sudo'
alias python 'python3'
alias pip 'pip3'
alias vim 'nvim'
alias ports 'lsof -i -P -n | grep LISTEN'

# Attaches tmux to the last session; creates a new session if none exists.
alias t 'tmux attach || tmux new-session'
# Attaches tmux to a session (example: ta portal)
alias ta 'tmux attach -t'
alias tl 'tmux ls'
alias tk 'tmux kill-session -t'
alias tn 'tmux new -s'

# Functions
function up -d 'cd .. n times'
  for i in (seq 1 $argv)
    cd ..
  end
end

function mdc -d 'mkdir && cd'
  mkdir -p $argv
  and cd $argv
end

function cl -d 'cd && ls'
  cd $argv
  and ls
end

function time2read -d 'time for a human to read a file'
  wc -w $argv | awk '{printf "%s min", $1 / 200}'
end

function rustrun -d 'Compile and run a Rust program'
  rustc $argv
  and eval ./(basename -s .rs $argv)
end

function proj_root -d "root of git project else the current dir"
  set base (git rev-parse --show-toplevel 2>/dev/null)
  if [ $status -ne 0 ]
    set base .
  end
  echo $base
end

alias v 'fd . (proj_root) | fzf --print0 | xargs -0 -o nvim'

function rg -d "automatically pipe rg to bat"
  if [ -t 1 ]
    command rg -p $argv | bat
  else
    command rg $argv
  end
end

source /usr/local/opt/asdf/asdf.fish
source (brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
