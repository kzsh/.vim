"==============================================================================
" Startup-only commands
"==============================================================================
if has('vim_starting')
  let g:kzsh#vim_dir = '~/.config/nvim'

  " ----------------------------------------------------------------------------
  " Python Venv
  " ----------------------------------------------------------------------------
  " Python 3
  let s:pyenv_python3 = glob(expand('$PYENV_ROOT/versions/neovim3/bin/python'))
  if !empty(s:pyenv_python3)
    let g:python_host_prog  = s:pyenv_python3
    let g:python3_host_prog = s:pyenv_python3
  else
    let g:loaded_python3_provider = 1
  endif

  " Python 2
  let s:pyenv_python2 = glob(expand('$PYENV_ROOT/versions/neovim2/bin/python'))
  if !empty(s:pyenv_python2)
    let g:python_host_prog  = s:pyenv_python2
  else
    let g:loaded_python_provider = 1
  endif

  " ----------------------------------------------------------------------------
  " Core Configuration
  " ----------------------------------------------------------------------------
  let g:mapleader = "\<Space>"

  " Runtime Behavior
  " ----------------------------------------------------------------------------
  if &compatible
    set nocompatible
  endif
  set path=.,**,,FindGitRoot(),

  set lazyredraw " Prevent UI from drawing during macro execution.
  set laststatus=1
  set showcmd
  set noshowmode
  set noerrorbells
  set shortmess+=rsI
  set re=1 " set regex engine
  set autoread
  set hidden " only hide buffers, to preserve undo history when returning to other buffers
  set scrolloff=8
  set sidescrolloff=5
  set list " draw whitespace
  set listchars=tab:>-,trail:~,extends:>,precedes:<
  set hlsearch " highlight matches
  set incsearch " start searching as text is entered

  " set timeout when looking for key combinations
  set notimeout
  set ttimeout
  set ttimeoutlen=10

  " Turn off swap files
  set noswapfile
  set nobackup
  set nowritebackup

  " Use system clipboard
  set clipboard=unnamed
  set clipboard+=unnamedplus

  if has('nvim')
    set mouse=""
  endif

  for rpc_plugin in globpath($VIM_DIR . "/rpc-plugins", '*', 0, 1)
    if (isdirectory(rpc_plugin))
      for plugin in globpath(rpc_plugin, "*", 0, 1)
        let &runtimepath.=",".plugin
      endfor
    endif
  endfor

  " Syntax
  " ----------------------------------------------------------------------------
  filetype plugin indent on

  " Display
  " ----------------------------------------------------------------------------
  set number " display line numbers
  set showbreak=↪\
  syntax enable
  set synmaxcol=512 " syntax highlight long lines
  autocmd BufEnter * :syntax sync fromstart
  set splitright

  " Navigation
  " ----------------------------------------------------------------------------
  set backspace=indent,eol,start " backspace will traverse indent, eol, start

  " Formatting
  " ----------------------------------------------------------------------------
  set smartindent
  set autoindent
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set foldmethod=syntax
  set foldlevelstart=1
  set nofoldenable
  set formatoptions=qrn1j
  set shiftround

  " Autocomplete
  " ----------------------------------------------------------------------------
  set wildmenu
  set wildmode=longest:full,full
  set wildignore+=*.git,*.hg,*.svn,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  set complete=.,w,b,u,t,i
  set completeopt=longest,menuone,preview

  " undo files
  " double slash means create dir structure to mirror file's path
  set undofile
  set undolevels=1000
  set undoreload=10000
  execute 'set undodir=' . g:kzsh#vim_dir . '/.tmp/undo//'
endif

