if (exists("g:loaded_status_vim") && g:loaded_tabline_vim) || &cp
  finish
endif
let g:loaded_status_vim = 1


" Status line tAhing
" Set insert/everything else highlight color
set laststatus=2
set statusline=[%F]
set statusline+=%y
set statusline+=%m
set statusline+=%(\ [%R%H%W]%)
set statusline+=[%{mode()}]
set statusline+=%=
set statusline+=\ Row:[%4l/%-4L] 
set statusline+=\ Col:[%2c]
set statusline+=\ Char[0x%B]

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermfg=0 ctermbg=14 gui=reverse guifg=#b58900 
  au InsertLeave * hi StatusLine term=reverse cterm=bold,reverse ctermfg=0 ctermbg=7 gui=reverse guifg=#93a1a1 guibg=#073642
endif
