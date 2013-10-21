syntax enable

set t_Co=16
set background=dark
colorscheme solarized

" Wishlist
" Better tab switching
" For C style comments

inoremap /**    /**<CR>/<Esc>O
inoremap /*<Space>  /*<Space><Space>*/ <Left><Left><Left><Left>
set formatoptions+=ro

" For loop abbreviation, could use improvement
abb FF for( int i = 0; i < ; ++i<Left><Left><Left><Left><Left><Left>

" Closing brackets, parenthesis, etc
inoremap (      ()<Left>
inoremap (<Space>      (<Space><Space>)<Left><Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ()     ()
inoremap (<BS>  <Nop>
inoremap (<Space><BS>  <Nop>
inoremap (<Del><BS> ( 

inoremap [      []<Left>
inoremap [<Space>      [<Space><Space>]<Left><Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap []     []
inoremap [<BS>  <Nop>
inoremap [<Space><BS>  <Nop>
inoremap [<Del><BS> [ 

inoremap {      {}<Left>
inoremap {<Space>      {<Space><Space>}<Left><Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
inoremap {<BS>  <Nop>
inoremap {<Space><BS>  <Nop>
inoremap {<Del><BS> { 

" Because its broken on gVim
"inoremap <C-[> <Esc>

" Remap 'jk' to escape, very quick :P
inoremap jk <Esc>l

" Reset hightlighting after search
nnoremap <Leader>h :noh<return>
" While typing, '\a' will move cursor to end of line in insert
inoremap <Leader>a <Esc>A

" Navigation of parenthesis while in insert & normal
inoremap <Leader>(  <Esc>[(a
inoremap <Leader>)  <Esc>])a
inoremap <Leader>{  <Esc>[{a
inoremap <Leader>}  <Esc>]}a

" 'Diff'ing always set to vertical
set diffopt+=vertical

" Set invisible characters
set listchars=eol:¬,tab:\|\s

" Set formatting( tabs, column width, tabwidth, etc. ) 
    
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set textwidth=79
set number

" Folding settings
set foldmethod=syntax
set foldlevelstart=0

set smartindent 

lcd
source .gvimrc
source statusline.vim
source tabline.vim
source folding.vim
