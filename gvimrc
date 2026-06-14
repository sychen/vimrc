" Graphical VIM (gvim, mvim)


amenu Style.Expand\ Tabs\ To\ 4\ Spaces :%s/	/    /g<CR>
amenu Style.Strip\ Trailing\ Spaces :%s/  *$//g<CR>

" Color scheme: material everywhere, with desert as a fallback when
" material is not installed.
set background=dark
try
    colorscheme material
catch /^Vim\%((\a\+)\)\=:E185:/ " E185: colorscheme not found
    colorscheme desert
endtry

" The default font is MonoLisa, with fallback Fira Code.
" The Nerd Font version is used to use vim-devicon.

if has("gui_macvim")

    set macligatures

    set guifont=MonoLisaNF-Regular:h14,FiraCodeNFM-Reg:h14
    set guifontwide=jf-jinxuanlatte-3.0-Regular:h14

endif


" 20111105: Merge the vimrc from my Gentoo workstation
if has("gui_gtk")

    " GUI components
    set guioptions-=T " Do not include toolbar
    set guioptions+=b " Bottom (horizontal) scrollbar is present

    " Font
    " set guifont=JetBrains\ Mono\ 10
    " set guifont=RobotoMono\ Nerd\ Font\ Mono\ 10
    set guifont=Monolisa\ 10
    " amenu Platform.Small\ Font\ Mode :set guifont=Fira\ Code\ 8<CR>

endif

if has('win32') || has('win64')
    set guifont=MonoLisa:h11
endif


" Local gvimrc settings
" =====================

if filereadable($HOME . "/.vim/gvimrc-local")
    source $HOME/.vim/gvimrc-local
endif