"==============================================================================
" Load Plugins
"==============================================================================
call plug#begin('~/.config/nvim/lib')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'landaire/deoplete-swift', { 'for': 'swift' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-gitgutter'
Plug 'carlitux/deoplete-ternjs'
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
Plug 'majutsushi/tagbar', { 'on': ['Tagbar',  'TagbarClose',  'TagbarCurrentTag',  'TagbarDebug',  'TagbarDebugEnd',  'TagbarGetTypeConfig',  'TagbarOpenAutoClose',  'Tags'] }
Plug 'mattn/vim-xxdcursor'
Plug 'mitsuse/autocomplete-swift', { 'for': 'swift' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.mustache' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'noprompt/vim-yardoc', { 'for': 'ruby' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
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
Plug 'neomake/neomake'
call plug#end()

"==============================================================================
" configure omnicomplete settings
"==============================================================================
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd BufNewFile,BufRead *.swift set filetype=swift

"==============================================================================
" Auto-save on mode change
"
" This works best with undos stored between sessions
"==============================================================================

function! AutoSaveIfFile()
  if len(@%)
    execute(":w")
  endif
endfunction

augroup Autosave
  autocmd InsertLeave * silent! call AutoSaveIfFile()
augroup END

"==============================================================================
" Set terminal title (for use with chunkwm -- detecting a vim session
"==============================================================================
set title
autocmd BufEnter * let &titlestring = "vim_hook(" . expand("%:t") . ")"

"==============================================================================
" FileType-specific formatting
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
autocmd Filetype swift setlocal ts=2 sts=2 sw=2

augroup WrapLineInFile
    autocmd!
    autocmd FileType markdown setlocal linebreak
    autocmd FileType markdown setlocal formatoptions+=t
    autocmd FileType markdown setlocal textwidth=80
augroup END

autocmd BufReadPost quickfix nnoremap <buffer> <CR> :.cc<CR>
autocmd BufReadPost quickfix nnoremap <buffer> o :.cc<CR>

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.mkd set filetype=markdown
autocmd BufRead,BufNewFile Podfile* set filetype=ruby
autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby

"==============================================================================
" Set special char highlighting parames
"==============================================================================
hi SpecialKey term=bold cterm=bold ctermfg=16 guifg=#000
hi NonText term=bold cterm=bold ctermfg=16 guifg=#000

"==============================================================================
" Return to previous buffer with Tab
"==============================================================================
nnoremap <special> <Tab> <C-^>

"==============================================================================
" Swap backtic and single quote
"==============================================================================
nnoremap ' `
nnoremap ` '

"==============================================================================
" vim-commentary settings
"==============================================================================
autocmd FileType handlebars setlocal commentstring={{!%s}}

"==============================================================================
" NeoMake Configuration
"==============================================================================
if has('nvim')
  autocmd! BufReadPost,BufWritePost * Neomake

  let g:neomake_logfile = '/tmp/neomake_error.log'

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
" NerdTree
"==============================================================================
map <Leader>ov <Esc>:NERDTreeToggle<CR>

"==============================================================================
" TagBar and nerdtree
"==============================================================================
let g:tagbar_left = 1

map <Leader>ot <Esc>:TagbarOpenAutoClose<CR>

"==============================================================================
" Execute visual-selection
"==============================================================================
noremap <Leader>rr :'<,'>!cat \| awk '{ print "puts "$0 }' \| ruby<CR>
noremap <Leader>rn :'<,'>!cat \| awk '{ print "process.stdout.write(String("$0"))" }' \| node<CR>

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
" Configure Deoplete syntax completion engine
"==============================================================================
let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required = 0

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
" Copy search matches to register e.g. :CopyMatches a
"==============================================================================
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

"==============================================================================
" Functions to put ag results in a quickfix list
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
nmap <Leader>fw :call SearchWordAg('filesystem', g:CASE_SENSITIVE)<CR>
nmap <Leader>fi :call SearchWordAg('filesystem', g:CASE_INSENSITIVE)<CR>
nmap <Leader>bb :call SearchAg('buffer')<CR>
nmap <Leader>bw :call SearchWordAg('buffer', g:CASE_SENSITIVE)<CR>
nmap <Leader>bi :call SearchAg('buffer')<CR>

"==============================================================================
" Go to next/prev error
"==============================================================================
map <Leader>n :lnext<CR>
map <Leader>p :lprev<CR>

"==============================================================================
" Vim Fugitive
"==============================================================================
map <Leader>lb :Gblame<CR>
map <Leader>ll :Glog<CR><CR>
map <Leader>le :Gedit<CR>

"==============================================================================
" Automatic Session Persistence
"==============================================================================
augroup AutoSaveSession
  au!
  autocmd BufReadPost,FileReadPost,BufNewFile * execute("mksession! " . $VIM_DIR . "/.vimsession.vim")
augroup END

"==============================================================================
" Diff Shortcuts
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
" Utility functions
"==============================================================================
function! Mapped(fn, l)
  let new_list = deepcopy(a:l)
  call map(new_list, string(a:fn) . '(v:val)')
  return new_list
endfunction

function! VisualSelection()
    if mode()=="v"
        let [line_start, column_start] = getpos("v")[1:2]
        let [line_end, column_end] = getpos(".")[1:2]
    else
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
    end
    if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
        let [line_start, column_start, line_end, column_end] =
        \   [line_end, column_end, line_start, column_start]
    end
    let lines = getline(line_start, line_end)
    if len(lines) == 0
            return ''
    endif
    let lines[-1] = lines[-1][: column_end - 1]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

"==============================================================================
" Colorscheme and overrides
"==============================================================================
colorscheme yin

"override statusline
hi StatusLine ctermbg=236 ctermfg=254
hi StatusLineNC ctermbg=236 ctermfg=254
hi VertSplit ctermbg=236 ctermfg=254
hi NeomakeErrorMsg ctermfg=161 ctermbg=236
hi NeomakeWarningMsg ctermfg=230 ctermbg=236
