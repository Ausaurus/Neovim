if exists('b:did_indent') | finish | endif
let b:did_indent = 1

setlocal indentexpr=LinkerIndent()
setlocal indentkeys=o,O,0{,0},:,0#
" use your normal shiftwidth/expandtab settings

function! LinkerIndent() abort
  let lnum = v:lnum
  let line = getline(lnum)
  let plnum = prevnonblank(lnum - 1)
  if plnum <= 0
    return 0
  endif
  let pline = getline(plnum)
  let pin = indent(plnum)

  " Top-level keywords stay at column 0
  if line =~ '^\s*\(ENTRY\|MEMORY\|SECTIONS\)\>'
    return 0
  endif

  " Closing brace aligns to the line that opened the block
  if line =~ '^\s*}'
    " find matching {
    let open = searchpair('{', '', '}', 'bnW')
    return open > 0 ? indent(open) : 0
  endif

  " If previous nonblank ends with '{', indent one level
  if pline =~ '{\s*$'
    return pin + &shiftwidth
  endif

  " If previous nonblank is a closing brace, align with it
  if pline =~ '^\s*}'
    return pin
  endif

  " Otherwise keep previous indent
  return pin
endfunction

