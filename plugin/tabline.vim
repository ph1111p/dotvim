" Better tablines

" Bail quickly if the plugin was loaded, disabled or compatible is set
if (exists("g:loaded_tabline_vim") && g:loaded_tabline_vim) || &cp
  finish
endif
let g:loaded_tabline_vim = 1

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. pathshorten(fnamemodify(bufname, ":p:~:.")) . ']' : '[No Name]')
    
    let numtabwin = tabpagewinnr(tab, '$')
    let tabwinnum = ''
    if numtabwin > 1
        "let tabwinnum = ' ('. numtabwin . ')'
        for j in range(tabpagewinnr(tab, '$')-1)
            let tabwinnum .= "]"
        endfor
    endif

    if bufmodified
      let s .= '[+]'
    endif
    let s.= tabwinnum . ' '
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!Tabline()

