""""""""""""""""""""
" Initialization
""""""""""""""""""""
runtime gvimrc

""""""""""""""""""""
" Appearance
""""""""""""""""""""
syntax enable
colorscheme solarized
set number				" Line numbers
set showtabline=2		" Always show tab line

" " Split windows below and right instead of above and left
set splitbelow splitright

" Open help in a vertical split instead of the default horizontal split
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>

set diffopt+=vertical	" 'Diff'ing always set to vertical

" Set invisible characters
let &listchars="eol:\<Char-0x00ac>,tab:▸\ "

" Scrolling gives room at top & bottom
"set scrolloff=10

" Hold Ctrl to center screen while scrolling 
nnoremap <C-j> jzz
nnoremap <C-k> kzz

"
" Formating 
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
"""""""""""""""""""
" Editing
"""""""""""""""""""
"
" Insert mode
"
" Remap 'jk' to escape, very quick :P
inoremap jk <Esc>l
" move cursor to end of line 
inoremap <Leader>a <Esc>A
" line below
inoremap <Leader>o <Esc>o
inoremap <Leader>O <Esc>O

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

"
" Normal mode
"
" Reset hightlighting after search
nnoremap <Leader>h	:noh<return>
" Show invisibles
nnoremap <Leader>l	:set list!<return>
" line below/above
nnoremap <Leader>o	o<Esc>
nnoremap <Leader>O	O<Esc>
" Scroll down/up
"nnoremap <C-j>		<C-E>
"nnoremap <C-k>		<C-Y>

" Work in progress.. delete following comment and put above
" nnoremap <S-h>		d$O<Esc>pu

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j     
endif
"
" Visual
"
" Insert C style comments 
"vmap <Leader>cc :s/^\s*/
vmap <Leader>cc :s/^\(\t*\w\)/\*\1/<CR>
"vmap <leader>cc :s/^/\*/<cr>
"vmap <leader>co :s/^\*//<cr>

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

