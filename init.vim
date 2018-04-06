"Vars
let g:kzsh#vim_dir = '~/.config/nvim'
" ===========================================================================
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
set laststatus=1

set formatoptions=qrn1

set re=1

" >> moves to the nearest whole tab multiple rather than just by amount == tabwidth
" http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround

"==============================================================================
" Load Plugins
"==============================================================================
call plug#begin('~/.config/nvim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'JarrodCTaylor/vim-shell-executor', { 'on': ['ExecuteBuffer','ExecuteSelection'] }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-gitgutter'
Plug 'carlitux/deoplete-ternjs'
Plug 'codeindulgence/vim-tig'
Plug 'csscomb/vim-csscomb', { 'for': ['css', 'scss'] }
Plug 'digitaltoad/vim-jade', { 'for': 'jade'}
Plug 'dkarter/bullets.vim', { 'for': 'markdown' }
Plug 'duggiefresh/vim-easydir'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'scss'] }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'junegunn/goyo.vim'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'kzsh/vim-chunkwm-navigator'
Plug 'majutsushi/tagbar', { 'on': ['Tagbar', 'TagbarClose', 'TagbarCurrentTag', 'TagbarDebug', 'TagbarDebugEnd', 'TagbarGetTypeConfig'] }
Plug 'mattn/vim-xxdcursor'
Plug 'mhinz/vim-startify'
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.mustache' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'noprompt/vim-yardoc', { 'for': 'ruby' }
Plug 'osyo-manga/vim-over', { 'on': ['OverCommandLine', 'OverCommandLineMap', 'OverCommandLineNoremap', 'OverCommandLineUnmap'] }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git', { 'for': 'gitconfig' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'zchee/deoplete-jedi'

if executable("w3m")
  Plug 'yuratomo/w3m.vim'
endif

if has('nvim')
  Plug 'neomake/neomake'
else
  Plug 'scrooloose/syntastic'
endif

call plug#end()

"==============================================================================
" Auto-save
"==============================================================================
" autocmd InsertLeave * :w<CR>

"==============================================================================
" configure omnicomplete settings
"==============================================================================
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=tern#Complete
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
autocmd Filetype wflow setlocal ts=4 sts=4 sw=4
autocmd Filetype plist setlocal ts=4 sts=4 sw=4
autocmd Filetype swift setlocal ts=4 sts=4 sw=4

augroup WrapLineInFile
    autocmd!
    autocmd FileType markdown setlocal linebreak
    autocmd FileType markdown setlocal textwidth=80
augroup END

autocmd BufReadPost quickfix nnoremap <buffer> <CR> :.cc<CR>
autocmd BufReadPost quickfix nnoremap <buffer> o :.cc<CR>

" vim-commentary settings
autocmd FileType handlebars setlocal commentstring={{!%s}}

let g:jsx_ext_required = 0

"==============================================================================
" Set terminal title (for use with chunkwm -- detecting a vim session
"==============================================================================
autocmd BufEnter * let &titlestring = "vim_hook(" . expand("%:t") . ")"

"==============================================================================
" NeoMake Configuration
"==============================================================================
if has('nvim')
  autocmd! BufReadPost,BufWritePost * Neomake

  let g:neomake_logfile = '/tmp/neomake_error.log'

  " if ! empty(g:python3_host_prog)
  "   let g:neomake_vim_vint_exe = g:python3_host_prog
  " elseif ! empty(g:python2_host_prog)
  "   let g:neomake_vim_vint_exe = g:python2_host_prog
  " endif

