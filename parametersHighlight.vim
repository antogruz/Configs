let s:params=1
s/,/\=execute("let s:params+=1")/gne
noh
silent! execute("/gradebug/e")

normal f)
for i in range(1, s:params)
  normal b
  source ~/.vim/highlight.vim
  normal F,
endfor
