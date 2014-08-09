" statadlg.vim -- Vim syntax file for Stata dlg and idlg files.
" Language:	Stata DIALOG
" Maintainer:	Jeff Pitblado <jpitblado@stata.com>
" Last Change:	27nov2013
" Version:	2.0.0

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax clear
syntax case match

" Dialog controls
syn keyword dlgControl ARRAY		contained
syn keyword dlgControl BOOLEAN		contained
syn keyword dlgControl BROWSE		contained
syn keyword dlgControl BUTTON		contained
syn keyword dlgControl CANCEL		contained
syn keyword dlgControl CHECKBOX		contained
syn keyword dlgControl COLOR		contained
syn keyword dlgControl COMBOBOX		contained
syn keyword dlgControl EDIT		contained
syn keyword dlgControl EXP		contained
syn keyword dlgControl FILE		contained
syn keyword dlgControl FRAME		contained
syn keyword dlgControl GROUPBOX		contained
syn keyword dlgControl HLINK		contained
syn keyword dlgControl LISTBOX		contained
syn keyword dlgControl MODAL		contained
syn keyword dlgControl OK		contained
syn keyword dlgControl RADIO		contained
syn keyword dlgControl SPINNER		contained
syn keyword dlgControl STRING		contained
syn keyword dlgControl SUBMIT		contained
syn keyword dlgControl SYNCHRONOUS_ONLY	contained
syn keyword dlgControl TEXT		contained
syn keyword dlgControl TEXTBOX		contained
syn keyword dlgControl VARLIST		contained
syn keyword dlgControl VARNAME		contained
syn keyword dlgControl create		contained

" Tab
syn keyword dlgTab DIALOG

" Preprocessor
syn keyword dlgInclude INCLUDE

" Macros
syn keyword dlgMacro DEFINE

" Scripts, programs and lists
syn keyword dlgScript PROGRAM
syn keyword dlgScript SCRIPT
syn keyword dlgScript LIST

" Statements
syn keyword dlgStatement HELP
syn keyword dlgStatement POSITION
syn keyword dlgStatement RESET
syn keyword dlgStatement VERSION

" Control options that do not take arguments
syn keyword dlgOption append		contained
syn keyword dlgOption allowcat		contained
syn keyword dlgOption allowts		contained
syn keyword dlgOption first		contained
syn keyword dlgOption groupbox		contained
syn keyword dlgOption last		contained
syn keyword dlgOption middle		contained
syn keyword dlgOption nomem[ory]	contained
syn keyword dlgOption numonly		contained

