#!/bin/bash

rm -rf ~/.vim/
BASE=$(dirname "$0")
mv $BASE ~/.vim/

sudo apt-get install ctags

cd ~/.vim/
git submodule init bundle/Vundle.vim/
git submodule update bundle/Vundle.vim/

# Hard-link the ~/.vimrc from mydotvim's .vimrc
rm -f ~/.vimrc
ln .vimrc ~

# Vundle plugin installation command
vim +PluginInstall +qall
