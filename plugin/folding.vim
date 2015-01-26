let &fillchars="fold:\-"

if has("folding")
  set foldtext=FoldText()
  function! FoldText()
	let l:lpadding = &fdc
	redir => l:signs
	  execute 'silent sign place buffer='.bufnr('%')
	redir End
	let l:lpadding += l:signs =~ 'id=' ? 2 : 0

	if exists("+relativenumber")
	  if (&number)
		let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
	  elseif (&relativenumber)
		let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
	  endif
	else
	  if (&number)
		let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
	  endif
	endif

	" expand tabs
	let foldchar = matchstr(&fillchars, 'fold:\zs.')
	let charline = v:foldstart
	let commentchar = ''
	if match( getline(v:foldstart), '^\s*\/\*' ) == 0
		let charline = v:foldstart+1
		let commentchar = '/'
	endif

	let l:line = ' ' . commentchar . substitute(getline(charline),'^\s*"\?\s*\|\s*"\?\s*{{\*\\s*' . '{\d*\s*', '', 'g')
	let l:start = strpart('+-' . repeat(foldchar, indent(charline)-3) . l:line, 0, (winwidth(0)*2)/3)
	""let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')
	let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^.*\([*}]\)', '\1', '')

	let lines_count = v:foldend - v:foldstart + 1
	let l:info = '(' . lines_count . ' lines' . ')'
	let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
	let l:width = winwidth(0) - l:lpadding - l:infolen

	"s/^.*\([*}]\)/\1/gc
	"let l:separator=nr2char(8943)
	"if has ("win32")
	"	let l:separator = '…'
	"end if
	
	"let l:separator=nr2char(8943)
	let l:separator="..."
	let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
	let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
	let l:text = l:start . l:separator .   l:end . ' '

	return l:text . repeat( foldchar, l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
  endfunction
endif
