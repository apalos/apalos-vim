" Vim color scheme
" Name:					apalos.vim
" Author:				Ilias Apalodimas <apalos@gmail.com>
" Version:				0.1.1

" Based vividchalk
" Functions shamelesly stolen from vivdchalk.vim. All credit goes there!
" Distributable under the same terms as Vim itself (see :help license)
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim


" gui/cterm - sets the style
" guifg/ctermfg - set the text color
" guibg/ctermbg - set the highlighting
" DiffAdd - line was added
" DiffDelete - line was removed
" DiffChange - part of the line was changed (highlights the whole line)
" DiffText - the exact part of the line that changed

set background=dark
set t_Co=256
hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "apalos"

" map a urxvt cube number to an xterm-256 cube number
fun! s:M(a)
	return strpart("0245", a:a, 1) + 0
endfun

" mac crap
if !has("gui_mac")
	" Mac GUI degrades italics to ugly underlining.
	hi Comment gui=italic
	hi railsUserClass  gui=italic
	hi railsUserMethod gui=italic
endif

if &t_Co == 256
	highlight StatusLine ctermbg=117
else
	highlight StatusLine ctermbg=43
endif

" map a urxvt colour to an xterm-256 colour
fun! s:X(a)
	if &t_Co == 88
		return a:a
	else
		if a:a == 8
			return 237
		elseif a:a < 16
			return a:a
		elseif a:a > 79
			return 232 + (3 * (a:a - 80))
		else
			let l:b = a:a - 16
			let l:x = l:b % 4
			let l:y = (l:b / 4) % 4
			let l:z = (l:b / 16)
			return 16 + s:M(l:x) + (6 * s:M(l:y)) + (36 * s:M(l:z))
		endif
	endif
endfun

function! s:choose(mediocre, good)
	if &t_Co != 88 && &t_Co != 256
		return a:mediocre
	else
		return s:X(a:good)
	endif
endfunction

"a:0 number of extra args(after 'second', a:0 is if more than 4 args are
"passed)
"a:1 is the first arg etc
function! s:hifg(group, guifg, first, second,...)
	if a:0 && &t_Co == 256
		let ctermfg = a:1
	else
		let ctermfg = s:choose(a:first, a:second)
	endif
	exe "highlight ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

function! s:hibg(group, guibg, first, second)
	let ctermbg = s:choose(a:first, a:second)
	exe "highlight ".a:group." guibg=".a:guibg." ctermbg=".ctermbg
endfunction

" Links Highlighting
hi link railsMethod					PreProc
hi link rubyDefine					Keyword
hi link rubySymbol					Constant
hi link rubyAccess					rubyMethod
hi link rubyAttribute				rubyMethod
hi link rubyEval					rubyMethod
hi link rubyException				rubyMethod
hi link rubyInclude					rubyMethod
hi link rubyStringDelimiter 		rubyString
hi link rubyRegexp					Regexp
hi link rubyRegexpDelimiter 		rubyRegexp
hi link javascriptRegexpString		Regexp
hi link javascriptNumber			Number
hi link javascriptNull				Constant
hi link diffAdded					String
hi link diffRemoved					Statement
hi link diffLine					PreProc
hi link Question					MoreMsg
hi link diffSubname					Comment
hi link FoldColumn					Folded
hi link Directory					Identifier

