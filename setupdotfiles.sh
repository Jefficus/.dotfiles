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

echo "You might need to run chsh to set your default shell to zsh"
echo "You probably still need to create ~/.shell_themes"
echo "    and then git clone https://github.com/bhilburn/powerlevel9k.git
inside that folder"
echo "And you probably need to install a patched version of nerdfonts."


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



