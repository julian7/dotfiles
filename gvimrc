if has("win32")
  set guifont=M+_2m_regular:h11
  set lines=200
  set columns=300
elseif has("mac")
  set macligatures
  set guifont=Fira\ Code:h14
  set transparency=5
  set guioptions=aAce
elseif has("unix")
  " unix commands
endif
