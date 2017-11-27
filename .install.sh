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

cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py --clang-completer
git submodule update

# Hard-link the ~/.vimrc from mydotvim's .vimrc
rm -f ~/.vimrc
ln ~/.vim/.vimrc ~

# Vundle plugin installation command
vim +PluginInstall +qall
