" Setting some decent VIM settings for programming
set mouse=n
set number
set smartindent
set smarttab
set shiftwidth=2 tabstop=2
set list lcs=tab:\¦\ 
autocmd FileType python set expandtab|set sw=4|set ts=4|set softtabstop=4
set autoindent                  " set auto-indenting on for programming
set showcmd                     " show the typing command
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
syntax enable                   " turn syntax highlighting on by default


"""""""""""""""""""""""""""""""
" Magic that can't be removed."
"""""""""""""""""""""""""""""""
execute pathogen#infect('~/.vim/bundle/{}')
filetype plugin indent on

set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="low"
colorscheme solarized

" remove trailing whitespace when type :w on normal mode
autocmd BufWritePre *.{c,cpp,java,py} :%s/\s\+$//e

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Mapping for something~
nnoremap <silent> <F6> :Tlist<CR>
set pastetoggle=<C-p>
nmap <F9> :NERDTreeToggle<CR>
noremap <buffer> <F8> :call flake8#Flake8()<CR>
