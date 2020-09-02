" Graphical VIM (gvim, mvim)


amenu Style.Expand\ Tabs\ To\ 4\ Spaces :%s/	/    /g<CR>
amenu Style.Strip\ Trailing\ Spaces :%s/  *$//g<CR>


if has("gui_macvim")

    colorscheme vim-material
    set background=dark

    set macligatures
    " set guifont=JetBrains\ Mono:h15
    set guifont=JetBrainsMonoNerdFontComplete-Regular:h14

endif


" 20111105: Merge the vimrc from my Gentoo workstation
if has("gui_gtk")

    " GUI components
    set guioptions-=T " Do not include toolbar
    set guioptions+=b " Bottom (horizontal) scrollbar is present

    " Color scheme
    set background=dark
    colorscheme vim-material

    " Font
    set guifont=JetBrains\ Mono\ 10
    " amenu Platform.Small\ Font\ Mode :set guifont=Fira\ Code\ 8<CR>

endif

" Local gvimrc settings
" =====================

if filereadable($HOME . "/.vim/gvimrc-local")
    source $HOME/.vim/gvimrc-local
endif

