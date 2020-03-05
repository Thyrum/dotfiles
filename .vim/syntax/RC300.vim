" Vim syntax file
" Language: RC300
" Maintainer: Aron de Jong
" Last Change: 2020-03-05

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

let b:current_syntax = "RC300"

syn match RC300Number /\d\+/
syn keyword basicLanguageKeywords SET ADD SUB COMP TRANS
syn keyword basicLanguageKeywords JUMP BJUMP DIE MOVE TURN SCAN CREATE
syn match RC300Comment /;.*$/
syn keyword RC300meta PUBLISHED NAME AUTHOR
syn match RC300variable /#0*\([1-9]\|1[0-9]\|20\)\>/
syn match RC300variable /%\<\a\+\>/
syn match RC300Label /@\<\a\+\>/

hi def link RC300Comment			Comment
hi def link basicLanguageKeywords	Statement
hi def link RC300meta				PreProc
hi def link RC300variable			Identifier
hi def link RC300Number				Constant
hi def link RC300Label				Label
