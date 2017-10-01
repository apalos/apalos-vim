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
call s:hifg("DiffAdd", "Black", "Black")

call s:hibg("DiffDelete", "DarkRed", "DarkRed")
call s:hifg("DiffDelete", "Black", "Black")

call s:hibg("DiffText", "DarkGreen", "DarkGreen")
call s:hifg("DiffText", "DarkGrey", "DarkGrey")

call s:hibg("DiffChange", "DarkGrey", "DarkGrey")
call s:hifg("DiffChange", "White", "White")

" Common
call s:hifg("Comment", "#ffd787", 165)
call s:hifg("Constant", "#00af5f", 124)
call s:hifg("Identifier", "#cd1414", 196)
call s:hifg("PreProc", "#A0522D", 94)
call s:hifg("Type", "#ff5f00", 202)
call s:hifg("Regexp", "#0000ff", "DarkCyan")
call s:hifg("Folded", "#5f5fff", "LightCyan")
" Tabs
call s:hifg("TabLineFill", "#5fffaf", "LightGrey")
call s:hibg("TabLineFill", "#5fff5f", "Grey")
call s:hifg("TabLine", "#5fffaf", "LightGrey")
call s:hibg("TabLine", "#5fd7d7", "DarkGrey")
" Menu
call s:hibg("Pmenu", "#000087", "Blue")
call s:hibg("PmenuSel", "#00afff", "DarkCyan")
" Cursor
call s:hibg("ColorColumn", "#5fd7ff", "DarkGrey")
call s:hibg("CursorColumn", "#5fd7ff", "DarkGrey")
call s:hibg("CursorLine", "#5fd7ff", "DarkGrey")
" Search
call s:hibg("Search", "#0067cc", 85)

if &background == 'dark'
" Highlighting
" Diff
	" General
	call s:hifg("Statement", "#5fd7ff", 33)
	call s:hifg("PreProc", "#ff0000", 94)
	call s:hibg("LineNr", "#5fff5f", "DarkBlue")
	call s:hibg("Folded", "#00005f", "DarkBlue")
	call s:hibg("Overlength", "#00005f", 88)
	call s:hibg("StatusLine", '#00005f', 232)
	call s:hifg("String", "#5f5fff", 34)
	" Cursor
	call s:hifg("Cursor", "#00af5f", "Black")
	"Backgroung colour
	call s:hibg("Normal", "#000000", 234)
	call s:hifg("Normal", "#ffffff", 252)
else
	" General
	call s:hifg("Statement", "#2950c5", 27)
	call s:hibg("LineNr", "#5fff5f", "DarkBlue")
	call s:hibg("Folded", "#00005f", "DarkBlue")
	call s:hibg("Overlength", "#00005f", 141)
	call s:hibg("StatusLine", '#00005f', 141)
	call s:hifg("String", "#5f5fff", 22)
	" Cursor
	call s:hifg("Cursor", "#00af5f", "Black")
	" Backgroung colour
	call s:hibg("Normal", "#ffffff", 251)
	call s:hifg("Normal", "#000000", "Black")
endif

hi Comment gui=bold cterm=bold
hi Type gui=bold cterm=bold
hi Constant gui=bold cterm=bold
hi String gui=bold cterm=bold
hi Statement gui=bold cterm=bold
