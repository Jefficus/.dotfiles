# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# tell the system that we have a full color terminal
# and do so before other plugins start looking for it
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="agnoster"

# set context color based on hostname
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true # not just on remote shells
POWERLEVEL9K_CONTEXT_TEMPLATE="%m"  # just the machine name
if [[ $(hostname) == 'blackburt' ]]; then
	POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='blue'
	POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='blue'
elif [[ $(hostname) == 'frankenburt' ]]; then
	POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='cyan'
	POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='cyan'
elif [[ $(hostname) == 'graham' ]]; then
	POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='green'
	POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='green'
elif [[ $(hostname) == 'cedar' ]]; then
	POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='orange'
	POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='orange'
elif [[ $(hostname) == 'yakitori' ]]; then
	POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='yellow'
	POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='yellow'
else
	POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
	POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='white'
fi
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='black'

# set control vars for powerlevel9k theme
export DEFAULT_USER=$USER
export POWERLEVEL9K_MODE='awesome-fontconfig'
# DO NOT ENABLE VCS IN POWER9K ON BLACKBURT!
# That module is extremely slow and locks up ALL your terminals
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history command_execution_time)
export POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
source $HOME/.shell_themes/powerlevel9k/powerlevel9k.zsh-theme


# If you come from bash you might have to change your $PATH.
export PATH=.:$HOME/bin:/usr/local/bin:$PATH

# ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# load favorite alias commands
source $HOME/.dotfiles/aliases


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pip sudo autojump command-not-found)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"


# These are required to be able to run autojump
# The plugin invokation higher up in this file
# is just a binder plugin that links to the autojump
# command, which must be installed separately
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# set my prefs for how cmdline history works
setopt sharehistory appendhistory extendedglob notify histignorealldups nohistverify


# now invoke any zsh config intended for the local machine only
[[ -e $HOME/.zshrc-local ]] && source $HOME/.zshrc-local

