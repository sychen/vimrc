" Pathogen settings, which must come before file type detection
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" File-type options
filetype plugin on
filetype indent on
syntax on

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

" Coding style: highlight tabs and trailing spaces
set listchars=tab:._,trail:!
set list

set number              " Display line numbers
set modeline            " Detect mode line
set autochdir           " Change directory automatically

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

