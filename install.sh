#!/bin/bash

cd ~
rm -rf .vim/
mv mydotvim/ .vim/

sudo apt-get install ctags

cd .vim/
git submodule init bundle/Vundle.vim/
git submodule update bundle/Vundle.vim/

# Hard-link the ~/.vimrc from mydotvim's .vimrc
rm -f ~/.vimrc
ln .vimrc ~

# Vundle plugin installation command
vim +PluginInstall +qall
rm -f install.sh
