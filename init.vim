"Vars
let g:kzsh#vim_dir = '~/.config/nvim'
" ============================================================================
" Python setup
" Skips if python is not installed in a pyenv virtualenv
" ============================================================================

" Python 2
" ----------------------------------------------------------------------------

let s:pyenv_python2 = glob(expand('$PYENV_ROOT/versions/neovim2/bin/python'))
if !empty(s:pyenv_python2)
  " CheckHealth and docs are inconsistent
  let g:python_host_prog  = s:pyenv_python2
  let g:python2_host_prog = s:pyenv_python2
else
  let g:loaded_python_provider = 1
endif

" Python 3
" ----------------------------------------------------------------------------

let s:pyenv_python3 = glob(expand('$PYENV_ROOT/versions/neovim3/bin/python'))
if !empty(s:pyenv_python3)
  let g:python3_host_prog = s:pyenv_python3
else
  let g:loaded_python3_provider = 1
endif

"==============================================================================
" Startup-only commands
"==============================================================================
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set visualbell t_vb=

  set smartindent
  set autoindent
  set tabstop=2
  set shiftwidth=2

  set expandtab
  set noshowmode

  " Turn off swap files
  set nobackup
  set nowritebackup
  set noswapfile

  set showbreak=↪\
  set scrolloff=8
  set sidescrolloff=5

  set wildmenu
  set wildmode=longest:full,full
  set wildignore+=*.git,*.hg,*.svn,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

  "set showmatch " Show matching

  " set timeout when looking for key combinations
  set timeoutlen=1000 ttimeoutlen=0

  set hidden " only hide buffers, to preserve undo history when returning to other buffers

  " default to the system clipboard
  set clipboard=unnamed " set the clipboard to the X window clipboard

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
set path=.,**,,

" SEARCH
set hlsearch " highlight matches
set incsearch " start searching as text is entered
set number " display line numbers

"DO NOT SET t_Co
"set t_Co=256
" COLORS
set backspace=indent,eol,start " backspace will traverse indent, eol, start
set foldmethod=syntax
set foldlevelstart=1
set nofoldenable        "dont fold by default
set shortmess+=I " don't show splash screen
set lazyredraw " Prevent UI from drawing during macro execution.
set laststatus=2 " display status line always (useful with Powerline plugin)

" >> moves to the nearest whole tab multiple rather than just by amount == tabwidth
" http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround

set background=dark " set background color style
let g:solarized_termcolors=16
colorscheme solarized

