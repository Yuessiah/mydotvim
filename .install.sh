#!/bin/bash

if [ $(whoami) != "root" ]; then
	echo "Execute .install.sh with sudo."
	exit 1
fi

if test -d .git; then
	echo "Execute .install.sh in the top-level directory."
	exit 1
fi

rm -rf ~/.vim/
BASE=$(dirname "$0")
mv $BASE ~/.vim/

apt-get install ctags
apt-get install cmake
apt-get install nodejs
apt-get install npm

# Hard-link the ~/.vimrc from mydotvim's .vimrc
rm -f ~/.vimrc
ln ~/.vim/.vimrc ~

# Install the modules
cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
git submodule foreach --recursive
git checkout --
./install.py --clang-completer --js-completer
git submodule update

# Vundle plugin installation command
vim +PluginInstall +qall
