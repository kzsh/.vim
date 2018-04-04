" default to the system clipboard
"Vars
let g:kzsh#vim_dir = '~/.config/nvim'
" ============================================================================
" Python setup
" Skips if python is not installed in a pyenv virtualenv
" ============================================================================

" Python 3
" ----------------------------------------------------------------------------

let s:pyenv_python3 = glob(expand('$PYENV_ROOT/versions/neovim3/bin/python'))
if !empty(s:pyenv_python3)
  let g:python_host_prog  = s:pyenv_python3
  let g:python3_host_prog = s:pyenv_python3
else
  let g:loaded_python3_provider = 1
endif

" Python 2
" ----------------------------------------------------------------------------

let s:pyenv_python2 = glob(expand('$PYENV_ROOT/versions/neovim2/bin/python'))
if !empty(s:pyenv_python2)
  let g:python_host_prog  = s:pyenv_python2
else
  let g:loaded_python_provider = 1
endif

"==============================================================================
" Startup-only commands
"==============================================================================
if has('vim_starting')
  if &term =~ '256color' || &term =~ 'kitty'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    set &t_ut=
endif
  if &compatible
    set nocompatible
  endif

  filetype off
  filetype plugin indent on

  set noerrorbells
  set number " display line numbers
  set backspace=indent,eol,start " backspace will traverse indent, eol, start
  set showcmd

  set smartindent
  set autoindent

  set tabstop=2
  set shiftwidth=2
  set expandtab
  set noshowmode

  " Turn off swap files
  set noswapfile
  set nobackup
  set nowritebackup

  set autowrite
  set autoread

  set hidden " only hide buffers, to preserve undo history when returning to other buffers

  set showbreak=↪\
  set scrolloff=8
  set sidescrolloff=5

  set wildmenu
  set wildmode=longest:full,full
  set wildignore+=*.git,*.hg,*.svn,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

  "set showmatch " Show matching

  " set timeout when looking for key combinations
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  set title

  set complete=.,w,b,u,t,i
  set completeopt=longest,menuone,preview

  " default to the system clipboard
  set clipboard=unnamed
  set clipboard+=unnamedplus

  let g:mapleader = "\<Space>"

  " undo files
  " double slash means create dir structure to mirror file's path
  set undofile
  set undolevels=1000
  set undoreload=10000
  execute 'set undodir=' . g:kzsh#vim_dir . '/.tmp/undo//'

  if has('nvim')
    " Get around Ctrl-h sending backspace
    " No longer necessary after fixing terminfo: infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti && tic && tic $TERM.ti
    "nmap <BS> <C-W>h

    set mouse=""
  endif
endif

set list " draw whitespace

" what to replace various white space
" chars with
set listchars=tab:>-,trail:~,extends:>,precedes:<

" set our vim path to look in the current directory of the file we are
" editing, all sub directories, the directory from which vim was launched.
set path=.,**,,FindGitRoot(),

" SEARCH
set hlsearch " highlight matches
set incsearch " start searching as text is entered

"DO NOT SET t_Co
"set t_Co=256
" COLORS
set foldmethod=syntax
set foldlevelstart=1
set nofoldenable        "dont fold by default
set shortmess+=I " don't show splash screen
set lazyredraw " Prevent UI from drawing during macro execution.
set laststatus=2 " display status line always (useful with Powerline plugin)

set formatoptions=qrn1

set re=1

" >> moves to the nearest whole tab multiple rather than just by amount == tabwidth
" http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround
