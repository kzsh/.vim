" Vim filetype plugin
" Language:		Java
" Maintainer:		Andrew Hunt <andrew@hunt.li>

nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
nnoremap <silent> <buffer> <leader>hh :JavaCallHierarchy<cr>
nnoremap <silent> <buffer> <leader>HH :JavaHierarchy<cr>