" Control options that take arguments
syn region dlgOption start=/contents(/		end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/default(/		end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/error(/		end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/label(/		end=/)/	oneline contains=dlgString
syn region dlgOption start=/tooltip(/		end=/)/	        contains=dlgString
syn region dlgOption start=/max(/		end=/)/	oneline contained
syn region dlgOption start=/min(/		end=/)/	oneline contained
syn region dlgOption start=/onclickoff(/	end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/onclickon(/	end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/ondblclick(/	end=/)/	oneline contained
syn region dlgOption start=/onpush(/		end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/onselchange(/	end=/)/	oneline contained
syn region dlgOption start=/onselchangelist(/	end=/)/	oneline contained
syn region dlgOption start=/option(/		end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/push(/		end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/tabtitle(/		end=/)/	oneline contains=dlgString
syn region dlgOption start=/value(/		end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/values(/		end=/)/	oneline contains=dlgString contained
syn region dlgOption start=/view(/		end=/)/	oneline

" PROGRAM sub-commands
syn keyword dlgProgram allowxi		contained
syn keyword dlgProgram beginoptions	contained
syn keyword dlgProgram call		contained
syn keyword dlgProgram disable		contained
syn keyword dlgProgram else		contained
syn keyword dlgProgram enable		contained
syn keyword dlgProgram endoptions	contained
syn keyword dlgProgram gaction		contained
syn keyword dlgProgram hide		contained
syn keyword dlgProgram if		contained
syn match dlgProgram /option[^(]/	contained
syn keyword dlgProgram optionarg	contained
syn keyword dlgProgram program		contained
syn keyword dlgProgram put		contained
syn keyword dlgProgram require		contained
syn keyword dlgProgram script		contained
syn keyword dlgProgram setfalse		contained
syn keyword dlgProgram setposition	contained
syn keyword dlgProgram setstring	contained
syn keyword dlgProgram settrue		contained
syn keyword dlgProgram setvalue		contained
syn keyword dlgProgram show		contained
syn keyword dlgProgram stopbox		contained
syn keyword dlgProgram varlist		contained
syn keyword dlgProgram weight		contained
syn keyword dlgProgram withvalue	contained

syn cluster dlgBlockContents contains=ALLBUT,dlgTab,dlgScript,dlgStatement,dlgErrInParen,dlgErrInBrace,dlgErrInBracket

" Blocks
syn region dlgBlock matchgroup=dlgControl start=/BEGIN/ end=/END/ contains=@dlgBlockContents

" numeric formats
syn match  dlgFormat /%-\=\d\+\.\d\+[efg]c\=\s/
" numeric hex format
syn match  dlgFormat /%-\=21x\s/
" string format
syn match  dlgFormat /%-\=\d\+s\s/

" comments - single line
" note that the triple slash continuing line comment comes free
syn region dlgSlashComment start="\s//"   end=/$/    contains=dlgComment oneline
syn region dlgSlashComment start="^//"   end=/$/    contains=dlgComment oneline
syn region dlgSlashComment start="^///"   end=/$/    contains=dlgComment oneline
" comments - multiple line
syn region dlgComment      start="/\*"    end="\*/"  contains=dlgComment

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Literals
syn region dlgString  matchgroup=NONE start=/"/ end=/"/   oneline contains=@dlgMacroGroup
syn region dlgEString matchgroup=NONE start=/`"/ end=/"'/ oneline contains=@dlgMacroGroup,dlgEString

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Errors to catch
" taken from $VIMRUNTIME/syntax/c.vim 
" catch errors caused by wrong parenthesis, braces and brackets
syn cluster dlgParenGroup	contains=dlgParenError,dlgBracketError,dlgBraceError,dlgSpecial,dlgFormat
syn region dlgParen		transparent start=/(/ end=/)/  contains=ALLBUT,@dlgParenGroup,dlgErrInBracket,dlgErrInBrace
syn region dlgBracket		transparent start=/\[/ end=/]/ contains=ALLBUT,@dlgParenGroup,dlgErrInParen,dlgErrInBrace
syn region dlgBrace		transparent start=/{/ end=/}/  contains=ALLBUT,@dlgParenGroup,dlgErrInParen,dlgErrInBracket
syn match dlgParenError	/[\])}]/
syn match dlgBracketError	/]/
syn match dlgBraceError	/}/
syn match dlgErrInParen	contained /[\]{}]/
syn match dlgErrInBracket	contained /[){}]/
syn match dlgErrInBrace	contained /[)\]]/

" assign highlight groups

hi link dlgBlockKw		dlgControl
hi link dlgBlockKw		dlgControl
hi link dlgBlock		NONE
hi link dlgMacro		dlgControl
hi link dlgOptionBlock		NONE
hi link dlgScript		dlgControl
hi link dlgStatement		dlgControl

hi link dlgBraceError		dlgError
hi link dlgBracketError		dlgError
hi link dlgErrInBrace		dlgError
hi link dlgErrInBracket		dlgError
hi link dlgErrInParen		dlgError
hi link dlgEString		dlgString
hi link dlgParenError		dlgError
hi link dlgSlashComment		dlgComment

hi link dlgComment		Comment
hi link dlgControl		Define
hi link dlgFormat		SpecialChar
hi link dlgInclude		Include
hi link dlgOption		Type
hi link dlgProgram		Statement
hi link dlgString		String
hi link dlgTab			Define

hi link dlgError		Error

let b:current_syntax = "statadlg"

" vim: ts=8
