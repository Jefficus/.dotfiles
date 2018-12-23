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

