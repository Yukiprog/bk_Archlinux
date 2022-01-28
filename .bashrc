export PS1='\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export EDITOR='vim'

setxkbmap -option ctrl:nocaps

#w3m for ranger
export PATH="$PATH":"/usr/lib/w3m/"

#alias
alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'
alias grep='grep --color=auto'     

export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH
export PATH=~/.local/bin:$PATH

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh
