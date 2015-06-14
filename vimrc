" Leader key
let mapleader = ","

"Allow Powerline fonts
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='tomorrow'
let g:airline_symbols.linenr = '¶'
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1
let g:airline#extensions#tabline#enabled = 1

set nocompatible              " be iMproved

source ~/.vimrc.bundles

filetype plugin indent on " Enable filetype-specific indenting and plugins
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if has("win32")
  set backupdir=~/vimfiles/_backup    " where to put backup files.
  set directory=~/vimfiles/_temp      " where to put swap files.
else
  set backupdir^=~/.vim/_backup/      " where to put backup files.
  set directory^=~/.vim/_temp/        " where to put swap files.
endif

color Tomorrow-Night

" Relative line numbering with spice
set number
if version >= 730
    set relativenumber
endif

" Save as we know it -- on Dvorak
map <D-s> :w<CR>
imap <D-s> <ESC>:w<CR>
map <C-o> :w<CR>
imap <C-o> <ESC>:w<CR>

" Move around splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-Down> <c-w>j
nnoremap <c-Up> <c-w>
nnoremap <c-Left> <c-w>h
nnoremap <c-Right> <c-w>l

" Ruby/rails files
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gr :topleft :split config/routes.rb<cr>

" Fugitive
map <leader>gb :Gblame<cr>
map <leader>gc :Gcommit<cr>
map <leader>gd :Gdiff<cr>
map <leader>gl :Glog<cr>
map <leader>gp :Git push<cr>
map <leader>gs :Gstatus<cr>

" NERDTree
map <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" NERDCommenter
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
map <leader>/ <plug>NERDCommenterToggle<CR>

" CtrlP
map <D-t> :CtrlP<CR>
imap <D-t> <Esc>:CtrlP<CR>
map <leader>ga :CtrlP app<cr>
map <leader>gf :CtrlP features<cr>

" Gundo
nmap <F5> :GundoToggle<CR>
imap <F5> <Esc>:GundoToggle<CR>

" Tab commands
imap <c-Tab> <ESC>:tabnext<cr>
imap <c-s-Tab> <ESC>:tabprevious<cr>
imap <D-M-Right> <ESC>:tabnext<cr>
imap <D-M-Left> <ESC>:tabprevious<cr>
map <c-Tab> :tabnext<cr>
map <c-s-Tab> :tabprevious<cr>
map <D-M-Right> :tabnext<cr>
map <D-M-Left> :tabprevious<cr>
map <leader>tn :tabnew<cr>
"" return clears search highlighting
nnoremap <CR> :nohlsearch<cr>
"" ,rw rewraps paragraph
map <leader>rw vapgq

" Settings

set clipboard=unnamed
set mouse=a
set ttymouse=xterm2
set backspace=indent,eol,start
set showcmd
" noesckeys should come before nocompatible, or arrow keys in insert mode
" won't work
set noesckeys
set nocompatible
set history=500
set encoding=utf-8

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir': 'vendor/ruby$|\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
"set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" highlight current line
set cursorline
set cmdheight=1
set winwidth=80
" show tabs (== show titlebar on top)
set showtabline=2
set laststatus=2
set noshowmode
set switchbuf=useopen

"Paste toggle
set pastetoggle=<F2>

"Whitespace
set nowrap
set tabstop=2
set shiftwidth=4
set expandtab
set list
set listchars=tab:»\ ,eol:¬,trail:·,extends:>,precedes:<
"Disable wildcard matches
"" ... output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
"" ... vendored ruby / rubinius / caches and OSX files
set wildignore+=/vendor/rbx/*,/vendor/ruby/*,vendor/cache/*,.DS_Store
"" ... archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
"" ... bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" ... temp and backup files
set wildignore+=*.swp,*~,._*
"iTerm cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

"Settings by file type
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  autocmd BufRead,BufNewFile *.txt setlocal wrap lbr nolist
  autocmd FileType yaml set smartindent
  autocmd FileType make setlocal noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  autocmd FileType markdown call s:setupWrapping()

  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead *.json set ft=javascript

  " Treat ruby dsl files as ruby source
  "autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType go set noet sw=4 ts=4
  autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType bindzone set noet sw=8 ts=8
  autocmd FileType puppet set ai sw=2 sts=2 et
endif
