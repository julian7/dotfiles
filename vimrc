"Allow Powerline fonts
let g:airline_theme='badwolf'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_powerline_fonts = 1

set nocompatible              " be iMproved
filetype off                  " required!

source ~/.vimrc.bundles

filetype plugin indent on " Enable filetype-specific indenting and plugins

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
set relativenumber

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

" Go to commands
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>ga :CtrlP app<cr>
map <leader>gf :CtrlP features<cr>
map <leader>gc :Gcommit<cr>
map <leader>gs :Gstatus<cr>

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

let mapleader = ","
set clipboard=unnamed
set mouse=a
set ttymouse=xterm2
set nocompatible
set backspace=indent,eol,start
set showcmd
set noesckeys
set history=500
set encoding=utf-8
" Other CtrlP settings
let g:ctrlp_custom_ignore = { 'dir': 'vendor/ruby$' }
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
set listchars=""
set listchars=tab:\	\
set listchars+=trail:·
set listchars+=extends:>
set listchars+=precedes:<

"Disable wildcard matches
"" ... output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
"" ... vendored ruby / rubinius / caches and OSX files
set wildignore+=/vendor/rbx/*,/vendor/ruby/*,vendor/cache/*,.DS_Store
"" ... archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
"" ... bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*
"iTerm cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"Settings by file type
if has("autocmd")
  autocmd!
  autocmd BufRead,BufNewFile *.txt setlocal wrap lbr nolist
  autocmd FileType yaml set smartindent
  autocmd FileType make setlocal noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  autocmd FileType markdown call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " Treat ruby dsl files as ruby source
  "autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
endif
