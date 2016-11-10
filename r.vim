" Vim syntax file
" Language:	      R (GNU S)
" Maintainer:	      Jakson Aquino <jalvesaq@gmail.com>
" Former Maintainers: Vaidotas Zemlys <zemlys@gmail.com>
" 		      Tom Payne <tom@tompayne.org>
" Last Change:	      Sun May 19, 2013  05:59PM
" Filenames:	      *.R *.r *.Rhistory *.Rt
" 
" NOTE: The highlighting of R functions is defined in the
" r-plugin/functions.vim, which is part of vim-r-plugin2:
" http://www.vim.org/scripts/script.php?script_id=2628
"
" CONFIGURATION:
"   syntax folding can be turned on by
"
"      let r_syntax_folding = 1
"
" Some lines of code were borrowed from Zhuojun Chen.

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword=@,48-57,_,.

if exists("g:r_syntax_folding")
  setlocal foldmethod=syntax
endif

syn case match

" Comment
syn match rComment contains=@Spell "#.*"

" Roxygen
syn match rOKeyword contained "@\(param\|description\|return\|name\|rdname\|details\|examples\|example\|include\|docType\)"
syn match rOKeyword contained "@\(S3method\|TODO\|aliases\|alias\|assignee\|author\|callGraphDepth\|callGraph\)"
syn match rOKeyword contained "@\(callGraphPrimitives\|concept\|exportClass\|exportMethod\|exportPattern\|export\|formals\)"
syn match rOKeyword contained "@\(format\|importClassesFrom\|importFrom\|importMethodsFrom\|import\|keywords\)"
syn match rOKeyword contained "@\(method\|nord\|note\|references\|seealso\|setClass\|slot\|source\|title\|usage\)"
syn match rOComment contains=@Spell,rOKeyword "#'.*"


if &filetype == "rhelp"
  " string enclosed in double quotes
  syn region rString contains=rSpecial,@Spell start=/"/ skip=/\\\\\|\\"/ end=/"/
  " string enclosed in single quotes
  syn region rString contains=rSpecial,@Spell start=/'/ skip=/\\\\\|\\'/ end=/'/
else
  " string enclosed in double quotes
  syn region rString contains=rSpecial,rStrError,@Spell start=/"/ skip=/\\\\\|\\"/ end=/"/
  " string enclosed in single quotes
  syn region rString contains=rSpecial,rStrError,@Spell start=/'/ skip=/\\\\\|\\'/ end=/'/
endif

syn match rStrError display contained "\\."


" New line, carriage return, tab, backspace, bell, feed, vertical tab, backslash
syn match rSpecial display contained "\\\(n\|r\|t\|b\|a\|f\|v\|'\|\"\)\|\\\\"

" Hexadecimal and Octal digits
syn match rSpecial display contained "\\\(x\x\{1,2}\|[0-8]\{1,3}\)"

" Unicode characters
syn match rSpecial display contained "\\u\x\{1,4}"
syn match rSpecial display contained "\\U\x\{1,8}"
syn match rSpecial display contained "\\u{\x\{1,4}}"
syn match rSpecial display contained "\\U{\x\{1,8}}"

" Statement
syn keyword rStatement   break next return
syn keyword rConditional if else
syn keyword rRepeat      for in repeat while

" Constant (not really)
syn keyword rConstant T F LETTERS letters month.abb month.name pi
syn keyword rConstant R.version.string

syn keyword rNumber   NA_integer_ NA_real_ NA_complex_ NA_character_ 

" Constants
syn keyword rConstant NULL
syn keyword rBoolean  FALSE TRUE
syn keyword rNumber   NA Inf NaN 

" integer
syn match rInteger "\<\d\+L"
syn match rInteger "\<0x\([0-9]\|[a-f]\|[A-F]\)\+L"
syn match rInteger "\<\d\+[Ee]+\=\d\+L"

" number with no fractional part or exponent
syn match rNumber "\<\d\+\>"
" hexadecimal number 
syn match rNumber "\<0x\([0-9]\|[a-f]\|[A-F]\)\+"

" floating point number with integer and fractional parts and optional exponent
syn match rFloat "\<\d\+\.\d*\([Ee][-+]\=\d\+\)\="
" floating point number with no integer part and optional exponent
syn match rFloat "\<\.\d\+\([Ee][-+]\=\d\+\)\="
" floating point number with no fractional part and optional exponent
syn match rFloat "\<\d\+[Ee][-+]\=\d\+"

" complex number
syn match rComplex "\<\d\+i"
syn match rComplex "\<\d\++\d\+i"
syn match rComplex "\<0x\([0-9]\|[a-f]\|[A-F]\)\+i"
syn match rComplex "\<\d\+\.\d*\([Ee][-+]\=\d\+\)\=i"
syn match rComplex "\<\.\d\+\([Ee][-+]\=\d\+\)\=i"
syn match rComplex "\<\d\+[Ee][-+]\=\d\+i"

syn match rOperator    "&"
syn match rOperator    '-'
syn match rOperator    '\*'
syn match rOperator    '+'
syn match rOperator    '='
if &filetype != "rmd" && &filetype != "rrst"
  syn match rOperator    "[|!<>^~/:]"
