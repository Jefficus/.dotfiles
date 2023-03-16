# .bashrc
# if this is not an interactive shell, abandon ship
# because script sessions (like sftp, for example)\
# get confused by having commands run at started 
# ESPECIALLY if those commands echo anything to the screen
case $- in
    *i*) ;;
      *) return;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source my personal aliases
if [ -f ~/.dotfiles/aliases ]; then
	. ~/.dotfiles/aliases
fi


# Uncomment the following if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PRJ='/home/jeffs/projects/def-dfuller/interact'
alias prj="cd $PRJ"
export VICW1="$PRJ/permanent_archive/Victoria/Wave1"
export J='/home/jeffs/projects/def-dfuller/jeffs'
export PATH=.:/home/jeffs/bin:/home/jeffs/.local/bin:$PATH
export EDITOR=/usr/bin/vim

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# turn off VENV's habit of altering the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# set an informative prompt
#export PS1="\u@\h \t\n\w\n\$ "
export PS1="\n\[\033[00;32m\]\u@\h \t\n\[\033[00;33m\]\w\n\[\033[00;36m\]\$ \[\033[00;37m\]"

# Source my bash jumping tool
if [ -f ~/.dotfiles/bash_jump ]; then
    . ~/.dotfiles/bash_jump
fi

# Source any bash setups specific to the local machine
if [ -f ~/.bashrc_local ]; then
	. ~/.bashrc_local
    # source ~/projects/def-dfuller/interact/environment_setup.sh
fi
