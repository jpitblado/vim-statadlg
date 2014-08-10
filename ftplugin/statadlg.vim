" ftplugin/statadlg.vim - maps for Stata dialog source files
" Maintainer:   Jeff Pitblado <jpitblado@stata.com>
" Last Change:  09aug2014

if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

" I use '!!rm' in my debug output so it is easy to search for and remove later

" insert/remove double bang comment start of line
nnoremap <buffer> <localleader>c 0i//!!rm <esc>0j
nnoremap <buffer> <localleader>C 07xj

" update the version comment at the top of the file
nnoremap <buffer> <localleader>uu gg/\<version\>\\|\<VERSION\>/<cr>6wcw<esc>,ddJ,nn
nnoremap <buffer> <localleader>vv ,uu?\.?<cr><c-a>,nn
nnoremap <buffer> <localleader>hh gg/\<version\>\\|\<VERSION\>/<cr>6wcw<cr><esc>k,ddJJx?\.?<cr><c-a>,nn

" end: ftplugin/statadlg.vim
