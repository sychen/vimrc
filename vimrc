" Sung-Yu Chen's vimrc

" Performance Profiling
" :profile start profile.log
" :profile func *
" :profile file *

" Package Manager: vim-plug
if filereadable($HOME . "/.vim/plugin-list.vim")
    source $HOME/.vim/plugin-list.vim
endif

" Pathogen - Vim module management
" its settings must come before file type detection
" runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('local/{}')
call pathogen#helptags()

" File-type options
filetype on
filetype plugin on
filetype indent on

" General Settings
set nocompatible                " State this again for systems not setting this
set backspace=2                 " Allow backspacing over everything in Insert mode
set history=50                  " Keep 50 lines of ":" command history
set winaltkeys=no               " Do not enable Alt+* for GUI menus

" Leader key
"    Leader key is like those keys used in hot key combination, such as Ctrl, Alt, Shift, Command.
"    For example, we may be used to use Alt-1~9 in Firefox,
"    and we can assign <Leader>1~9 in Vim to switch tabs.
let mapleader = ','
let g:mapleader = ','

" Highlighting
syntax on                       " Highlight for syntax
set hlsearch                    " Highlight the search result
set listchars=tab:._,trail:!    " Highlight tabs and trailing spaces
set list

set cursorline                  " Highlight the line where the cursor is
set t_Co=256                    " Enable 256 colors for better display

" Manually set highlighting for UI elements
"   It should be moved to the colorscheme files.
highlight search        ctermfg=Black ctermbg=Yellow gui=bold guifg=Black guibg=Red
" Tabline: In text mode, the label of the tabs are displayed on the top line.
"          We call this line the tabline, its highlight group is tabline.
"          The highlighting group of the label of the active tab is tablinesel.
highlight tabline       ctermfg=black ctermbg=gray
highlight tablinesel    ctermfg=white ctermbg=black

" Tab, indent, and wrapping
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

set textwidth=120               " Always limit the width of text to 120

set smartindent

" Spell checking - only with GUI.
"     Code with spell check enabled is annoying, a lot of red blocks
"     But within GUIs errors are underlined and look great.
" Keys:
"       zg Learn the spelling of the word under the cursor
"       z= Suggest the spelling of the word under the cursor
if has("gui_running")
    set spelllang=en
    set spell
endif

" Omni-complete
" /usr/dict/words does not exist anymore.
" But it is a good thing, we should implement
" something like project-adaptive dictionary here

" set dictionary=/usr/dict/words

" Vim Appearance
set modeline            " Detect mode line
set modelines=5         " Default value, but on some systems it is off (0).
set ruler               " Show the line and column number of the cursor position
set number              " Display line numbers
set nowrap              " Do not wrap on long lines

set wildmenu            " Display candidates on the ex line

if has("patch-7.4.338")
    set breakindent         " Wrapped lines are indented as the main line
endif

" Others
set visualbell t_vb=    " sychen(20110106): disable bells

" We have to do this check, because some programs (e.g. Subversion)
" always uses an older version of Vim, which does not have this feature.
" Their launch scripts reset the environment,
" therefore editor-related variables, such as $EDITOR, $SVN_EDITOR,
" will not survive the program.
" Therefore, setting $EDITOR, $SVN_EDITOR,
" and even ~/.subversion/config does not work.

" Old versions of VIM or invocations as vi
" do not have "autochdir".
" Setting it in these situations produces errors.
" Because these rare usage is mostly single-documented,
" disabling "autochdir" for them is fine.
if exists("+autochdir")
    set autochdir           " Change directory automatically
endif
set smartcase           " Smarter search
set ignorecase
set pastetoggle=<F2>    " Insert mode <--> paste mode

set backup
set backupext=.bak
if !isdirectory(expand("~/.vim-backup"))
    call mkdir(expand("~/.vim-backup"))
endif
set backupdir=~/.vim-backup

set shell=/bin/sh       " Prevent from breakage if tcsh is used

set wildignore+=*.o,*.obj,*.bak,*.pyc,*/.git/*,*/.hg/*,*/.svn/*


" ===================================
" Key mappings
" ===================================

" Make life easier
" ================

" make ; to be :
nnoremap ;; ;
nnoremap ; :

" zz = move the window to center the cursor
nnoremap n nzz
nnoremap N Nzz
" */# jump to the next, use N to jump back (the origin one)
nnoremap * *Nzz
nnoremap # #Nzz
nnoremap g* g*zz
nnoremap g# g#zz

" Ctrl-C becomes Esc
noremap!  <ESC>

" Better "gf"

" nnoremap <leader>vsgf :vs<cr>gf
" nnoremap <leader>spgf :sp<cr>gf
nnoremap <leader>v :vs<cr>
nnoremap <leader>s :sp<cr>

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast editing of the .vimrc file
nnoremap <leader>e :e! ~/.vim/vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc


" Grep the word under the cursor
" ==============================

" noremap <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" noremap <S-F4> :execute "vimgrep /" . expand("<cword>") . "/j *" <Bar> cw<CR>

noremap <F4> :Ack <cword><CR>
noremap <S-F4> :Ack <cword><CR>

" Move between windows
" ====================
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Browser-like tab browsing
" =========================

" New Tab

if has("gui_running")
    if has("gui_macvim") " MacVim already has this
    else " Other GUI: Alt
        inoremap <A-n> <ESC>:tabnew<CR>
        nnoremap <A-n> <ESC>:tabnew<CR>
        vnoremap <A-n> <ESC>:tabnew<CR>
        cnoremap <A-n> <ESC>:tabnew<CR>
    endif
