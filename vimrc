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

" Coding style: highlight tabs and trailing spaces
set listchars=tab:._,trail:!
set list

" Display line numbers
set number

" NERDTree
nnoremap <silent> <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\.a$', '\.bak$', '\~$']
let NERDTreeWinPos='right'
" Taglist
nnoremap <silent> <F12> :TlistToggle<CR>
let Tlist_Window_Exit_Only_Window = 1
let Tlist_Show_One_File =1
let Tlist_Auto_Highlight_Tag = 1

