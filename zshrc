# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path to custom folder
ZSH_CUSTOM=$HOME/.dotfiles/zsh-custom

# LANG
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/android_sdk/tools:/usr/local/android_sdk/platform-tools:/usr/lib/jvm/java/jdk1.6.0_31/bin:/opt/apache-ant-1.8.4/bin:/home/jero/sh/

#alias
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l='ls -l'

alias rmr='rm -r'
alias q='exit'

alias py='python'

#git
alias gc='git commit'
alias ga='git add .'
alias gf='git diff'
alias gl='git log'
alias gs='git status'

alias ack='ack-grep'

alias q='exit'
alias t='tmux'
alias c='clear'
alias e='emacs'

#for logs
alias loggrep='egrep -REn CRASH:"\s+(\w+\.){2}\w+\s+\(\w+\s\w+\)" *|grep "email"'

#sim
alias s55='ssh root@192.168.235.55'
alias s56='ssh hezhenlong@192.168.193.56'
alias s70='ssh root@192.168.224.70'
alias s80='ssh simcom@192.168.224.80'

alias apgt='sudo apt-get install'

# goagent
alias goage='python /home/jero/goagent/local/proxy.py'

alias tmux="tmux -2"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi
# for tmux: export 256color
[ -n "$TMUX" ] && export TERM=screen-256color

user-ret(){
    if [[ $BUFFER = "" ]] ;then
        BUFFER="ls"
        zle end-of-line
        zle accept-line
    elif [[ $BUFFER =~ "^cd\ \.\.\.+$" ]] ;then
        BUFFER=${${BUFFER//\./\.\.\/}/\.\.\//}
        zle end-of-line
        zle accept-line
    else
        zle accept-line
    fi
}
zle -N user-ret
bindkey "\r" user-ret

# turn off Ctrl + s XOFF (XON is Ctrl + q)
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef
