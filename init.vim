"let mapleader = ","
let mapleader=" "

" The basics
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

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
  set scrolloff=3
  "set showmatch " Show matching

  " set timeout when looking for key combinations
  set timeoutlen=1000 ttimeoutlen=0


  " default to the system clipboard
  set clipboard=unnamed " set the clipboard to the X window clipboard


endif

syntax enable
" configure omnicomplete settings by filetype

"set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

"http://vim.wikia.com/wiki/Fix_syntax_highlighting
"recalculate syntax highlighting from the start of the file on change
autocmd BufEnter * :syntax sync fromstart

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
set background=dark " set background color style
set backspace=indent,eol,start " backspace will traverse indent, eol, start

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set shortmess+=I " don't show splash screen
                 " http://blog.sanctum.geek.nz/vim-annoyances/

set lazyredraw " Prevent UI from drawing during macro execution.

set laststatus=2 " display status line always (useful with Powerline plugin)

" >> moves to the nearest whole tab multiple rather than just by amount == tabwidth
" http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround

"set color scheme
set background=dark
"let g:solarized_termcolors=16
"colorscheme solarized
colorscheme monokai

"load plugins using Plugged
call plug#begin('~/.vim/plugged')
  Plug 'https://github.com/jlanzarotta/bufexplorer.git'
  Plug 'https://github.com/tpope/vim-fugitive.git'
  Plug 'https://github.com/tpope/vim-git.git'
  Plug 'https://github.com/scrooloose/nerdtree.git'
  Plug 'https://github.com/scrooloose/syntastic.git'
  Plug 'https://github.com/tpope/vim-commentary'
  Plug 'https://github.com/majutsushi/tagbar.git'
  Plug 'https://github.com/rking/ag.vim.git'
  Plug 'https://github.com/airblade/vim-gitgutter.git'
  Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
  Plug 'https://github.com/Valloric/YouCompleteMe.git'
  Plug 'https://github.com/christoomey/vim-tmux-navigator.git'
  Plug 'https://github.com/mattn/emmet-vim.git'
  Plug 'https://github.com/tpope/vim-unimpaired.git'
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'https://github.com/editorconfig/editorconfig-vim.git'
  Plug 'https://github.com/mustache/vim-mustache-handlebars.git', { 'for': 'handlebars' }
  Plug 'https://github.com/gorodinskiy/vim-coloresque.git'
  Plug 'https://github.com/mxw/vim-jsx.git', { 'for': 'jsx' }
  Plug 'https://github.com/othree/yajs.vim', { 'for': 'javascript' }
  Plug 'https://github.com/tmhedberg/matchit.git'
  Plug 'https://github.com/mhinz/vim-startify'
  Plug 'https://github.com/vim-airline/vim-airline'
  Plug 'https://github.com/JarrodCTaylor/vim-shell-executor'
  Plug 'https://github.com/osyo-manga/vim-over'
  Plug 'https://github.com/justinmk/vim-sneak'
  Plug 'https://github.com/lrvick/Conque-Shell'
  Plug 'https://github.com/majutsushi/tagbar'
  Plug 'https://github.com/nathanaelkane/vim-indent-guides'
  Plug 'https://github.com/wellle/targets.vim'
  "Plug 'https://github.com/nono/vim-handlebars.git', { 'for': 'handlebars' }
  Plug 'https://github.com/tpope/vim-rails.git', { 'for': 'rails' }
  "Plug 'https://github.com/Shougo/neocomplcache.vim.git'
  "Plug 'https://github.com/moll/vim-node.git'
  "Plug 'https://github.com/darvelo/vim-systemd.git'
  "Plug 'https://github.com/marijnh/tern_for_vim.git'
  Plug 'https://github.com/tpope/vim-speeddating.git'
  "Plug 'https://github.com/tpope/vim-repeat.git'
  "Plug 'https://github.com/tfnico/vim-gradle'
  Plug 'https://github.com/kchmck/vim-coffee-script.git', { 'for': 'coffee' }
  Plug 'https://github.com/fatih/vim-go.git', { 'for': 'go' }
  Plug 'https://github.com/digitaltoad/vim-jade.git', { 'for': 'jade'}