"==============================================================================
" Load Plugins
"==============================================================================
call plug#begin('~/.config/nvim/plugged')
Plug 'JarrodCTaylor/vim-shell-executor', { 'on': ['ExecuteBuffer','ExecuteSelection'] }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'csscomb/vim-csscomb', { 'for': ['css', 'scss'] }
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBookmarkDir', 'CtrlPBookmarkDirAdd', 'CtrlPBufTag', 'CtrlPBufTagAll', 'CtrlPBuffer', 'CtrlPChange', 'CtrlPChangeAll', 'CtrlPClearAllCaches', 'CtrlPClearCache', 'CtrlPCurFile', 'CtrlPCurWD', 'CtrlPDir', 'CtrlPLastMode', 'CtrlPLine', 'CtrlPMRUFiles', 'CtrlPMixed', 'CtrlPQuickfix', 'CtrlPRTS', 'CtrlPRoot', 'CtrlPTag', 'CtrlPUndo'] }
Plug 'digitaltoad/vim-jade', { 'for': 'jade'}
Plug 'duggiefresh/vim-easydir'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'scss'] }
Plug 'jlanzarotta/bufexplorer', { 'on': ['BufExplorer', 'BufExplorerHorizontalSplit', 'BufExplorerVerticalSplit'] }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'lrvick/Conque-Shell', { 'on': ['ConqueTerm', 'ConqueTermSplit', 'ConqueTermTab', 'ConqueTermVSplit'] }
Plug 'majutsushi/tagbar', { 'on': ['Tagbar', 'TagbarClose', 'TagbarCurrentTag', 'TagbarDebug', 'TagbarDebugEnd', 'TagbarGetTypeConfig'] }
Plug 'mattn/emmet-vim', { 'for': ['html','html5','jsx', 'javascript'] }
Plug 'mhinz/vim-startify'
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'noprompt/vim-yardoc', { 'for': 'ruby' }
Plug 'osyo-manga/vim-over', { 'on': ['OverCommandLine', 'OverCommandLineMap', 'OverCommandLineNoremap', 'OverCommandLineUnmap'] }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rhysd/committia.vim'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git', { 'for': 'gitconfig' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'

if has('nvim')
  Plug 'neomake/neomake'
else
  Plug 'scrooloose/syntastic'
endif

call plug#end()

"==============================================================================
" configure omnicomplete settings
"==============================================================================
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

"==============================================================================
" Syntax highlighting configuration
"==============================================================================
syntax enable
set synmaxcol=512 " syntax highlight long lines

"http://vim.wikia.com/wiki/Fix_syntax_highlighting
"recalculate syntax highlighting from the start of the file on change
autocmd BufEnter * :syntax sync fromstart

"==============================================================================
" Indentation, spaces
"==============================================================================
" set Tabs per file-type.  (current unused, see above)
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css  setlocal ts=2 sts=2 sw=2
autocmd Filetype tag  setlocal ts=2 sts=2 sw=2
autocmd Filetype xml  setlocal ts=2 sts=2 sw=2
autocmd Filetype jsp  setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype m setlocal ts=4 sts=4 sw=4
autocmd Filetype h setlocal ts=4 sts=4 sw=4
autocmd Filetype swift setlocal ts=4 sts=4 sw=4

autocmd BufReadPost quickfix nnoremap <buffer> <CR> :.cc<CR>
autocmd BufReadPost quickfix nnoremap <buffer> o :.cc<CR>

" vim-commentary settings
autocmd FileType handlebars setlocal commentstring={{!%s}}


let g:jsx_ext_required = 0

"==============================================================================
" NeoMake Configuration
"==============================================================================
if has('nvim')
  autocmd! BufReadPost,BufWritePost,InsertLeave * Neomake

  let g:neomake_logfile = '/tmp/neomake_error.log'

  function! NeomakeESlintChecker()
    let l:npm_bin = ''
    let l:eslint = 'eslint'

    if executable('npm-which')
      let l:eslint = split(system('npm-which eslint'))[0]
      return 0
    endif

    if executable('npm')
      let l:npm_bin = split(system('npm bin'), '\n')[0]
    endif

    if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
      let l:eslint = l:npm_bin . '/eslint'
    endif

    let b:neomake_javascript_eslint_exe = l:eslint

    " Work-around for bug:
    " https://github.com/neomake/neomake/issues/492
    let b:neomake_jsx_eslint_exe = l:eslint
  endfunction

  function! NeomakeSasslintChecker()
    let l:npm_bin = ''
    let l:sasslint = 'sass-lint'

    if executable('npm-which')
      let l:sasslint = split(system('npm-which sass-lint'))[0]
      return 0
    endif

    if executable('npm')
      let l:npm_bin = split(system('npm bin'), '\n')[0]
    endif

    if strlen(l:npm_bin) && executable(l:npm_bin . '/sass-lint')
      let l:sasslint = l:npm_bin . '/sass-lint'
    endif

    let b:neomake_sass_sasslint_exe = l:sasslint
  endfunction

  autocmd FileType scss :call NeomakeSasslintChecker()

  autocmd FileType javascript.jsx :call NeomakeESlintChecker()

  let g:neomake_javascript_checknewline_maker = {
      \ 'errorformat': '%f:%l: %m',
      \ }
  let g:neomake_jsx_checknewline_maker = {
      \ 'errorformat': '%f:%l: %m',
      \ }
  let g:neomake_scss_checknewline_maker = {
      \ 'errorformat': '%f:%l: %m',
      \ }
  let g:neomake_sass_checknewline_maker = {
      \ 'errorformat': '%f:%l: %m',
      \ }
  "let g:neomake_scss_sasslint_maker = ['sass-lint']

  let g:neomake_javascript_enabled_makers = ['eslint', 'checknewline']
  let g:neomake_jsx_enabled_makers = ['eslint', 'checknewline']
  let g:neomake_ruby_enabled_makers = ['rubocop']
  "let g:neomake_scss_enabled_makers = ['sasslint']
  let g:neomake_scss_enabled_makers = ['checknewline']

endif

"==============================================================================
"==============================================================================
filetype plugin indent on

"set the location of the clang lib
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

"Omni Complete
set completeopt=longest,menuone

"==============================================================================
" Syntastic configuration
"==============================================================================
if !has('nvim')
  let g:syntastic_check_on_open=1
  let g:syntastic_enable_signs=1

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loclist=1

  "let g:syntastic_quiet_messages = {'level': 'warnings'}
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_javascript_checkers=['eslint', 'checknewline']
  let g:syntastic_ruby_checkers=['rubocop']
  let g:syntastic_css_checkers=['csslint']

  "Status line override (working with Syntastic)
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

"==============================================================================
" Startify
"==============================================================================
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = ["f", "d", "s", "a", "v", "c", "x", "z"]

"==============================================================================
" CtrlP
"==============================================================================
let g:ctrlp_reuse_window = 'startify'

" don't re-perform the search after every keystroke
let g:ctrlp_lazy_update = 80

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](bin|build|dist|lib|eclipse|tmp|vendor|node_modules|bower_components)$',
      \ }

