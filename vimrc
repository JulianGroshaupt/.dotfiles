"""
""" VundeVim (Plugin Manager) 
"""

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add plugins here
Plugin 'preservim/nerdtree'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""
""" Status Bar
"""

set laststatus=2

" left
set statusline=\ 
set statusline+=%{StatuslineMode()}
set statusline+=\ \|\ 
set statusline+=%r
set statusline+=%{b:gitbranch}
set statusline+=%f
set statusline+=%m

" right
set statusline+=%=
set statusline+=%y\ 
set statusline+=%{&ff}\ 
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=\ \|\ 
set statusline+=%l,%c
set statusline+=\ /\ 
set statusline+=%L
set statusline+=\ /\ 
set statusline+=%p%%\ 

" display options
set noshowmode


"""
""" Displaying
"""

" turn on syntax highlighting
syntax on

" show line numbers
set number

" highlight matching brace
set showmatch

" hightlight all search results
set hlsearch


"""
""" Tabs and Spaces
"""

" use spaces instead of tabs
set expandtab

" be smart when using tabs ;)
set smarttab

set ai    " auto indent
set si    " smart indent
set wrap  " wrap lines

" number of auto-indent spaces
set shiftwidth=4

" enable smart-indent
set smartindent

" number of spaces per tab
set softtabstop=4


"""
""" Sounds (all disabled)
"""

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


"""
""" Misc Settings
"""

" number of undo levels
set undolevels=1000

" backspace behavior
set backspace=indent,eol,start

" disable mouse
set mouse-=a

" set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" a buffer becomes hidden when it is abandoned
set hid

" don't redraw while executing macros (good performance config)
set lazyredraw

" for regular expressions turn magic on
set magic

" set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" use Unix as the standard file type
set ffs=unix,dos,mac

" turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""
""" Tabs
"""

" Better tab experience - from https://webdevetc.com/
map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>


"""
""" NERDTree Setup
"""

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"
nnoremap <leader>n :NERDTree<CR>


"""
""" Custom Commands
"""

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""
""" Helper Functions
"""

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