else
  syn match rOperator    "[|!<>^~`/:]"
endif
syn match rOperator    "%\{2}\|%\S*%"
syn match rOpError  '\*\{3}'
syn match rOpError  '//'
syn match rOpError  '&&&'
syn match rOpError  '|||'
syn match rOpError  '<<'
syn match rOpError  '>>'

syn match rArrow "<\{1,2}-"
syn match rArrow "->\{1,2}"

" Special
syn match rDelimiter "[,;:]"
syn match rGroup "[()\[\]{}]"

" match valid R object name followed by a parenthesis (separate by 0 or more spaces)
syn match rFunction "\(\(\a\|\.\a\|\._\|\.\.\)[\._\a0-9]*\)\+\ *[(]\@="


" Error
if exists("g:r_syntax_folding")
"   syn region rRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError fold
"   syn region rRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError fold
"   syn region rRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError fold
" else
"   syn region rRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError
"   syn region rRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError
"   syn region rRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError
endif
" 
" syn match rError      "[)\]}]"
" syn match rBraceError "[)}]" contained
" syn match rCurlyError "[)\]]" contained
" syn match rParenError "[\]}]" contained

" Source list of R functions. The list is produced by the Vim-R-plugin
" http://www.vim.org/scripts/script.php?script_id=2628
runtime r-plugin/functions.vim

syn match rDollar display contained "\$"
syn match rDollar display contained "@"

" List elements will not be highlighted as functions:
syn match rLstElmt "\$[a-zA-Z0-9\\._]*" contains=rDollar
syn match rLstElmt "@[a-zA-Z0-9\\._]*" contains=rDollar

" Functions that may add new objects
syn keyword rPreProc     library require attach detach source

if &filetype == "rhelp"
    syn match rHelpIdent '\\method'
    syn match rHelpIdent '\\S4method'
endif

" Type
syn keyword rType array category character complex double function integer list logical matrix numeric vector data.frame 

" Name of object with spaces
if &filetype != "rmd" && &filetype != "rrst"
  syn region rNameWSpace start="`" end="`"
endif

if &filetype == "rhelp"
  syn match rhPreProc "^#ifdef.*" 
  syn match rhPreProc "^#endif.*" 
  syn match rhSection "\\dontrun\>"
endif

" redefine colors for strings and comments
" hi String     ctermfg=lightred
" hi Comment    ctermfg=darkgray
"hi Statement  ctermfg=brown
"hi Type       ctermfg=darkcyan
"hi Operator   ctermfg=brown
"hi Number     ctermfg=darkred
"hi Delimiter  ctermfg=darkmagenta
"
hi rArrow       ctermfg=yellow      cterm=bold
hi rComment     ctermfg=darkgray    cterm=bold
hi rDelimiter   ctermfg=darkmagenta cterm=none
hi rFunction    ctermfg=blue        cterm=none
hi rGroup       ctermfg=cyan        cterm=none
hi rString      ctermfg=lightred    cterm=bold
hi rType        ctermfg=green       cterm=bold
" 
" "hi Statement   ctermfg=yellow  cterm=none
" hi Statement   ctermfg=yellow  cterm=bold
" 
" 
" hi Operator    ctermfg=yellow  cterm=none
" 
" hi Number      ctermfg=red  cterm=none
" 
" hi Delimiter   ctermfg=cyan  cterm=none
" 
" "hi Function    ctermfg=cyan  cterm=bold
" "hi Function    ctermfg=cyan  cterm=none
" "hi Function    ctermfg=blue  cterm=bold
" 
" hi Boolean     ctermfg=white  cterm=none
" hi Error       ctermfg=white  cterm=none
" hi Conditional ctermfg=red cterm=none
" hi Constant    ctermfg=white  cterm=none
" 
" hi PreProc     ctermfg=magenta cterm=bold



" " Define the default highlighting.
" hi def link rArrow       Statement	
" hi def link rBoolean     Boolean
" hi def link rBraceError  Error
" hi def link rComment     Comment
" hi def link rOComment    Comment
" hi def link rComplex     Number
" hi def link rConditional Conditional
" hi def link rConstant    Constant
" hi def link rCurlyError  Error
" hi def link rDelimiter   Delimiter
" hi def link rDollar      SpecialChar
" hi def link rError       Error
" hi def link rFloat       Float
" hi def link rFunction    Function
" hi def link rHelpIdent   Identifier
" hi def link rhPreProc    PreProc
" hi def link rhSection    PreCondit
" hi def link rInteger     Number
" hi def link rLstElmt	 Normal
" hi def link rNameWSpace  Normal
" hi def link rNumber      Number
" hi def link rOperator    Operator
" hi def link rOpError     Error
" hi def link rParenError  Error
" hi def link rPreProc     PreProc
" hi def link rRepeat      Repeat
" hi def link rSpecial     SpecialChar
" hi def link rStatement   Statement
" hi def link rString      String
" hi def link rStrError    Error
" hi def link rType        Type
" hi def link rOKeyword    Title

let b:current_syntax="r"

" vim: ts=8 sw=2
