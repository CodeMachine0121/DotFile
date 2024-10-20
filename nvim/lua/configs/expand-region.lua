vim.cmd([[
  autocmd FileType python call expand_region#custom_text_objects('python', {
    \ 'iw'  : 0,
    \ 'iW'  : 0,
    \ 'i"'  : 0,
    \ 'i''' : 0,
    \ 'i)'  : 1,
    \ 'i]'  : 1,
    \ 'i}'  : 1,
    \ 'if'  : 1,
    \ 'ic'  : 1,
    \ 'ip'  : 0,
    \ })
]])
