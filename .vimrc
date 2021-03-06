" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set t_Co=256
set background=light
set autoindent		" always set autoindenting on
set nocompatible
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=Monaco:h11
set guifontwide=NSimsun:h12
set previewheight=3
set history=50		"keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hidden
set nowrap
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set statusline+=\%f\ line:\%l,
set statusline+=\ col:\ %c,
set laststatus=2
" Defaults
set tabstop=4
set shiftwidth=4
set ts=4
set noexpandtab
set textwidth=100

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set nobackup		" keep a backup file
endif
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		autocmd FileType text setlocal textwidth=100

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
			\ endif

	augroup END
	autocmd Filetype c,cpp
		\ set shiftwidth=8 |
		\ set tabstop=8 |
		\ set softtabstop=8 |
		\ set noexpandtab |
		\ set textwidth=100

	autocmd Filetype python,yaml,yml
		\ set shiftwidth=4 |
		\ set tabstop=4 |
		\ set softtabstop=4 |
		\ set expandtab |
		\ set textwidth=100

	autocmd Filetype perl
		\ set shiftwidth=4 |
		\ set tabstop=4 |
		\ set softtabstop=4 |
		\ set noexpandtab |
		\ set textwidth=100

	autocmd Filetype bash
		\ set shiftwidth=4 |
		\ set tabstop=4 |
		\ set softtabstop=4 |
		\ set noexpandtab |
		\ set textwidth=100
else
endif " has("autocmd")

colorscheme apalos

autocmd CursorMoved * if pumvisible() == 0|pclose|endif
autocmd FileType c,cpp,java,php,perl,pl,python,py
	\ autocmd BufWritePre <buffer> :%s/\s\+$//e
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue
match OverLength /\%80v.\+/

" Specify a directory for plugins
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/jceb/vim-orgmode/'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-speeddating'
call plug#end()

let g:asyncomplete_auto_popup = 1
let g:lsp_signs_enabled = 0
let g:lsp_highlights_enabled = 0
let g:lsp_highlight_references_enabled = 0
set omnifunc=syntaxcomplete#Complete

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
