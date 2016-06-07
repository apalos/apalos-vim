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
hi clear
if exists("syntax_on")
	syntax reset
endif
let colors_name = "apalos"
" mac crap
if !has("gui_mac")
	" Mac GUI degrades italics to ugly underlining.
	hi Comment gui=italic
	hi railsUserClass  gui=italic
	hi railsUserMethod gui=italic
endif

"a:0 number of extra args(after 'second', a:0 is if more than 4 args are
"passed)
"a:1 is the first arg etc
function! s:hifg(group, guifg, first)
	let ctermfg = a:first
	exe "highlight ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

function! s:hibg(group, guibg, first)
	let ctermbg = a:first
	exe "highlight ".a:group." guibg=".a:guibg." ctermbg=".ctermbg
endfunction

call s:hifg("Special", "#005f87", 124)
call s:hifg("VertSplit", "#af87d7", 196)

" Diff
call s:hibg("DiffAdd", "DarkGreen", "DarkGreen")
call s:hifg("DiffAdd", "White", "White")

call s:hibg("DiffDelete", "DarkRed", "DarkRed")
call s:hifg("DiffDelete", "White", "White")

call s:hibg("DiffText", "DarkGreen", "DarkGreen")
call s:hifg("DiffText", "White", "White")

call s:hibg("DiffChange", "DarkGrey", "DarkGrey")
call s:hifg("DiffChange", "White", "White")

call s:hifg("Comment", "#ffd787", 165)
call s:hifg("Constant", "#00af5f", 93)
call s:hifg("Identifier", "#cd1414", 196)
call s:hifg("PreProc", "#A0522D", 94)
call s:hifg("Type", "#ff5f00", 202)
call s:hifg("Regexp", "#0000ff", "DarkCyan")
call s:hifg("Folded", "#5f5fff", "LightCyan")
call s:hifg("String", "#5f5fff", 22)

call s:hifg("TabLineFill", "#5fffaf", "LightGrey")
call s:hibg("TabLineFill", "#5fff5f", "Grey")
call s:hifg("TabLine", "#5fffaf", "LightGrey")
call s:hibg("TabLine", "#5fd7d7", "DarkGrey")

call s:hibg("Pmenu", "#000087", "Blue")
call s:hibg("PmenuSel", "#00afff", "DarkCyan")
call s:hibg("ColorColumn", "#5fd7ff", "DarkGrey")
call s:hibg("Search", "#0067cc", 32)

if &background == 'dark'
" Highlighting
" Diff
	" General
	call s:hifg("Statement", "#5fd7ff", 39)
	call s:hifg("PreProc", "#ff0000", 94)
	call s:hibg("LineNr", "#5fff5f", "DarkBlue")
	call s:hibg("Folded", "#00005f", "DarkBlue")
	call s:hibg("Overlength", "#00005f", 251)
	call s:hibg("StatusLine", '#00005f', 251)
	"Cursor
	call s:hibg("CursorLine", "#5fd7ff", "DarkGrey")
	call s:hibg("CursorColumn", "#5fd7ff", "DarkGrey")
	call s:hifg("Cursor", "#00af5f", "Black")
	"Backgroung colour
	call s:hibg("Normal", "#000000", "Black")
	call s:hifg("Normal", "#ffffff", "White")

else
	" General
	call s:hifg("Statement", "#2950c5", 27)
	call s:hibg("LineNr", "#5fff5f", "DarkBlue")
	call s:hibg("Folded", "#00005f", "DarkBlue")
	call s:hibg("Overlength", "#00005f", 141)
	call s:hibg("StatusLine", '#00005f', 141)
	"Cursor
	call s:hibg("CursorLine", "#5fd7ff", "DarkGrey")
	call s:hibg("CursorColumn", "#5fd7ff", "DarkGrey")
	call s:hifg("Cursor", "#00af5f", "Black")
	"Backgroung colour
	call s:hibg("Normal", "#ffffff", "White")
	call s:hifg("Normal", "#000000", "Black")
endif
