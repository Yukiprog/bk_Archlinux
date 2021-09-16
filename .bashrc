export PS1='\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export EDITOR='vim'

#setxkbmap -option ctrl:nocaps

#w3m for ranger
export PATH="$PATH":"/usr/lib/w3m/"

#alias
alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'
alias grep='grep --color=auto'     

export PATH=~/anaconda3/bin:$PATH
export PATH=/path/to/anaconda3/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yuki/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yuki/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/yuki/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/yuki/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

