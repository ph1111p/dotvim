if has ('gui_running')
    " gVim settings
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
    set guifont=Monaco:h12

    " Get rid of annoying cursor behavior
    set guicursor=n-v-c-i-ci:block-Cursor
    set guicursor=a:blinkon0

    "highlight iCursor gui=NONE guifg=#073642  guibg=#eee8d5
    highlight Cursor gui=NONE guifg=bg guibg=fg
    "highlight iCursor gui=NONE guifg=bg guibg=fg

    " To make normal things work
    set hlsearch
    set backspace=indent,eol,start

endif
