#!/bin/bash

src=$PWD/vimrc
target=~/.vimrc
if ! [ -x "$(vim --version)" ]; then
    echo "Vim not installed locally."
    echo "Run: sudo apt-get install vim"
fi
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target


src=$PWD/zshrc
target=~/.zshrc
if ! [ -x "$(zsh --version)" ]; then
    echo "Zsh not installed locally."
    echo "Run: sudo apt-get install zsh"
fi
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target


src=$PWD/tmuxrc
target=~/.tmux.conf
if ! [ -x "$(tmux -V)" ]; then
    echo "Tmux not installed locally."
    echo "Run: sudo apt-get install tmux"
fi
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target

src=$PWD/gitrc
target=~/.gitconfig
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target


src=$PWD/Xmodmap
target=~/.Xmodmap
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target



