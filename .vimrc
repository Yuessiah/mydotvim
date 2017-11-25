" Setting some decent VIM settings for programming
set magic                       " A believing heart is your magic.
set mouse=n
set number
set shiftwidth=2 tabstop=2
set smarttab
set smartindent
set autoindent                  " set auto-indenting on for programming
set cursorcolumn                " enhance the column position of cursor.
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
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
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
Plugin 'Valloric/YouCompleteMe'
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
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""

" ycm settings
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_goto_buffer_command = 'horizontal-split'
""""

" remove trailing whitespace when type :w on normal mode
au BufWritePre *.{h,c,hpp,cpp,java,py,html,css,js} :%s/\s\+$//e
""""

" indentation of specific files settings
au FileType css setlocal sw=1 ts=1 nonumber
au FileType python setlocal expandtab sw=4 softtabstop=4
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
nnoremap <leader>df :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR>
noremap  <silent> <leader>p :setlocal nopaste!<CR>
nnoremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <F6> :Tlist<CR>
au FileType python nnoremap <buffer> <F8> :call Flake8()<CR>
nnoremap <F9> :NERDTreeToggle<CR>
""""
