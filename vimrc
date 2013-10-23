""""""""""""""""""""
" Initialization
""""""""""""""""""""
runtime gvimrc
syntax enable
colorscheme solarized

""""""""""""""""""""
" Insert mode
""""""""""""""""""""
inoremap jk <Esc>l			" Remap 'jk' to escape, very quick :P
inoremap <Leader>a <Esc>A	" move cursor to end of line 
inoremap <Leader>o <Esc>o	" line below
inoremap <Leader>O <Esc>O	" line above

" Closing brackets, parenthesis, etc
"" Worth making into function?
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

inoremap /**	/**<CR>/<Esc>O
inoremap /*<Space>	/*<Space><Space>*/ <Left><Left><Left><Left>


""""""""""""""""""""
" Normal mode
""""""""""""""""""""
nnoremap <Leader>h	:noh<return>			" Reset hightlighting after search
nnoremap <Leader>l	:set list!<return>	" Show invisibles
nnoremap <Leader>o	o<Esc>				" line below
nnoremap <Leader>O	O<Esc>				" line above
nnoremap <C-j>		<C-E>				" Scroll down
nnoremap <C-k>		<C-Y>				" Scroll down

""""""""""""""""""""
" Searching
""""""""""""""""""""
set ignorecase " Make searches case-insensitive...
set smartcase  " ...unless they contain at least one uppercase character

" Navigation of parenthesis while in insert & normal
inoremap <Leader>(	<Esc>[(a
inoremap <Leader>)	<Esc>])a
inoremap <Leader>{	<Esc>[{a
inoremap <Leader>}	<Esc>]}a

""""""""""""""""""""
" Formating 
""""""""""""""""""""
" Set formatting( tabs, column width, tabwidth, etc. ) 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab			" Tabs
set textwidth=79
set number				" Line numbers
set formatoptions+=ro	" Comment leaders for inserting line above/below
set showtabline=2		" Always show tab line
set diffopt+=vertical	" 'Diff'ing always set to vertical

" Set invisible characters
let &listchars="eol:\<Char-0x00ac>,tab:▸\ "

" Folding settings
set foldmethod=syntax
set foldlevelstart=0

set smartindent 
