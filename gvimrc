colorscheme evening
set guifont=Monaco:h14
set t_Co=256
" 20111105: Merge the vimrc from my Gentoo workstation
if has("gui_gtk")

    set guioptions-=T " Do not include toolbar
    set guioptions+=b " Bottom (horizontal) scrollbar is present

    " Color scheme

    " 20080713: I like evening now.
    " colorscheme evening
    " colorscheme desert
    set background=dark
    colorscheme ir_black

    " Font

    " 20080713: VL Gothic is better for Latin alphabet.
    " set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
    " set guifont=VL\ Gothic\ 12
    set guifont=Droid\ Sans\ Mono\ 10

endif
