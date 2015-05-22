" vim configuration file
" Phil Lange -- 2014

" Vundle {{{
"----------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Other plugins
"Plugin 'Valloric/YouCompleteMe'
Plugin 'nachumk/systemverilog.vim'

call vundle#end()
filetype plugin indent on
"filetype plugin  on

" Plugin settings 
" ===============
" YouCompleteMe
" -------------
let g:ycm_warning_symbol = '>>'
let g:ycm_error_symbol = 'XX'
let g:ycm_autoclose_preview_window_after_insertion = 1
""let g:ycm_always_populate_location_list = 1

""}}}

" Initialization & Appearance {{{ 
"----------------------------------------
syntax enable
colorscheme apprentice
filetype plugin indent on
set number					" Line numbers
set showtabline=2			" Always show tab line
set splitbelow splitright	" Split windows below and right
set diffopt+=vertical		" 'Diff'ing always set to vertical
set scrolloff=1 " Scrolling gives one line at top & bottom
set noeb " No error bell
let &listchars="eol:\<Char-0x00ac>,tab:▸\ " " Invisible chars

source ~/.vim/.gvimrc

" Formating 
"------------
" Set formatting( tabs, column width, tabwidth, etc. ) 
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab			" Tabs, *not* spaces
set smartindent
set textwidth=79
set formatoptions+=ro	" Comment leaders for inserting line above/below
set nojoinspaces		" Use only 1 space after "." when joining lines instead of 2
set linespace=1			" spacing between lines

" Folding settings
"------------------
set foldmethod=syntax
set foldlevelstart=0

" }}}

" Editing {{{
"----------------------------------------
let mapleader = ","
" move cursor to end of line 

" Closing brackets, parenthesis, etc TODO: make into function
inoremap (		()<Left>
inoremap (<Space>	   (<Space><Space>)<Left><Left>
inoremap (<CR>	(<CR>)<Esc>O
inoremap ()		()
inoremap (<BS>	<Nop>
inoremap (<Space><BS>  <Nop>
inoremap (<Del><BS> ( 

inoremap [		[]<Left>
inoremap [<Space>	   [<Space><Space>]<Left><Left>
inoremap [<CR>	[<CR>]<Esc>O
inoremap []		[]
inoremap [<BS>	<Nop>
inoremap [<Space><BS>  <Nop>
inoremap [<Del><BS> [ 

inoremap {		{}<Left>
inoremap {<Space>	   {<Space><Space>}<Left><Left>
inoremap {<CR>	{<CR>}<Esc>O
inoremap {}		{}
inoremap {<BS>	<Nop>
inoremap {<Space><BS>  <Nop>
inoremap {<Del><BS> { 

inoremap "" "<Left>
inoremap "<BS>	<Nop>

inoremap '' '<Left>
inoremap '<BS>	<Nop>

"retroactivly add parenthesis/brackets in visual mode
vnoremap <Leader>( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap <Leader>{ <Esc>`>a}<Esc>`<i{<Esc>

" C comment starters
inoremap /*<Space>	/*<Space><Space>*/<Left><Left><Left>
inoremap /*<Return>	/**<Return><Return>/<Esc><Up>A<Space>

" comment out section C
vnoremap <Leader>c :s/^/\/\//g<CR>:noh<CR>
vnoremap <Leader>C :s/^\/\///g<CR>:noh<CR>

nnoremap <Leader>c 0i// <Esc>
nnoremap <Leader>C :s/\/\///<CR>:noh<CR>

" Underlines
nnoremap <Leader>=	yypv$r=<Esc>
nnoremap <Leader>==	o<Esc>80i=<Esc>
inoremap <Leader>=	<Esc>yypv$r=o
inoremap <Leader>==	<Esc>o<Esc>80i=<Esc>o

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j     
endif
" }}}

" Searching {{{
"----------------------------------------
set incsearch " Incremental search
set ignorecase " Make searches case-insensitive...
set smartcase  " ...unless they contain at least one uppercase character

set completeopt=preview,menuone,longest
" Navigation of parenthesis while in insert & normal
" }}}

" General hotkeys {{{
"----------------------------------------
" Open vimrc
nnoremap <leader>mv	:e $MYVIMRC

" Open netrw file explorer
nnoremap <leader>o	:Explore<return>
" Remap 'jk' to escape, very quick :P
inoremap jk <Esc>l

" Reset hightlighting after search
nnoremap <Leader>h	:noh<return>

" Show invisibles
nnoremap <Leader>l	:set list!<return>

" Open help in a vertical split instead of the default horizontal split
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>

" }}}

" file specific options
autocmd BufRead,BufNewFile  *.sv setlocal sw=4 ts=4 foldmethod=indent

" vim: foldmethod=marker 
