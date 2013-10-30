" Check to see if plugin has already been loaded
if (exists("g:loaded_status_vim") && g:loaded_status_vim) || &cp
  finish
endif
let g:loaded_status_vim = 1

" Always display the status bar
set laststatus=2

" Set insert/everything else highlight color
 
set statusline=[%F]
set statusline+=%y
set statusline+=%m
set statusline+=%(\ [%R%H%W]%)
set statusline+=[%{mode()}]
set statusline+=%=
set statusline+=\ Row:[%4l/%-4L] 
set statusline+=\ Col:[%2c]
set statusline+=\ Char[0x%B]

" Change color of the status line on insert
hi link User1 WildMenu
hi link User2 StatusLine

if version >= 700
	au InsertEnter * hi! link StatusLine User1
	au InsertLeave * hi! link StatusLine User2
"  au InsertEnter * hi StatusLine term=reverse ctermfg=0 ctermbg=14 gui=reverse guifg=#b58900 
"  au InsertLeave * hi StatusLine term=reverse cterm=bold,reverse ctermfg=0 ctermbg=7 gui=reverse guifg=#93a1a1 guibg=#073642
endif
