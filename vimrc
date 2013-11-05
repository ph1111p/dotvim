" Clean this fucking thing up

"" Vundle {{{
""============
"set nocompatible               " be iMproved
"filetype off                   " required!
"
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"
"" let Vundle manage Vundle
"" required! 
"Bundle 'gmarik/vundle'
"
""" My Bundles here:
"" original repos on github
""Bundle 'scrooloose/syntastic'
"Bundle 'junegunn/vim-easy-align'
"
"" git repos on your local machine (ie. when working on your own plugin)
""Bundle 'file:///Users/gmarik/path/to/plugin'
"
"filetype plugin indent on     " required!
"" }}}
"
" Initialization {{{ 
""""""""""""""""""""
" Open bitlist

"}}}

" Appearance {{{
""""""""""""""""""""

colorscheme obsidian2
syntax enable
set number				" Line numbers
set showtabline=2		" Always show tab line

" " Split windows below and right instead of above and left
set splitbelow splitright

set diffopt+=vertical	" 'Diff'ing always set to vertical

" Set invisible characters
let &listchars="eol:\<Char-0x00ac>,tab:▸\ "

" Scrolling gives one line at top & bottom
set scrolloff=1

"" Formating 
"
" Set formatting( tabs, column width, tabwidth, etc. ) 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab			" Tabs not spaces
set smartindent
set textwidth=79
set formatoptions+=ro	" Comment leaders for inserting line above/below

set nojoinspaces		" Use only 1 space after "." when joining lines instead of 2

" Folding settings
set foldmethod=syntax
set foldlevelstart=0
" }}}

" Editing {{{
"""""""""""""""""""
" move cursor to end of line 
inoremap <Leader>a <Esc>A

"" Closing brackets, parenthesis, etc, Worth making into function?
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

" C comment starters
inoremap /**	/**<CR>/<Esc>O
inoremap /*<Space>	/*<Space><Space>*/ <Left><Left><Left><Left>

" Comments for various languages
autocmd Filetype c nnoremap <buffer> <localleader>c		I//<esc>
autocmd Filetype c nnoremap <buffer> <localleader>nc	:s/\/\//<CR> :noh<CR>

autocmd Filetype c vnoremap <buffer> <localleader>c		:s/^/\/\//<CR> :noh<CR>
autocmd Filetype c vnoremap <buffer> <localleader>nc	:s/\/\//<CR> :noh<CR>

autocmd Filetype vim nnoremap <buffer> <localleader>c	I"<esc>
autocmd Filetype vim vnoremap <buffer> <localleader>c	:s/^/"/<CR> :noh<CR>

"" Automatically open '.h' header for c files, if exists
"autocmd BufAdd *.c :call OpenHeader()
"function! OpenHeader()
	"let h_file = substitute(expand('%:t'),".c",".h","")
	"if filereadable( h_file )
		"execute "vsplit " . h_file
	"else
		"echo "No .h file found"
	"endif
"endfunction

" Underlines
nnoremap <Leader>= yypv$r=o<Esc>
inoremap <Leader>= <Esc>yypv$r=o
nnoremap <Leader>- yypv$r-o<Esc>
inoremap <Leader>- <Esc>yypv$r-o

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j     
endif


" Searching {{{
""""""""""""""""""""
set ignorecase " Make searches case-insensitive...
set smartcase  " ...unless they contain at least one uppercase character

" Navigation of parenthesis while in insert & normal
" }}}

" General hotkeys {{{
""""""""""""""""""""
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

" Open/source vimrc 

" }}}

vim: foldmethod=marker 