let g:neomake_error_sign={'text': '!', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_warning_sign={'text': '?', 'texthl': 'NeomakeWarningMsg'}
let g:neomake_info_sign={'text': 'i'}

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

  let g:neomake_checknewline_error_format = {
      \ 'errorformat': '%f:%l: %m',
      \ }

  let g:neomake_javascript_checknewline_maker = g:neomake_checknewline_error_format
  let g:neomake_jsx_checknewline_maker = g:neomake_checknewline_error_format
  let g:neomake_scss_checknewline_maker = g:neomake_checknewline_error_format
  let g:neomake_sass_checknewline_maker = g:neomake_checknewline_error_format
  "let g:neomake_scss_sasslint_maker = ['sass-lint']

  let g:neomake_javascript_enabled_makers = ['eslint', 'checknewline']
  let g:neomake_jsx_enabled_makers = ['eslint', 'checknewline']
  let g:neomake_ruby_enabled_makers = ['rubocop']
  "let g:neomake_scss_enabled_makers = ['sasslint']
  let g:neomake_scss_enabled_makers = ['checknewline']

endif

"==============================================================================
" Xcode compiler config
"==============================================================================

let s:uname = system("echo -n \"$(uname)\"")

"set the location of the clang lib
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  let g:clang_library_path = '/usr/lib'
else
  let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
endif

"Omni Complete

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
endif

"==============================================================================
" Startify
"==============================================================================
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = ["a", "s", "d", "f", "g", "z", "x", "c", "v", "b", "q", "w", "e", "r", "t"]

let g:startify_custom_header = []

"==============================================================================
" FZF
"==============================================================================
nnoremap <Leader>oo :Buffers<CR>
nnoremap <Leader>of :FZF ./<CR>
nnoremap <Leader>oaf :execute 'Files' FindGitRoot()<CR>
nnoremap <Leader>occ :BCommits<CR>
nnoremap <Leader>oca :Commits<CR>
nnoremap <Leader>ol :Lines<CR>

let g:fzf_commits_log_options = "--color=always --pretty=format:'%C(green)%h%C(reset)%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(bold blue)<%an>%C(reset)' --abbrev-commit"
let g:fzf_history_dir = g:kzsh#vim_dir . '/.tmp/fzf-history//'

" let g:fzf_action = {
"   \ 'ctrl-alt-j': 'down',
"   \ 'ctrl-alt-k': 'up' }

"==============================================================================
" EditorConfig configuration
"==============================================================================
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

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
" Custom Completion using macros.  Similar to Emmet.
"==============================================================================
let g:macro_completions = {
  \ 'f' : "ifunction() {\<cr>\<cr>}\<ESC>k^i\<space>\<space>"
\}

sign define DetectedMacroCompletion text=M
let g:detected_macro_completion_id = 999999
execute "sign unplace" g:detected_macro_completion_id

function! DetectMacroCompletion()
    let l:macro_name = expand("<cword>")
    let l:macro = get(g:macro_completions, l:macro_name, "")


    execute "sign unplace" g:detected_macro_completion_id

    if !empty(l:macro)
      let bufnr = bufnr('%')
      let line_number = line(".")
      let name = "DetectedMacroCompletion"
      execute "sign place" g:detected_macro_completion_id "line=" . line_number "name=" . name "buffer=" . bufnr
    else
      execute "sign unplace" g:detected_macro_completion_id
    endif
endfunction

" augroup cursor_highlight
"   au!
"   autocmd CursorMoved * call DetectMacroCompletion()
" augroup END

" command! -register DetectMacroCompletion call DetectMacroCompletion()

function! CompleteFromMacro()
    let l:macro_name = expand("<cword>")
    let l:macro = get(g:macro_completions, l:macro_name, "")
    if !empty(l:macro)
      silent! normal ciw
      execute("normal! " . l:macro) | startinsert!
    else
      echo "No macro found for key: " . l:macro_name
    endif
endfunction

command! -register CompleteFromMacro call CompleteFromMacro()

inoremap <C-e> <Esc>:CompleteFromMacro<CR>
nnoremap <Leader>cc :CompleteFromMacro<CR>

"==============================================================================
" open tagbar and nerdtree
"==============================================================================
map <Leader>ot <Esc>:NERDTreeToggle<CR>

map <Leader>os <Esc>:Tagbar<CR>

"==============================================================================
" Execute highlighted code
"==============================================================================
noremap <Leader>rr :'<,'>!cat \| awk '{ print "puts "$0 }' \| ruby<CR>
noremap <Leader>rn :'<,'>!cat \| awk '{ print "process.stdout.write(String("$0"))" }' \| node<CR>

"==============================================================================
" Return to previous buffer with Tab
"==============================================================================
nnoremap  <special>   <Tab>  <C-^>

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
" Alternate escape sequences terminal emulator (terminal-emulator-input)
"==============================================================================
tnoremap <Leader><Esc> <C-\><C-n>

"==============================================================================
" Use Enter to follow tags
"==============================================================================
nnoremap <Leader><Enter> :exe "tag ". expand("<cword>")<CR>

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
let g:ycm_min_num_of_chars_for_completion = 3

"==============================================================================
" Configure Deoplete syntax completion engine
"==============================================================================
let g:deoplete#enable_at_startup = 1

"call deoplete#enable_logging('DEBUG', 'deoplete.log')

let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx'
                \ ]

