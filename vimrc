" vim configuration file
" Phil Lange -- 2014

" Plugin management {{{
"----------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'

call plug#end()

" Plugin settings
" ===============
" YouCompleteMe
" -------------
autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
let g:ycm_warning_symbol = '>>'
let g:ycm_error_symbol = 'XX'
let g:ycm_autoclose_preview_window_after_insertion = 1

" vim-airline
" -----------
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_exclude_preview = 1

""}}}

" Initialization & Appearance {{{
"----------------------------------------
syntax enable
set background=dark
colorscheme smyck
filetype plugin indent on
set mouse=a  "use the mouse to scroll in terminal
set clipboard=unnamed

set ttimeout        " Escape immediately out of command mode
set ttimeoutlen=100

" Appearance
set noshowmode
set number					" Line numbers
set showtabline=2			" Always show tab line
set splitbelow splitright	" Split windows below and right
set diffopt+=vertical		" 'Diff'ing always set to vertical
set scrolloff=1 " Scrolling gives one line at top & bottom
let &listchars="eol:\<Char-0x00ac>,tab:▸\ " " Invisible chars

" get rid of annoying error bells
set noeb
set visualbell t_vb=
autocmd! GUIEnter * set vb t_vb=


" Formating
"------------
" Set formatting( tabs, column width, tabwidth, etc. )
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab			" Tabs, *not* spaces
set smartindent
set textwidth=79
set formatoptions+=roj	" Comment leaders for inserting line above/below
set nojoinspaces		" Use only 1 space after "." when joining lines instead of 2
set linespace=1			" spacing between lines

" Folding settings
"------------------
set foldmethod=syntax

" }}}

" Editing {{{
"----------------------------------------
" C comment starters
inoremap /*<Space>	/*<Space><Space>*/<Left><Left><Left>
inoremap /*<Return>	/**<Return><Return>/<Esc><Up>A<Space>

" comment out section C
vnoremap <Leader>c :s/^/\/\//g<CR>:noh<CR>
vnoremap <Leader>C :s/^\/\///g<CR>:noh<CR>

nnoremap <Leader>c 0i// <Esc>
nnoremap <Leader>C :s/\/\///<CR>:noh<CR>

" }}}

" Searching {{{
"----------------------------------------
set incsearch " Incremental search
set ignorecase " Make searches case-insensitive...
set smartcase  " ...unless they contain at least one uppercase character
set hlsearch

set completeopt=preview,menuone,longest

" }}}

" General hotkeys {{{
"----------------------------------------
" Remap 'jk' to escape, very quick :P
inoremap jk <Esc>l

let mapleader = ","
" Reset hightlighting after search
nnoremap <Leader>h	:noh<return>

" Open help in a vertical split instead of the default horizontal split
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>

" }}}

" file specific options
autocmd BufRead,BufNewFile  *.sv setlocal sw=4 ts=4 foldmethod=indent

" vim: foldmethod=marker
