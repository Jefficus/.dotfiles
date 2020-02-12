When setting up a duplicate environment on frankenburt...

# clear old config files out of the way, nondestructively
mv .vimrc, .vim, .tmux.conf, and .zshrc to backup folders

# set up new config directories with approp links
scp -r .vimrc, .vim, .tmux.con, and .zshrc from blackburt

# grab the new config files
git pull .dotfiles

# install anitbody (using the curl command)
# see http://getantibody.github.io

# intialize antibody with files as speced in dotfiles/plugins_zsh


# copy ~/Builds/autojump to new machine and install
# Still may not be completely functional

# install these apps
vim vim-doc tmux zsh zsh-doc vim-scripts curl
git python python3 python-pip python3-pip

# install the vim-plug plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install the tmux pluging manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# install one of the standard desktop systems
mate-desktop-full 

# vi into a file and run :PlugInstall to install all the vim plugins