"map <Leader>fs :CtrlPTag<CR>

map <Leader>bd :CtrlPCurFile<CR>
map <Leader>bb :CtrlPBuffer<CR>

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

if executable('ag')
  let g:ctrlp_user_command =
        \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
endif

if !executable('ag')
  let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
endif

"==============================================================================
" EditorConfig configuration
"==============================================================================
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"
"==============================================================================
" Eclim settings:
"==============================================================================
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimFileTypeValidate = 0

"==============================================================================
" Set special char highlighting parames
"==============================================================================
hi SpecialKey term=bold cterm=bold ctermfg=16 guifg=#000
hi NonText term=bold cterm=bold ctermfg=16 guifg=#000

au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mkd set filetype=markdown

au BufRead,BufNewFile Podfile* set filetype=ruby
au BufRead,BufNewFile *.jbuilder set filetype=ruby

"==============================================================================
" Emmet  (Zen Coding) configuration
"==============================================================================
let g:user_emmet_mode='i'    "only enable normal mode functions.
let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_next_key = '<c-k>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
\  'lang' : 'en',
\  'javascript' : {
\    'extends' : 'javascript',
\    'indentation' : '  ',
\    'snippets' : {
\      'f' : 'ftest',
\    }
\  }
\}
"==============================================================================
" open tagbar and nerdtree
"==============================================================================
map <Leader>o <Esc>:NERDTreeToggle<CR>

"==============================================================================
" Run rspec and rubocop on the current file
"==============================================================================
map <Leader>rs :w<cr>:!CURR_DIR=$(pwd); cd $(git rev-parse --show-toplevel); bundle exec rspec %;cd $CURR_DIR<cr>
map <Leader>rr :w<cr>:!CURR_DIR=$(pwd); cd $(git rev-parse --show-toplevel); bundle exec rubocop %; cd $CURR_DIR<cr>

"==============================================================================
" Return to previous buffer with Tab
"==============================================================================
:nnoremap  <special>   <Tab>  <C-^>

