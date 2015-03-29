PATH=/usr/local/bin:/usr/local/Cellar/ruby/1.9.3-p362/bin:/usr/local/share/npm/bin/:$PATH



# GIT prompt config
export GIT_PS1_SHOWDIRTYSTATE=false
export GIT_PS1_SHOWUNTRACKEDFILES=false
export GIT_PS1_SHOWSTASHSTATE=false

# Prompt config
PS1="\n[\w]\$(declare -F __git_ps1 &>/dev/null && __git_ps1 \" (%s)\")\n\u@\h:$ "

# Setting some shell vars
export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8

# Smart auto-complete
set show-all-if-ambiguous On
bind "set completion-ignore-case on"

complete -A hostname rsh rcp telnet rlogin r ftp ping disk ssh

# Bash autocomplete
if [ -f $(brew --prefix)/share/bash-completion/completions ];
then
    . $(brew --prefix)/share/bash-completion/completions
fi

# Git autocomplete
if [ -f /usr/local/git/contrib/completion/git-completion.bash ];
then
    . /usr/local/git/contrib/completion/git-completion.bash
fi

# Some aliases
alias l='ls -halF'
alias grep='grep --color'
# Binary Archive Rsync, defaults to some optimised settings for archiving binary files
alias barsync='rsync -a --whole-file --progress --no-owner --no-group --no-perms'

# Grep config
export GREP_COLOR="1;33"

# Fixing something very broken...
ssh-reagent () {
      for agent in /tmp/ssh-*/agent.*; do
             export SSH_AUTH_SOCK=$agent
             if ssh-add -l 2>&1 > /dev/null; then
                     echo Found working SSH Agent:
                     ssh-add -l
                     return
             fi
     done
     echo Cannot find ssh agent - maybe you should reconnect and forward it?
 }

docker-set-host () {
    PORT=2375
    HOST=127.0.0.1

    if [ ! -z "$1" ];
    then
        PORT=$1
    fi

    case $PORT in
        ''|*[!0-9]*) echo "Expected a portnumber as argument, or no argument at all."; return ;;
    esac

    export DOCKER_HOST=tcp://$HOST:$PORT
    echo Set host to $HOST on port $PORT.
}

docker-set-host 1>/dev/null