function! DeopleteTernBin()
  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/tern')
    let l:tern = l:npm_bin . '/tern'
    let g:deoplete#sources#ternjs#tern_bin = l:tern
  endif

endfunction

autocmd FileType javascript.jsx :call DeopleteTernBin()

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
function! FixQuotes()
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
function! Cdg()
  let root = FindGitRoot()
  cd `=root`
endfunction

command! Cdg :call Cdg()

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

" nmap <Leader>ll :call ToggleCommentColors()<CR>

"==============================================================================
" copy search matches to register e.g. :CopyMatches a
"==============================================================================
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

"==============================================================================
" Using AG to find things in a project
"==============================================================================

" Highlight match in results in quickfix
let g:ag_highlight=1

let g:CASE_SENSITIVE=1
let g:CASE_INSENSITIVE=0
let g:AG_IGNORE_EXTENSION_LIST=['css']

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
nmap <Leader>fiw :call SearchWordAg('filesystem', g:CASE_INSENSITIVE)<CR>
nmap <Leader>fb :call SearchAg('buffer')<CR>
nmap <Leader>fib :call SearchWordAg('buffer', g:CASE_INSENSITIVE)<CR>

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
let g:vimwiki_list = [{'path': '~/kb/', 'path_html': '~/kb_html/'}]
"==============================================================================
" Vim Tig
"==============================================================================
map <Leader>vt :tabedit<CR>:term tig<CR>
map <Leader>vT :Tig!<CR>

"==============================================================================
" Vim Fugitive
"==============================================================================
map <Leader><Leader>b :Gblame<CR>
map <Leader><Leader>l :Glog<CR><CR>
map <Leader><Leader>e :Gedit<CR>

"==============================================================================
" Session shortcuts
"==============================================================================
augroup auto_save_session
  au!
  autocmd BufReadPost,FileReadPost,BufNewFile * execute("mksession! " . $VIM_DIR . "/.vimsession.vim")
augroup END

"==============================================================================
" Diff shortcuts
"==============================================================================

" Toggle Vim diff on/off
function! ToggleVimDiff()
  if &diff
    diffoff
  else
    diffthis
  endif
endfunction

noremap <Leader>gg :diffget<CR>
noremap <Leader>gp :diffput<CR>
nmap <Leader>od :exe ToggleVimDiff()<CR>

"==============================================================================
" Git
"==============================================================================

function! FindGitRoot()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

"==============================================================================
" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
"==============================================================================
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

let g:current_inversion_path = "~/.config/chunkwm/inversion_enabled"
let g:current_inversion_state = readfile(glob(fnameescape(g:current_inversion_path)), '', 1)[0]

colorscheme yin

if g:current_inversion_state == 0
  set background=dark " set background color style
elseif g:current_inversion_state == 1
  set background=light " set background color style
end

"override statusline

hi StatusLine ctermbg=236 ctermfg=254
hi StatusLineNC ctermbg=236 ctermfg=254
hi VertSplit ctermbg=236 ctermfg=254
hi NeomakeErrorMsg ctermfg=161 ctermbg=236
hi NeomakeWarningMsg ctermfg=230 ctermbg=236