call plug#end()

"set the location of the clang lib
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

set hidden " only hide buffers, to preserve undo history when returning to other buffers

filetype plugin indent on
"autocmd FileType * if &completefunc != '' | let &omnifunc=&completefunc | endif

"when saving, remove all trailing spaces from the file.
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Remove trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

let g:rehash256 = 1

" Pathogen, bundler currently disabled.
"call pathogen#infect()
"call pathogen#helptags()

" Syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loclist=1
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_checkers=['jshint'] ",'jsonlint'] , 'eslint' ]
let g:syntastic_ruby_checkers=['rubocop']

"Status line override (working with Syntastic)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"Ctrl P
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.git,*.hg,*.svn,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](bin|build|dist|lib|eclipse|tmp|vendor|node_modules|bower_components)$',
  \ }
let g:ctrlp_reuse_window = 'startify'

map <Leader>fs :CtrlPTag<CR>
map <Leader>fd :CtrlPCurFile<CR>
map <Leader>fb :CtrlPBuffer<CR>

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"Omni Complete
set completeopt=longest,menuone

" Eclim settings:
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimFileTypeValidate = 0




au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mkd set filetype=markdown


hi SpecialKey term=bold cterm=bold ctermfg=16 guifg=#000
hi NonText term=bold cterm=bold ctermfg=16 guifg=#000



" Emmet  (Zen Coding)
let g:user_emmet_mode='i'    "only enable normal mode functions.
let g:BASH_Ctrl_j = 'off'
let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_next_key = '<c-k>'
let g:user_emmet_leader_key = '\a'
let g:use_emment_complete_tag = 1

let g:user_emmet_settings = {
  \  'lang' : 'en',
  \  'html' : {
  \    'filters' : 'html',
  \    'indentation' : '  ',
  \    'snippets' : {
  \      'ap' : "data-dojo-attach-point=\"${cursor}\"",
  \      'html' : '<html lang="en">\n<head>\n\t<title></title>\n</head>\n<body>\n</body>\n</html>'
  \    }
  \  },
  \  'css' : {
  \    'filters' : 'fc',
  \    'indentation' : '  ',
  \    'snippets' : {
  \      'border-radius' : "-moz-border-radius: 10px; \n-o-border-radius: 10px; \nborder-radius: 10px;"
  \    },
  \  },
  \  'javascript' : {
  \    'extends' : 'javascript',
  \    'indentation' : '  ',
  \    'snippets' : {
  \      'i' : "if (${cursor}) {\n\t${cursor}\n}",
  \      'e' : "else {\n\t${cursor}\n}",
  \      'ie' : "if (${cursor}) {\n\t${cursor}\n} else {\n\t${cursor}\n}",
  \      'sw' : "switch(${cursor}) {\n\tcase ${cursor}:\n\t\t${cursor};\n\t\tbreak;\n\tcase ${cursor}:\n\t\t${cursor};\n\t\tbreak;\n\tcase ${cursor}:\n\t\t${cursor};\n\t\tbreak;\n\tdefault:\n\t\t${cursor};\n\t\tbreak;\n}",
  \      'gt' : "gulp.task('${cursor}', function () { ${cursor} })",
  \      's' : "set('${cursor}',${cursor});${cursor}",
  \      'ap' : "data-dojo-attach-point=\"${cursor}\"",
  \      'dce' : "domConstruct.empty(${cursor});",
  \      'dcp' : "domConstruct.place(${cursor});",
  \      'dcc' : "domConstruct.create(${cursor});",
  \      'dcd' : "domConstruct.destroy(${cursor});",
  \      'dc' : "domClass.add(${cursor});",
  \      'dcr' : "domClass.remove(${cursor});",
  \      'require' : "/*global require */\nrequire([${cursor}],function(${child}) {\n\n});",
  \      'define' : "/*global define */\ndefine([\"dojo/_base/declare\"],\nfunction(declare) {\n\treturn declare(\"\",[],{\n\t\t${cursor}${child}\n\t});\n});",
  \      'dijit' : "/*global define */\ndefine([\"dojo/_base/declare\",\n\"dijit/_WidgetBase\",\n\"dijit/_TemplatedMixin\"],\nfunction(declare, _WidgetBase, _TemplatedMixin) {\n\treturn declare([_WidgetBase, _TemplatedMixin],{\n\t\ttemplateString:\n\t\t\t'<div>' +\n\t\t\t'</div>',\n\t\tpostCreate: function() {\n\t\t\tthis.inherited(arguments);\n\t\t\t${cursor}\n\t\t},\n\t\tdestroy: function() {\n\t\t\tthis.destroyRecursive();\n\t\t\tthis.inherited(arguments);\n\t\t}\n\t});\n});",
  \
\      'foreach' : "array.forEach(${cursor},function(${child}){\n\n});",
\      'f' : "() => {${cursor}}",
\      'f,' : "() => {${cursor}},",
\      'on' : "on(${cursor},\"click\", function(){${child}\n\n});",
\      'then' : "then(function() {\n\t${cursor}\n});",
\      'c' : "console.log(${cursor});"
\    },
\  },
\ 'java' : {
\  'indentation' : '    ',
\  'snippets' : {
\   'main': "public static void main(String[] args) {\n\t|\n}",
\   'println': "System.out.println(\"|\");",
\   'class': "public class | {\n}\n",
\  },
\ },
\}

