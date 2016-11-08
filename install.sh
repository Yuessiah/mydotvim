cd ~
rm -rf .vim/
mv mydotvim/ .vim/
sudo apt-get install ctags
cd .vim/
git submodule init bundle/Vundle.vim/
git submodule update bundle/Vundle.vim/
rm -f ~/.vimrc
ln .vimrc ~
vim +PluginInstall +qall
rm -f install.sh