else
    inoremap <leader>n <ESC>:tabnew<CR>
    nnoremap <leader>n <ESC>:tabnew<CR>
    vnoremap <leader>n <ESC>:tabnew<CR>
    cnoremap <leader>n <ESC>:tabnew<CR>
endif

" Numbered Tab

let i = 1
while i <= 10
    let key = i % 10
    if has("gui_running")
        if has("gui_macvim") " MacVim: Command
            execute "inoremap <D-".key."> <ESC>".i."gt<CR>"
            execute "nnoremap <D-".key."> <ESC>".i."gt<CR>"
            execute "vnoremap <D-".key."> <ESC>".i."gt<CR>"
            execute "cnoremap <D-".key."> <ESC>".i."gt<CR>"
        else " Other GUI: Alt
            execute "inoremap <A-".key."> <ESC>".i."gt<CR>"
            execute "nnoremap <A-".key."> <ESC>".i."gt<CR>"
            execute "vnoremap <A-".key."> <ESC>".i."gt<CR>"
            execute "cnoremap <A-".key."> <ESC>".i."gt<CR>"
        endif
    else " Terminal: leader
        " Support for Ctrl, Alt-Shift, Command plus number key in terminals
        " such as iTerm, gnome-terminal, and Konsole is a daunting and tedious work.
        " Let's use the leader key instead
        execute "inoremap <leader>".key." <ESC>".i."gt<CR>"
        execute "nnoremap <leader>".key." <ESC>".i."gt<CR>"
        execute "vnoremap <leader>".key." <ESC>".i."gt<CR>"
        execute "cnoremap <leader>".key." <ESC>".i."gt<CR>"
    endif
    let i+=1
endwhile

" Show syntax highlighting groups for word under cursor
" =====================================================
nnoremap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ===================================
" File encoding
" ===================================

" set fileencodings=ucs-bom,utf-8,default,latin1 (default value)
set fileencodings=utf-8,big5,gb2312,gb18030,gbk,ucs-bom,default
" set encoding=utf-8 (default value)
set termencoding=utf-8      " Required in console (it's default in gtk2/macvim)

" required by vim-devicons
set encoding=UTF-8

" ===================================
" Plugins
" ===================================

" NERDTree
nnoremap <silent> <F5> :NERDTreeToggle<CR>
" Also supports leader key
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\.a$', '\.bak$', '\~$', '\.pyc$']
let NERDTreeWinPos='right'
let NERDTreeShowBookmarks=1
let NERDTreeMouseMode=2  " single click to expand directories
let NERDTreeQuitOnOpen=1  " exit window after opening

" Disable NERDTreeDirArrows in Linux, because the font
" does not have the arrow symbol
if has("unix")
    let s_uname = system("uname")
    if s_uname == "Linux\n"
        let NERDTreeDirArrows=0
    endif
endif

" Tagbar
" =======

if has("mac")
    let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
endif
nnoremap <silent> <F3> :TagbarToggle<CR>
"Also supports leader key
nnoremap <silent> <leader>T :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autoclose = 1

" Tag support for `diff` output!

" Required ctags settings (.ctags)
" --langdef=diff
" --langmap=diff:.diff.patch
" --regex-diff=/^diff .* ([^ \t]+)$/\1/F,file/
" --regex-diff=/^Index: ([^ \t]+)$/\1/F,file/

let g:tagbar_type_diff = {
    \ 'ctagstype': 'diff',
    \ 'kinds': [
    \       'F:files'
    \       ]
    \ }

" Buffergator
" ===========

" Disable default key mapping
let g:buffergator_suppress_keymaps = 1
" Selected key mapping
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>
nnoremap <silent> <Leader>t :BuffergatorTabsOpen<CR>

" Git Gutter
" ==========

highlight SignColumn            guibg=black
highlight GitGutterAdd          guifg=lightgreen guibg=black
highlight GitGutterChange       guifg=lightyellow guibg=black
highlight GitGutterDelete       guifg=lightred guibg=black
highlight GitGutterChangeDelete guifg=lightblue guibg=black

" Matchit
" =======

" source $VIMRUNTIME/macros/matchit.vim

" Solarized
" =========

" let g:solarized_contrast = "high"
" let g:solarized_visibility = "high"

" Ack
" ===

let g:ackhighlight = 1
" let g:ack_autofold_results = 1

" EasyAlign

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ===============================
" Per Language Settings
" ===============================

" Python
let python_highlight_all = 1

" XML
let g:xml_syntax_folding = 1
au FileType xml setlocal foldmethod=syntax

" Verilog
au!  BufEnter   *.vh        set filetype=verilog
au BufReadPost * if exists("b:current_syntax")
au BufReadPost *   if b:current_syntax == "verilog"
" au BufReadPost *     let c_comment_strings = 1
" au BufReadPost *     let verilog_no_bracket_error = 0
" au BufReadPost *     let verilog_minlines = 200
" au BufReadPost *     let verilog_no_force_sync = 1
au BufReadPost *     let b:verilog_indent_verbose = 1
au BufReadPost *     let b:verilog_indent_width = 4
au BufReadPost *   endif
au BufReadPost * endif

" C/C++
au FileType c set formatoptions=croql cindent shiftwidth=4
au FileType c set cinoptions={.5s,:.5s,+.5s,t0,g0,^-2,e-2,n-2,p2s,(0,=.5s
au FileType cpp set formatoptions=croql cindent shiftwidth=4
au FileType cpp set cinoptions={.5s,:.5s,+.5s,t0,g0,^-2,e-2,n-2,p2s,(0,=.5s

" ===============================
" Per Host Settings
" ===============================
if filereadable($HOME . "/.vim/vimrc-local")
    source $HOME/.vim/vimrc-local
endif

