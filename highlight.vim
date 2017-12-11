if b:findCount % 2 == 0
  let b:findKeyword="Find0"
elseif b:findCount % 2 == 1
  let b:findKeyword="Find1"
endif
let b:findCount +=1
execute 'syn keyword ' . b:findKeyword . " " . expand("<cword>")
normal N
execute "noh"
