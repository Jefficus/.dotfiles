#!/bin/bash

DOT=~/.dotfiles

src=$DOT/vimrc
target=~/.vimrc
if ! [ -x "$(which vim)" ]; then
    echo "Vim not installed locally."
    echo "Run: sudo apt-get install vim"
fi
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
src=$DOT/vim-templates
target=~/.vim/templates
echo "Linking new $target"
mkdir -p $target
ln -s $src $target


src=$DOT/tmuxrc
target=~/.tmux.conf
if ! [ -x "$(which tmux)" ]; then
    echo "Tmux not installed locally."
    echo "Run: sudo apt-get install tmux"
fi
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target

src=$DOT/gitrc
target=~/.gitconfig
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target


src=$DOT/Xmodmap
target=~/.Xmodmap
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target


# TODO
# set up .bash_aliases by linking from .dotfiles/aliases
