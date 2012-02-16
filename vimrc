" Pathogen settings, which must come before file type detection
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" File-type options
filetype on
filetype plugin on
filetype indent on

" General Settings
set nocompatible                " State this again for systems not setting this
set backspace=2                 " Allow backspacing over everything in Insert mode
set history=50                  " Keep 50 lines of ":" command history
set ruler                       " Show the line and column number of the cursor position
set number                      " Display line numbers
set winaltkeys=no               " Do not enable Alt+* for GUI menus

" Map leader
let mapleader = ','
let g:mapleader = ','

" Highlighting stuff
syntax on                       " Highlight for syntax
set hlsearch                    " Highlight the search result
set listchars=tab:._,trail:!    " Highlight tabs and trailing spaces
set list

" Tab-settings
" 4 spaces wide and auto tab->space
set shiftwidth=4
set tabstop=4
set expandtab

" Option 'softtabstop' emulates shorter tabs by inserting spaces.
" For example: softtabstop=4
" 1 tab  => ____
" 2 tabs => (  tab )
" 3 tabs => (  tab )____
" This style, although maintaining compatiblity with 8-space tabs,
" are extremely bad due to its mixing approach
" Please do not use this option anyway!
"set softtabstop=4

" sychen(20110106): disable bells
set visualbell t_vb=

" Spell checking
set spelllang=en
set spell

" Others
set modeline            " Detect mode line
set autochdir           " Change directory automatically
set nowrap              " Do not wrap on long lines
set smartcase           " Smarter search
set pastetoggle=<F2>    " Insert mode <--> paste mode

" Key mappings

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc file
nmap <leader>e :e! ~/.vim/vimrc<cr>
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" File encoding
" set fileencodings=ucs-bom,utf-8,default,latin1 (default value)
set fileencodings=utf-8,big5,gb2312,gb18030,gbk,ucs-bom,default
" set encoding=utf-8 (default value)
" set termencoding=utf-8 (default value)

" NERDTree
nnoremap <silent> <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\.a$', '\.bak$', '\~$']
let NERDTreeWinPos='right'
let NERDTreeShowBookmarks=1

" Taglist
nnoremap <silent> <F12> :TlistToggle<CR>
let Tlist_Window_Exit_Only_Window = 1
let Tlist_Show_One_File =1
let Tlist_Auto_Highlight_Tag = 1

" The system default "ctags" is not compatible with taglist.
" Use homebrew to install a latest version of ctags
" And use the lines below to locate the executable.
" NOTE: Adjusting ordering of elements in $PATH is a way to do,
"       but different tools may require a different order.
"       That is hard to maintain.

if has("gui_macvim")
    let TList_CTags_Cmd="/usr/local/bin/ctags"
endif

" Tagbar
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
let g:tagbar_left = 1

" ===============================
" Per Language Settings
" ===============================

" Python
let python_highlight_all = 1

" XML
let g:xml_syntax_folding = 1
au FileType xml setlocal foldmethod=syntax


