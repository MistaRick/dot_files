" No more compatibility with vi
set nocompatible

"" vim's autodetection of filetype interferes with vundle, the package manager
"" we wish to use.
filetype off

" Set up directories
set backupdir=$HOME/.config/nvim/backup/ 
set directory=$HOME/.config/nvim/swap/   
set viewdir=$HOME/.congif/nvim/views/    

" Show line numbers.
set nu " number
set hlsearch
set number
set numberwidth=1
set ruler

" add a modeline
set modeline
set ls=2
set ic

" General stuff
set backspace=indent,eol,start
set hidden
set ffs=unix,dos
set smartcase

" ctags configuration
" load tags from current directory or recursively beneath
set tags=./tags;,tags;
