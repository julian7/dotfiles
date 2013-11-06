"Allow Powerline fonts
let g:airline_theme='badwolf'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_powerline_fonts = 1

set nocompatible              " be iMproved
filetype off                  " required!

source ~/.vimrc.bundles

let mapleader = ","
set clipboard=unnamed
set mouse=a
set ttymouse=xterm2

if has("win32")
  set backupdir=~/vimfiles/_backup    " where to put backup files.
  set directory=~/vimfiles/_temp      " where to put swap files.
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

set wildignore+=/vendor/rbx/*,/vendor/ruby/*,vendor/cache/*,.DS_Store
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
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

" Other CtrlP settings
let g:ctrlp_custom_ignore = { 'dir': 'vendor/ruby$' }
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
set hlsearch
" highlight current line
set cursorline
set cmdheight=1
set winwidth=80
" show tabs (== show titlebar on top)
set showtabline=2
set laststatus=2
set noshowmode
set switchbuf=useopen
"" return clears search highlighting
nnoremap <CR> :nohlsearch<cr>
"" ,rw rewraps paragraph
map <leader>rw vapgq

"Paste toggle
set pastetoggle=<F2>

"Settings by file type
autocmd FileType yaml set smartindent

"iTerm cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
