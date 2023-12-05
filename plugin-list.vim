" vim-plug plugin list

" Install: use :PlugInstall
" Update: use :PlugUpdate
" Delete: use :PlugClean

call plug#begin('~/.vim/plugged')

" ====================================================
" Visual Enhancements
" ====================================================

" ======== 2011 ========
Plug 'preservim/nerdtree'
" It was scrooloose/nerdtree,
" but the maintainer has been transferred.

Plug 'preservim/tagbar'
" It was majutsushi/tagbar,
" but the maintainer has been transferred.

" ======== 2013 ========
Plug 'bling/vim-airline'
Plug 'jeetsukumaran/vim-buffergator'

" ======== 2014 ========
Plug 'airblade/vim-gitgutter'

" ====================================================
" Command Enhancements
" ====================================================

" ======== 2011 ========
Plug 'tpope/vim-pathogen'
" For local plugins temporarily

Plug 'fedorenchik/AnsiEsc'
" The official mirror is at vim-scripts/AnsiEsc,
" but the above is the most recent GitHub mirror of
" the latest version on the original author page:
" http://www.drchip.org/astronaut/vim/index.html#ANSIESC

" ======== 2012 ========
" Plug 'SirVer/ultisnips'
" Used to use garbas/vim-snipmate.git
" But it had many dependencies
" * tomtom/tlib_vim
" * MacWeber/vim-addon-mw-utils
" So I switched to UltiSnips

" Plug 'honza/vim-snippets'
" depends on SirVer/ultisnips

Plug 'tpope/vim-surround'
Plug 'vim-scripts/sessionman.vim'
Plug 'sychen/vim-localrc'

" ======== 2013 ========
Plug 'bronson/vim-visual-star-search'
" It was nelstrom/vim-visual-star-search
" a fork from bronson/vim-visual-star-search.
" But the bronson's is more maintained.

Plug 'ctrlpvim/ctrlp.vim'
" It was kien/ctrp.vim, and is later ctrlpvim/ctrlp

Plug 'mbbill/fencview'
Plug 'junegunn/vim-easy-align'

" ======== 2014 ========
Plug 'michaeljsmith/vim-indent-object'

" ======== 2015 ========
Plug 'gerw/vim-HiLinkTrace'

" ======== 2017 ========
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

" ======== 2020 ========
Plug 'preservim/nerdcommenter'

Plug 'junegunn/vim-plug'
" for documentation

" ====================================================
" Integration
" ====================================================

" ======== 2014 ========
Plug 'mileszs/ack.vim'

" ======== 2017 ========
Plug 'nvie/vim-flake8'

" ====================================================
" Languages
" ====================================================

" ======== 2014 ========
Plug 'tpope/vim-rails'

" ======== 2015 ========
Plug 'MaxMEllon/vim-jsx-pretty'
" It was mxw/vim-jsx
" But it was incompatible with a famous plugin,
" and this new one is the new norm.

Plug 'sheerun/vim-polyglot'

" ======== 2017 ========
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sychen/vim-systemverilog'

" ======== 2020 ========
Plug 'singularityhub/singularity.lang'
Plug 'raimon49/requirements.txt.vim'

" ======== 2023 ========
Plug 'OmniSharp/omnisharp-vim'

" ====================================================
" Themes
" ====================================================

" ======== 2014 ========
Plug 'nanotech/jellybeans.vim'

" ======== 2017 ========
Plug 'sychen/vim-material'
Plug 'twerth/ir_black'

" ======== 2020 ========
Plug 'ryanoasis/vim-devicons'


call plug#end()

