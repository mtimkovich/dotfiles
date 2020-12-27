set PATH $PATH ~/bin ~/.local/bin ~/.cargo/bin

function fish_prompt
    echo -n $USER@(hostname) ''
    set_color $fish_color_cwd
    prompt_dir
    set_color normal
    echo -n ' $ '
end

bind \cf accept-autosuggestion execute

# Aliases
alias rm='rm -vi'
alias cp='cp -vi'
alias mv='mv -vi'
alias ls='ls -Ap --color=auto'
alias ..='cd ..'
alias :q='exit'
alias grep='grep -s'
alias please='sudo'

alias apt-search='apt search --names-only'
# Attaches tmux to the last session; creates a new session if none exists.
alias t='tmux attach || tmux new-session'
# Attaches tmux to a session (example: ta portal)
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'

# Functions
function up -d 'cd .. n times'
    for i in (seq 1 $argv)
        cd ..
    end
end

function mdc -d 'mkdir && cd'
    mkdir -p $argv
    cd $argv
end

function prompt_dir
    if [ $PWD = $HOME ]
        echo -n "~"
    else
        echo -n (basename $PWD)
    end
end

function rustrun -d 'Compile and run a Rust program'
    rustc $argv
    and eval ./(basename -s .rs $argv)
end
