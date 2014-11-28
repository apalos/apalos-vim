" Vim color scheme
" Name:					apalos.vim
" Author:				Ilias Apalodimas <apalos@oxygenbroadband.com>
" Version:			0.1

" Based vividchalk
" Functions shamelesly stolen from vivdchalk.vim. All credit goes there!
" Distributable under the same terms as Vim itself (see :help license)
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim

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

function! s:hifg(group, guifg, first, second,...)
	if a:0  && &t_Co == 256
		let ctermfg = a:1
	else
		let ctermfg = s:choose(a:first, a:second)
	endif
	exe "highlight ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

function! s:hibg(group, guibg, first, second)
	if a:0  && &t_Co == 256
		let ctermbg = a:1
	else
		let ctermbg = s:choose(a:first, a:second)
	endif
	exe "highlight ".a:group." guifg=".a:guibg." ctermfg=".ctermbg
	"let ctermbg = s:choose(a:first, a:second)
	"exe "highlight ".a:group." guibg=".a:guibg." ctermbg=".ctermbg
endfunction

hi link railsMethod					PreProc
hi link rubyDefine					Keyword
hi link rubySymbol					Constant
hi link rubyAccess					rubyMethod
hi link rubyAttribute				rubyMethod
hi link rubyEval						rubyMethod
hi link rubyException				rubyMethod
hi link rubyInclude					rubyMethod
hi link rubyStringDelimiter rubyString
hi link rubyRegexp					Regexp
hi link rubyRegexpDelimiter rubyRegexp
hi link javascriptRegexpString	Regexp
hi link javascriptNumber	Number
hi link javascriptNull		Constant
highlight link diffAdded	String
highlight link diffRemoved	Statement
highlight link diffLine		PreProc
highlight link diffSubname	Comment
highlight StatusLine		guifg=Black		guibg=#aabbee gui=bold ctermfg=Black ctermbg=White	cterm=bold
highlight StatusLineNC		guifg=#444444 guibg=#aaaaaa gui=none ctermfg=Black ctermbg=Grey		cterm=none
highlight Ignore			ctermfg=Black
highlight WildMenu			guifg=Black		guibg=#ffff00 gui=bold ctermfg=Black ctermbg=Yellow cterm=bold
highlight Cursor			guifg=Black guibg=White ctermfg=Black ctermbg=White
highlight NonText			guifg=#404040 ctermfg=8
highlight SpecialKey		guifg=#404040 ctermfg=8
highlight Directory			none
highlight ErrorMsg			guibg=Red ctermbg=DarkRed guifg=NONE ctermfg=NONE
highlight Search			guifg=NONE ctermfg=NONE gui=none cterm=none
highlight IncSearch			guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight MoreMsg			guifg=#00AA00 ctermfg=Green
highlight LineNr			guifg=#DDEEFF ctermfg=White
highlight Question			none
high link Question			MoreMsg
highlight Title				guifg=Magenta ctermfg=Magenta
highlight VisualNOS			gui=none cterm=none
highlight WarningMsg		guifg=Red ctermfg=Red
highlight Error				ctermbg=DarkRed
highlight SpellBad			ctermbg=DarkRed
highlight SpellRare			ctermbg=DarkMagenta
highlight SpellCap			ctermbg=DarkBlue
highlight SpellLocal		ctermbg=DarkCyan
highlight FoldColumn		none
high link FoldColumn		Folded
highlight DiffAdd			ctermbg=4 guibg=DarkBlue
highlight DiffChange		ctermbg=5 guibg=DarkMagenta
highlight DiffDelete		ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
highlight DiffText			ctermbg=DarkRed
highlight DiffText			cterm=bold ctermbg=9 gui=bold guibg=Red
highlight Pmenu				guifg=White ctermfg=White gui=bold cterm=bold
highlight PmenuSel			guifg=White ctermfg=White gui=bold cterm=bold
highlight PmenuSbar			guibg=Grey ctermbg=Grey
highlight PmenuThumb		guibg=White ctermbg=White
highlight TabLine		gui=underline cterm=underline
highlight TabLineSel		guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight TabLineFill		gui=underline cterm=underline
highligh Type gui=none
highligh Statement gui=none
highligh Identifier cterm=none
high link Directory			Identifier

" Commented numbers at the end are *old* 256 color values
"highlight PreProc			 guifg=#EDF8F9
call s:hifg("Comment", "#9933CC", "DarkMagenta", 34, 92)
call s:hifg("Constant", "#339999", "DarkCyan", 21, 36)
call s:hifg("rubyNumber", "#CCFF33", "Yellow", 60)
call s:hifg("String", "#66FF00", "SeaGreen2", 44, 83)
call s:hifg("Identifier", "#FFCC00", "Yellow", 72, 206)
call s:hifg("Statement", "#FF6600", "Brown", 170, 32)
call s:hifg("PreProc", "#AAFFFF", "LightCyan", 47, 196)
call s:hifg("railsUserMethod", "#AACCFF", "LightCyan", 27)
call s:hifg("Type",	 "#FF6600", "Grey", 57, 202)
call s:hifg("railsUserClass", "#AAAAAA", "Grey", 7)
call s:hifg("Special", "#33AA00", "DarkGreen", 24)
call s:hifg("Regexp", "#44B4CC", "DarkCyan", 21)
call s:hifg("rubyMethod", "#DDE93D", "Yellow", 77)
call s:hibg("ColorColumn", "#333333", "DarkGrey", 81)
call s:hibg("CursorLine", "#333333", "DarkGrey", 81)
call s:hibg("CursorColumn", "#333333", "DarkGrey", 81)
call s:hifg("TabLineFill", "#bbbbbb","LightGrey",85)
call s:hibg("TabLineFill", "#808080","Grey",83)
call s:hibg("Pmenu", "#000099","Blue", 18)
call s:hibg("PmenuSel", "#5555ff", "DarkCyan",39)
call s:hifg("TabLine" ,"#bbbbbb","LightGrey",85)
call s:hibg("TabLine" ,"#333333","DarkGrey",80)
call s:hibg("Search" , "#555555", "DarkBlue", 81)
call s:hibg("LineNr" , "#222222", "DarkBlue", 80)
call s:hibg("Folded", "#110077", "DarkBlue", 17)
call s:hifg("Folded", "#aaddee", "LightCyan", 63)

" General Settings
" Set Background colour
call s:hifg("Normal","#EEEEEE","White",87)
if &background == "light" || has("gui_running")
		hi Normal guibg=Black ctermbg=Black
else
		hi Normal guibg=Black ctermbg=234
endif
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
