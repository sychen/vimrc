" Graphical VIM (gvim, mvim)


" set t_Co=256  " 256-color support

amenu Style.Expand\ Tabs\ To\ 4\ Spaces :%s/	/    /g<CR>
amenu Style.Strip\ Trailing\ Spaces :%s/  *$//g<CR>


if has("gui_macvim")

    " colorscheme solarized
    " set background=dark
    "colorscheme ir_black
    colorscheme vim-material
    set background=dark

    " set guifont=InputMono\ Thin:h14
    " amenu Platform.Small\ Font\ Mode :set guifont=InputMono\ Thin:h11<CR>
    " set guifont=Monaco:h14
    set macligatures
    set guifont=Fira\ Code:h16

endif


" 20111105: Merge the vimrc from my Gentoo workstation
if has("gui_gtk")

    set guioptions-=T  " Do not include toolbar
    set guioptions+=b  " Bottom (horizontal) scrollbar is present

    " Color scheme
    set background=dark
    colorscheme solarized

    " 20080713: I like evening now.
    " colorscheme evening
    " colorscheme desert
    " colorscheme ir_black

    " Font
    set guifont=Input\ Mono\ Thin\ 10
    amenu Platform.Small\ Font\ Mode :set guifont=Input\ Mono\ Thin\ 8<CR>

    " 20080713: VL Gothic is better for Latin alphabet.
    " set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
    " set guifont=VL\ Gothic\ 12
    " set guifont=Droid\ Sans\ Mono\ 10
    " 20121008: change to Source Code Pro
    "set guifont=Source\ Code\ Pro\ 12

endif


" Local gvimrc settings
" =====================

if filereadable($HOME . "/.vim/gvimrc-local")
    source $HOME/.vim/gvimrc-local
endif

