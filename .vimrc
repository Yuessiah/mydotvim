" Setting some decent VIM settings for programming
set mouse=n
set number
set smarttab
set shiftwidth=2 tabstop=2
set list listchars=tab:\¦\ 
autocmd FileType css set sw=1|set ts=1
autocmd FileType python set expandtab|set sw=4|set ts=4|set softtabstop=4
set smartindent                 " set auto-indenting on for programming
set showcmd                     " show the typing command
set showmatch                   " automatically show matching brackets.
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
let mapleader="9"               " the <leader> key.
syntax enable                   " turn syntax highlighting on by default

""""""""""""""""""""""""""""""""
" Magic that can't be removed. "
""""""""""""""""""""""""""""""""
execute pathogen#infect('~/.vim/bundle/{}')
filetype plugin indent on

" some solarized theme settings
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="low"
colorscheme solarized
""""

" some emmet settings
let g:user_emmet_install_global=0
autocmd FileType html,css,htmljinja EmmetInstall
let g:user_emmet_leader_key='<TAB>'
""""

" remove trailing whitespace when type :w on normal mode
autocmd BufWritePre *.{c,cpp,java,py,html,htmljinja,css,js} :%s/\s\+$//e
""""

" auto-arrange the whole coding indentation field after reading the file into the buffer
autocmd BufReadPost *.{c,cpp,java,html} :normal ggVG=
""""

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""

" edit & source vimrc
nnoremap <leader>ev :vsplit ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
""""

" bracket-completion
au FileType htmljinja inoremap {% {%  %}<LEFT><LEFT><LEFT>
au FileType htmljinja inoremap {{ {{  }}<LEFT><LEFT><LEFT>
au FileType c,cpp,java,css,js inoremap {<CR> {<CR>}<UP><END><CR>
au FileType c,cpp,java,css,js inoremap {<SPACE> {<SPACE><SPACE>}<LEFT><LEFT>
""""

nnoremap <F6> :Tlist<CR>
map <silent> <leader>p :setlocal nopaste!<CR>
nnoremap <F9> :NERDTreeToggle<CR>
au FileType python nmap <buffer> <F8> :call Flake8()<CR>
au FileType css set nonumber
