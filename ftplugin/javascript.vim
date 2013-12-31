function! GS()
  :let spacing = indent(".")
  :let spaces = ""
  :while spacing > 0
  :    let spaces = spaces . " "
  :    let spacing -= 1
  :endwhile
  "let prefix = "_set"
  "let postfix = "Attr: function () {"
  let wordUnderCursor = expand("<cword>")
  let uWordUnderCursor = toupper(wordUnderCursor[0]) . wordUnderCursor[1:]
  "echo wordUnderCursor
  :normal o
  call setline('.', "")
  :normal o
  call setline('.', spaces . "/**")
  :normal o
  call setline('.', spaces . " * getter function this." . wordUnderCursor)
  :normal o
  call setline('.', spaces . " */")
  :normal o
  call setline('.', spaces . "_get" . uWordUnderCursor . "Attr: function () {")
  :normal o
  call setline('.', spaces . "    return this." . wordUnderCursor . ";")
  :normal o
  call setline('.', spaces . "},")

  :normal o
  call setline('.', "")
  :normal o
  call setline('.', spaces . "/**")
  :normal o
  call setline('.', spaces . " * setter function for this." . wordUnderCursor)
  :normal o
  call setline('.', spaces . " */")
  :normal o
  call setline('.', spaces . "_set" . uWordUnderCursor . "Attr: function (val) {")
  :normal o
  call setline('.', spaces . "    this." . wordUnderCursor . " = val;" )
  :normal o
  call setline('.', spaces . "    return val;" )
  :normal o
  call setline('.', spaces . "},")
endfunction
