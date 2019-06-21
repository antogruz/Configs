syn match assertFunction "assert\h*"

hi link javaAnnotation Comment
hi link javaCommentTitle Comment
hi link javaDocTags Comment
hi link javaDocParam Comment

" To test highlight
syn keyword Type Type
syn keyword Identifier Identifier
syn keyword Statement Statement
syn keyword Normal Normal
syn keyword Comment Comment
syn keyword Constant Constant
syn keyword PreProc PreProc
syn keyword Special Special
syn keyword Underlined Underlined
syn keyword Ignore Ignore
syn keyword Error Error
syn keyword Todo Todo

"syn region javaFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^>]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*\ze(+ end=+\ze(+ contains=javaScopeDecl,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses

syn keyword Public public
syn keyword Private private
