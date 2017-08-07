" Setting some decent VIM settings for programming
set mouse=n
set number
set smarttab
set smartindent
set shiftwidth=2 tabstop=2
set list listchars=tab:\¦\ |
autocmd FileType css setlocal sw=1 ts=1 nonumber
autocmd FileType python setlocal expandtab sw=4 softtabstop=4
set autoindent                  " set auto-indenting on for programming
set showcmd                     " show the typing command
set showmatch                   " automatically show matching brackets.
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
set nocompatible                " be iMproved
let mapleader="9"               " the <leader> key.
syntax enable                   " turn syntax highlighting on by default

" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nvie/vim-flake8'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'tpope/vim-sensible'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors'
call vundle#end()
filetype plugin indent on
""""

" solarized theme settings
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="low"
colorscheme solarized
""""

" airline settings
let g:airline_theme='laederon'
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
""""

" emmet settings
let g:user_emmet_install_global=0
autocmd FileType html,css,htmljinja,php EmmetInstall
let g:user_emmet_leader_key='<TAB>'
""""

" vim-javascript syntax settings
let g:javascript_plugin_jsdoc=1
""""

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""

" remove trailing whitespace when type :w on normal mode
autocmd BufWritePre *.{h,c,hpp,cpp,java,py,html,css,js} :%s/\s\+$//e
""""

" auto-arrange the whole coding indentation field after reading the file into the buffer
autocmd BufReadPost *.{h,c,hpp,cpp,java} :normal gg=G
""""

" bracket-completion
au FileType html,htmljinja inoremap <buffer> {% {%  %}<LEFT><LEFT><LEFT>
au FileType html,htmljinja inoremap <buffer> {{ {{  }}<LEFT><LEFT><LEFT>
au FileType javascript inoremap <buffer> ({<CR> ({<CR><END><CR>})<UP><END>
au FileType h,c,hpp,cpp,java,css,javascript inoremap <buffer> {<CR> {<CR><END><CR>}<UP><END>
au FileType h,c,hpp,cpp,java,javascript inoremap <buffer> {; {<CR><END><CR>};<UP><END>
au FileType h,c,hpp,cpp,java,css,javascript inoremap <buffer> {<END> {<SPACE><END><SPACE><SPACE>}<LEFT><LEFT>
""""

" hot key
inoremap jk <ESC>
cnoremap jk <ESC>
nnoremap `` ``zz
nnoremap <SPACE> :w<CR>
vnoremap <C-y> "+y
nnoremap <C-p> "+P
vnoremap <C-p> "+P
nnoremap <leader>ev :vsplit ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <F6> :Tlist<CR>
map <silent> <leader>p :setlocal nopaste!<CR>
nnoremap <F9> :NERDTreeToggle<CR>
au FileType python nmap <buffer> <F8> :call Flake8()<CR>
""""
