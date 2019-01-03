#!/bin/bash
src=$PWD/vimrc
target=~/.vimrc
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target

src=$PWD/zshrc
target=~/.zshrc
if [[ -e "$target" ]]; then
    echo "Moving old $target"
    mv $target ${target}-old
fi
echo "Linking new $target"
ln -s $src $target

src=$PWD/tmuxrc
target=~/.tmux.conf
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

