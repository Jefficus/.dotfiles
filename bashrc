# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source my personal aliases
if [ -f ~/.dotfiles/aliases ]; then
	. ~/.dotfiles/aliases
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PRJ='/home/jeffs/projects/def-dfuller/interact'
alias prj="cd $PRJ"
export VICW1="$PRJ/permanent_archive/Victoria/Wave1"
export J='/home/jeffs/projects/def-dfuller/jeffs'
export PATH=$J/Migrate/SenseDoc:$J/Ingest/SenseDoc/bin:$PATH

# turn off VENV's habit of altering the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# set an informative prompt
#export PS1="\u@\h \t\n\w\n\$ "
export PS1="\n\[\033[00;32m\]\u@\h \t\n\[\033[00;33m\]\w\n\[\033[00;36m\]\$ \[\033[00;37m\]"

# Don't automate this. It causes problems with scp sessions
# So run it manually.
source ~/projects/def-dfuller/interact/environment_setup.sh
