set nocompatible
filetype indent plugin on | syn on
set hidden

" let's copy paste some lines from documentation
fun SetupVAM()
let addons_base = expand('$HOME') . '/vim-addons'
exec 'set runtimepath+='.addons_base.'/vim-addon-manager'

if !isdirectory(addons_base)
	exec '!p='.shellescape(addons_base).'; mkdir -p "$p" && cd "$p" && 	git clone git://github.com/MarcWeber/vim-addon-manager.git'
endif

	" call vam#ActivateAddons([])
	"call vam#ActivateAddons(['vim-addon-local-vimrc','snipmate-snippets','vim-addon-actions','reload','web-indent','vim-addon-sql','FuzzyFinder','syntastic2'],{'auto_install' : 0})
endf
call SetupVAM()
noremap \ft :exec 'e ~/.vim/after/ftplugin/'.&filetype.'.vim'<cr>
syntax on
set background=dark
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set bs=2 
set number
set wrap!
set smartindent
set tabstop=4 "“set tab character to 4 characters
set expandtab "“turn tabs into whitespace
set shiftwidth=4 "“indent width for autoindent
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

set incsearch
set ignorecase
set smartcase

set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=longest:full
set wildmenu                  " menu has tab completion
let maplocalleader=','        " all my macros start with ,
set laststatus=2

"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

"  backup
set backup
set backupdir=~/.vim_backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
"set viminfo='100,f1

" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif

" mappings
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>