" Highlighting
hi StatusLine		guifg=Black	guibg=#aabbee gui=bold ctermfg=Black ctermbg=White cterm=bold
hi StatusLineNC		guifg=#444444 guibg=#aaaaaa gui=none ctermfg=Black ctermbg=Grey	cterm=none
hi Ignore			ctermfg=Black
hi WildMenu			guifg=Black		guibg=#ffff00 gui=bold ctermfg=Black ctermbg=Yellow cterm=bold
hi Cursor			guifg=Black guibg=White ctermfg=Black ctermbg=White
hi NonText			guifg=#404040 ctermfg=8
hi SpecialKey		guifg=#404040 ctermfg=8
hi Directory		none
hi ErrorMsg			guibg=Red ctermbg=DarkRed guifg=NONE ctermfg=NONE
hi Search			guifg=Yellow guibg=Purple gui=underline ctermfg=NONE cterm=none
hi IncSearch		guifg=Black guibg=Yellow ctermfg=White ctermbg=Black
hi MoreMsg			guifg=#00AA00 ctermfg=Green
hi LineNr			guifg=#DDEEFF ctermfg=White
hi Question			none
hi Title			guifg=Magenta ctermfg=Magenta
hi VisualNOS		gui=none cterm=none
hi WarningMsg		guifg=Red ctermfg=Red
hi Error			ctermbg=DarkRed
hi SpellBad			ctermbg=DarkRed
hi SpellRare		ctermbg=DarkMagenta
hi SpellCap			ctermbg=DarkBlue
hi SpellLocal		ctermbg=DarkCyan
hi FoldColumn		none
hi Pmenu			guifg=White ctermfg=White gui=bold cterm=bold
hi PmenuSel			guifg=White ctermfg=White gui=bold cterm=bold
hi PmenuSbar		guibg=Grey ctermbg=Grey
hi PmenuThumb		guibg=White ctermbg=White
hi TabLine			gui=underline cterm=underline
hi TabLineSel		guifg=White guibg=Black ctermfg=White ctermbg=Black
hi TabLineFill		gui=underline cterm=underline
hi Type 			gui=none
hi Statement 		gui=none
hi Identifier 		cterm=none
hi Visual               guifg=Yellow guibg=Grey gui=none

" Diff
call s:hibg("DiffAdd", "DarkGreen", "White", "DarkGreen")
call s:hifg("DiffAdd", "White", "White", "White")

call s:hibg("DiffDelete", "DarkRed", "DarkRed", "DarkRed")
call s:hifg("DiffDelete", "White", "DarkRed", "White")

call s:hibg("DiffText", "Brown", "DarkGreen", "Brown")
call s:hifg("DiffText", "White", "SeaGreen2", "White")

call s:hibg("DiffChange", "DarkGrey", "DarkBlue", "DarkGrey")
call s:hifg("DiffChange", "White", "DarkBlue", "White")

" Commented numbers at the end are *old* 256 color values
call s:hifg("Comment", "#ffd787", "DarkMagenta", 75, 222)
call s:hifg("Constant", "#00af5f", "DarkCyan", 21, 35)
call s:hifg("rubyNumber", "#5f5f87", "Yellow", 60)
call s:hifg("String", "#5fff5f", "SeaGreen2", 44, 83)
call s:hifg("Identifier", "#ff5fd7", "Yellow", 72, 206)
call s:hifg("Statement", "#5fd7ff", "Brown", 170, 81)
call s:hifg("PreProc", "#ff0000", "LightCyan", 47, 196)
call s:hifg("railsUserMethod", "#005fff", "LightCyan", 27)
call s:hifg("Type",	 "#ff5f00", "Grey", 57, 202)
call s:hifg("railsUserClass", "#0000af", "Grey", 16)
call s:hifg("Special", "#005f87", "DarkGreen", 24)
call s:hifg("Regexp", "#0000ff", "DarkCyan", 21)
call s:hifg("rubyMethod", "#5fd75f", "Yellow", 77)
call s:hifg("VertSplit", "#af87d7", "Yellow", 1, 140)
call s:hifg("Normal", "#bcbcbc", "White", 87, 248)
call s:hibg("Normal", "#000000", "White", 16)
call s:hifg("Folded", "#5f5fff", "LightCyan", 63)

call s:hifg("TabLineFill", "#5fffaf", "LightGrey", 85)
call s:hibg("TabLineFill", "#5fff5f", "Grey", 83)

call s:hifg("TabLine", "#5fffaf", "LightGrey", 85)
call s:hibg("TabLine", "#5fd7d7", "DarkGrey", 80)

call s:hibg("ColorColumn", "#5fd7ff", "DarkGrey", 81)
call s:hibg("CursorLine", "#5fd7ff", "DarkGrey", 81)
call s:hibg("CursorColumn", "#5fd7ff", "DarkGrey", 81)
call s:hibg("Pmenu", "#000087", "Blue", 18)
call s:hibg("PmenuSel", "#00afff", "DarkCyan",39)
call s:hibg("Search", "Purple", "DarkBlue", 105)
call s:hibg("LineNr", "#5fff5f", "DarkBlue", 81)
call s:hibg("Folded", "#00005f", "DarkBlue", 17)
call s:hibg("Overlength", "#00005f", "Purple", 82)
