PATH=/usr/local/bin:$PATH


source /usr/local/git/contrib/completion/git-completion.bash

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

# Some aliases
alias l='ls -halF'
alias grep='grep --color'

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
