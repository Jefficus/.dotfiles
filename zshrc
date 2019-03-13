# Set up geometry prompt params beefore loading plugins
# PROMPT_GEOMETRY_COLORIZE_SYMBOL=true  #change icon color based on hostname
# PROMPT_GEOMETRY_EXEC_TIME=true        #show elapsed time for long shell cmds
# GEOMETRY_PROMPT_PLUGINS=(hostname path exec_time git) #declare which plugins used on right

# plugins are managed in ~/.dotfiles/zsh-plugins
# disabled until I get antibody running on this machine
#source ~/.zsh_plugins.sh

# aliases are managed in ~/.dotfiles/aliases
source ~/.dotfiles/aliases

# tell the system that we have a full color terminal 
export TERM="xterm-256color"


# If you come from bash you might have to change your $PATH.
export PATH=.:$HOME/bin:/usr/local/bin:$PATH

# turn on prompt substitutions so that themes can 
# create informative display prompts
#setopt PROMPT_SUBST


# stamp shown in the history command output.
HIST_STAMPS="yyyy/mm/dd"


# User configuration

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.



##################################################################
# EXPERIMENTAL
# This is where I try commands to see if I like the way they work
# If a command stays here for long, move it somewhere higher up
##################################################################

# initialize the autojump tool to get j command back
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# these are only used if I want the command completion system
# and I think I need to run compinstall first
autoload -U compinit && compinit -u

# disable history verifications
#unsetopt HIST_VERIFY

# No arguments: `git status`
# With arguments: acts like `git`

# g() 
#   if [[ $# > 0 ]]; then
#     git $@
#   else
#     git status
#   fi
# }

# Complete go like git
#compdef g=git

# set control vars for powerlevel9k theme
export DEFAULT_USER=$USER
export POWERLEVEL9K_MODE='awesome-fontconfig'
# DO NOT ENABLE VCS IN POWER9K ON BLACKBURT!
# That module is extremely slow and locks up ALL your terminals
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history command_execution_time)
export POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
source ~/.shell_themes/powerlevel9k/powerlevel9k.zsh-theme

[[ -e ~/.zshrc-local ]] && source ~/.zshrc-local