"==============================================================================
" Swap backtic and single quote
"==============================================================================
nnoremap ' `
nnoremap ` '

"==============================================================================
" remap to-top and to-bottom to be to-left and to-right
"==============================================================================
nnoremap H ^
nnoremap L $

"==============================================================================
" Explicitly bind bufexplorer to command, so that plug can lazy load it
"==============================================================================
nnoremap <silent> <Leader>be :BufExplorer<CR>
nnoremap <silent> <C-p> :CtrlP<CR>

"==============================================================================
" Resize panes with arrow keys and shift
"==============================================================================
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

nnoremap <S-Left> :vertical resize -10<CR>
nnoremap <S-Right> :vertical resize +10<CR>
nnoremap <S-Up> :resize -10<CR>
nnoremap <S-Down> :resize +10<CR>

"==============================================================================
" Double escape in term leaves insert mode
"==============================================================================
tnoremap <Leader><Esc> <C-\><C-n>

"==============================================================================
" Use Enter to follow tags
"==============================================================================
nnoremap <Leader><Enter> :exe "tag ". expand("<cword>")<CR>

"==============================================================================
" map alternative escapes to normal mode
"==============================================================================
inoremap jj <ESC>
inoremap jk <ESC>

"==============================================================================
" function to identify repeating lines
" https://stackoverflow.com/questions/1268032/marking-duplicate-lines
"==============================================================================
function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

"==============================================================================
" Configure YouCompleteMe syntax completion engine
"==============================================================================
"YouCompleteMe Configuration
let g:ycm_min_num_of_chars_for_completion = 1

"==============================================================================
" Configure vim-airline
"==============================================================================
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"let g:airline_theme='understated'                   " Use the custom theme I wrote
let g:airline#extensions#branch#enabled = 1         " Do not show the git branch in the status line
let g:airline#extensions#syntastic#enabled = 1      " Do show syntastic warnings in the status line
let g:airline#extensions#tabline#show_buffers = 0   " Do not list buffers in the status line

let g:airline_section_x = ''                        " Do not list the filetype or virtualenv in the status line
let g:airline_section_y = 'R[%03l/%L] C[%03v]'  " Replace file encoding and file format info with file position
let g:airline_section_z = ''                        " Do not show the default file position info

"==============================================================================
" Remove trailing whitespaces
"==============================================================================
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

"when saving, remove all trailing spaces from the file.
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

"==============================================================================
" Function to replace right and left quotes with un-justified quotes
"==============================================================================
function FixQuotes()
  %s/[“”]/"/g
  %s/[‘’]/'/g
endfunction

"==============================================================================
" Shortcuts for manipulating tabs
"==============================================================================
nmap <Leader>t% :tabedit %<CR>
nmap <Leader>td :tabclose<CR>
nmap <Leader>te :tabe<CR>

"==============================================================================
" Rename tmux window when vim changes buffers
"==============================================================================
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " .   expand("%:t"))
autocmd VimLeave * call system("tmux setw automatic-rename")

"==============================================================================
" Map keys to running tests on the current buffer
"==============================================================================
autocmd BufNewFile,BufRead *.js nnoremap <Leader>tt :!mocha %<CR>
autocmd BufNewFile,BufRead *.rb nnoremap <Leader>tt :!rspec %<CR>

"==============================================================================
" Visual find and replace
"==============================================================================
function! VisualFindAndReplace()
  :OverCommandLine%s/
endfunction

function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

"==============================================================================
" vim-cd to top-level of git repo
"==============================================================================
function Cdg()
  let root = system('git rev-parse --show-toplevel')
  cd `=root`
endfunction

command! Cdg :call Cdg()

"==============================================================================
" Use @r as storage
"==============================================================================
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

"==============================================================================
" Remove consecutive empty lines
"==============================================================================
function! RemoveExtraEmptyLines()
  :%g/^$\n\n/d
endfunction

"==============================================================================
" Switch between color scheme that highlights/hides comments
"==============================================================================
function! ToggleCommentColors()
  if g:colors_name == 'monokai_light_comments'
    :colorscheme monokai
  else
    :colorscheme monokai_light_comments
  endif
endfunction

nmap <Leader>ll :call ToggleCommentColors()<CR>

"==============================================================================
" Using AG to find things in a project
"==============================================================================

" Highlight match in results in quickfix
let g:ag_highlight=1

let g:CASE_SENSITIVE=1
let g:CASE_INSENSITIVE=0
let g:AG_IGNORE_EXTENSION_LIST=['css']

" alias :ag to :Ag
cnoreabbrev <expr> ag ((getcmdtype() is# ':' && getcmdline() is# 'ag')?('Ag'):('ag'))

function! GetAgInput()
  return = input('Search: ')
endfunction

function! GenerateIgnoreString(string)
  return '--ignore=*.' . a:string
endfunction

function! Ag(search, target, isSensitive, ignoreTypes)
  if a:target == 'buffer'
    let executable = 'AgBuffer!'
  else
    let executable = 'Ag!'
  endif

  if a:isSensitive
    let l:execution = l:executable . ' -i'
  else
    let l:execution = l:executable
  endif

  let ignoreList = Mapped(function("GenerateIgnoreString"), a:ignoreTypes)
  let ignoreString = join(ignoreList, ' ')

  execute l:execution . ' "' . a:search . '" ' . ignoreString
endfunction

function! SearchAg(target)
  let search = input('Search: ')
  if empty(l:search) | return | endif

  let l:has_caps = matchstr(search, '[A-Z]\+')
  if strlen(l:has_caps) > -1
    call Ag(l:search, a:target, g:CASE_INSENSITIVE, g:AG_IGNORE_EXTENSION_LIST)
  else
    call Ag(l:search, a:target, g:CASE_SENSITIVE, g:AG_IGNORE_EXTENSION_LIST)
  endif
endfunction

function! SearchWordAg(target, isSensitive)
  let search = expand("<cword>")
  call Ag(l:search, a:target, a:isSensitive, g:AG_IGNORE_EXTENSION_LIST)
endfunction

function! Wag()
  let wordUnderCursor = expand("<cword>")
  execute 'Ag' '"' . wordUnderCursor . '" --ignore=*.css'
endfunction

function! Wagi()
  let wordUnderCursor = expand("<cword>")
  execute 'Ag' '-i "' . wordUnderCursor . '" --ignore=*.css'
endfunction

nmap <Leader>ff :call SearchAg('filesystem')<CR>
nmap <Leader>fc :call SearchAg('filesystem')<CR>
nmap <Leader>fw :call SearchWordAg('filesystem', g:CASE_SENSITIVE)<CR>
nmap <Leader>fwi :call SearchWordAg('filesystem', g:CASE_INSENSITIVE)<CR>
nmap <Leader>fb :call SearchAg('buffer')<CR>
nmap <Leader>fbi :call SearchWordAg('buffer', g:CASE_INSENSITIVE)<CR>

"==============================================================================
" Go to next/prev error
"==============================================================================
map <Leader>n :lnext<CR>
map <Leader>p :lprev<CR>

"==============================================================================
" Utility functions
"==============================================================================
function! Mapped(fn, l)
  let new_list = deepcopy(a:l)
  call map(new_list, string(a:fn) . '(v:val)')
  return new_list
endfunction

"==============================================================================
" VimWiki
"==============================================================================
let g:vimwiki_list = [{'path': '~/KB/', 'path_html': '~/KB_html/'}]
