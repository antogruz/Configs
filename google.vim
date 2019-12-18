nnoremap <silent> gs :set opfunc=GoogleText<CR>g@
vnoremap <silent> gs :<C-u>call GoogleText(visualmode(), 1)<Cr>

function! GoogleText(type, ...)

  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use '< and '> marks.
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
  endif

  let search = substitute(trim(@@), ' \+', '+', 'g')
  silent exe "!open 'https://google.com/search?q=" . search . "' -a Google\\ Chrome"

  let &selection = sel_save
  let @@ = reg_save

endfunction

