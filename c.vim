"Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function

"syn match customComma "\," contained
" Last defined pattern has higher priority
"syn match customLastArg "\s*\h*\s*" contained
"syn match customArgs "\s*\h*\s*\," contained contains=customComma

"syn region cFunctionArguments start=cCustomFunc end=")" contains=customArgs,customLastArg

syn match assertFunction "assert\h*(" contains=cCustomParen

syn match AL_Prefix "AL_"

"Highlight Function Definitions
syn match cFuncDefinition "\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"

syn keyword Statement struct typedef union enum static const

syn keyword Type AL_8U AL_16U AL_32U AL_8S AL_16S AL_32S AL_INT
syn keyword Type AL_BOOL AL_SIZE AL_PTR

syn keyword Constant AL_TRUE AL_FALSE

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

