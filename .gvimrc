
" Gui Opitons {{{ 
if has ("gui_running")
	
	" Get normal tabline
	set guioptions-=e
	
	" Get rid of scroll bars
	set guioptions-=l
	set guioptions-=L
	set guioptions-=r
	set guioptions-=b
	set guioptions-=m
	" Get rid of scroll bars
	set guioptions-=T

	" Set font
	if has ("win32")
		set guifont=Consolas:h10
  elseif has("unix")
    if system('uname')=~'Darwin'
      set guifont=Source\ Code\ Pro\ light:h13
    else
      set guifont=Consolas:h10
    endif
	endif

	" Get rid of annoying cursor behavior
	set guicursor=n-v-c:block-Cursor
	set guicursor=i-ci:block-lCursor
	set guicursor=a:blinkon0

	" To make normal things work
	set hlsearch
	set backspace=indent,eol,start

endif
" }}}
