if has("win32")
  call plug#begin('~/vimfiles/bundle')
else
  call plug#begin('~/.vim/bundle')
endif

" Colors
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
Plug 'vim-scripts/molokai'

" Languages
" Plug 'sbdchd/neoformat'
Plug 'tpope/vim-git'
Plug 'pangloss/vim-javascript'
Plug 'mmalecki/vim-node.js'
Plug 'kchmck/vim-coffee-script'
Plug 'nono/vim-handlebars'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'skwp/vim-rspec'
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-markdown'
Plug 'chrisbra/csv.vim'
"Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

" Tools
Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'itspriddle/ZoomWin'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-endwise'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'vim-scripts/vimwiki'
Plug 'ap/vim-css-color'
Plug 'Lokaltog/vim-easymotion'
Plug 'chrisbra/NrrwRgn'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'rgarver/Kwbd.vim'
Plug 'kien/ctrlp.vim'
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
