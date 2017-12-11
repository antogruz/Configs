execute 'syn keyword Find' .  b:findCount % 7 . " " . expand("<cword>")
let b:findCount +=1
normal N
execute "noh"