" ==============================================================================
" = mappings                                                                   =
" ==============================================================================

" ------------------------------------------------------------------------------
" - general_(mappings)                                                         -
" ------------------------------------------------------------------------------


" open tagbar and nerdtree
map <F9> <Esc>:NERDTreeToggle<CR>

map <Leader>rs :w<cr>:!CURR_DIR=$(pwd); cd $(git rev-parse --show-toplevel); bundle exec rspec %;cd $CURR_DIR<cr>

map <Leader>rr :w<cr>:!CURR_DIR=$(pwd); cd $(git rev-parse --show-toplevel); bundle exec rubocop %; cd $CURR_DIR<cr>

"map <leader>t <Esc>:TagbarToggle<CR>

nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize +1<CR>
nnoremap <Down> :resize -1<CR>

nnoremap <Leader><Enter> :exe "tag ". expand("<cword>")<CR>

inoremap jj <ESC>
inoremap jk <ESC>

" function to identify repeating lines
" https://stackoverflow.com/questions/1268032/marking-duplicate-lines
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


"YouCompleteMe Configuration
let g:ycm_min_num_of_chars_for_completion = 1


"let g:airline_theme='understated'                   " Use the custom theme I wrote
"let g:airline_left_sep=''                           " No separator as they seem to look funky
"let g:airline_right_sep=''                          " No separator as they seem to look funky
let g:airline#extensions#branch#enabled = 0         " Do not show the git branch in the status line
let g:airline#extensions#syntastic#enabled = 1      " Do show syntastic warnings in the status line
let g:airline#extensions#tabline#show_buffers = 0   " Do not list buffers in the status line
let g:airline#extensions#branch#enabled = 1

let g:airline_section_x = ''                        " Do not list the filetype or virtualenv in the status line
let g:airline_section_y = 'R[%03l/%L] C[%03v]'  " Replace file encoding and file format info with file position
let g:airline_section_z = ''                        " Do not show the default file position info
"
"Powerline configuration
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

function FixQuotes()
  %s/[“”]/"/g
  %s/[‘’]/'/g
endfunction

nmap t% :tabedit %<CR>
nmap td :tabclose<CR>

"ECLIM

"let g:EclimJavaHierarchyDefaultAction='edit'
"map <leader>cc <Esc>:JavaSearchContext<CR>
"map <leader>h <Esc>:JavaCallHierarchy<CR>
"map <leader>ch <Esc>:JavaHierarchy<CR>


autocmd BufNewFile,BufRead *.js nnoremap <Leader>tt :!mocha %<CR>
autocmd BufNewFile,BufRead *.rb nnoremap <Leader>tt :!rspec %<CR>

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction

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

" alias :ag to :Ag
cnoreabbrev <expr> ag ((getcmdtype() is# ':' && getcmdline() is# 'ag')?('Ag'):('ag'))
