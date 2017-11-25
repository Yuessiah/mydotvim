#!/bin/bash

rm -rf ~/.vim/
BASE=$(dirname "$0")
mv $BASE ~/.vim/

apt-get install ctags

cd ~/.vim/bundle/
git submodule init Vundle.vim/
git submodule update Vundle.vim/
git submodule init YouCompleteMe/
git submodule update YouCompleteMe/
cd YouCompleteMe/
git submodule update --init --recursive
./install.py --clang-completer

# Hard-link the ~/.vimrc from mydotvim's .vimrc
rm -f ~/.vimrc
ln ~/.vim/.vimrc ~

# Vundle plugin installation command
vim +PluginInstall +qall
