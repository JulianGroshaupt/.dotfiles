" set compatibility to vim only
set nocompatible

" helps force plug-ins to load correctly when it is turned back on below
filetype off

" turn on syntax highlighting
syntax on

" for plug-ins to load correctly
filetype plugin indent on

" status bar
set laststatus=2

" display options
set showmode
set showcmd

" set status line display
set statusline=%F%m%r%h%w\ \|\ FORMAT=%{&ff}\ \|\ TYPE=%Y\ \|\ POS=%l,%v\ (%p%%)

" show line numbers
set number

" highlight matching brace
set showmatch

" hightlight all search results
set hlsearch

" number of auto-indent spaces
set shiftwidth=4

" enable smart-indent
set smartindent

" enable smart-tab
set smarttab

" number of spaces per tab
set softtabstop=4

" show row and column ruler information
set ruler

" number of undo levels
set undolevels=1000

" backspace behavior
set backspace=indent,eol,start

" disable mouse
set mouse-=a
