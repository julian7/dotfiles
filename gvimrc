if has("win32")
  set guifont=M+_2m_regular:h11
  set lines=200
  set columns=300
elseif has("mac")
  set guifont=Inconsolata-g\ for\ Powerline:h12
  set transparency=5
  set guioptions=aAce
elseif has("unix")
  " unix commands
endif
