" The basics
set nocompatible

set smartindent
set autoindent

set tabstop=4
set shiftwidth=4

set expandtab

"Specialized tabs <-- currently forcing uniformity.
"                     Probably redundant with above.
autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd Filetype css  setlocal ts=4 sts=4 sw=4
autocmd Filetype tag  setlocal ts=4 sts=4 sw=4
autocmd Filetype xml  setlocal ts=4 sts=4 sw=4
autocmd Filetype jsp  setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4


set list " draw whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:< " what to replace various ws
                                                  " chars with
                                                  "

" set our vim path to look in the current directory of the file we are
" editing, all sub directories, the directory from which vim was launched.
set path=.,**,,

"DO NOT SET t_Co
"set t_Co=256


set incsearch " start searching as text is entered
set hlsearch " highlight matches
set number " display line numbers
set background=dark " set background color style
set clipboard=unnamedplus " set the clipboard to the X window clipboard
set backspace=indent,eol,start " backspace will traverse indent, eol, start
set nofoldenable " prevent folding
set shortmess+=I " don't show splash screen
                 " http://blog.sanctum.geek.nz/vim-annoyances/

set lazyredraw " Prevent UI from drawing during macro execution.

set laststatus=2 " display status line always (useful with Powerline plugin)

" >> moves to the nearest multiple of
" shiftwidth, not by shiftwidth
" http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround


syntax enable

"set color scheme

"if has('gui_running') " <-- if we're running MacVim or Gvim
"    set background=light
"else
    set background=dark
"endif
let g:solarized_termcolors=16
colorscheme solarized



"load plugins using Plugged
call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/jlanzarotta/bufexplorer.git'
    Plug 'https://github.com/tpope/vim-fugitive.git'
    Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'https://github.com/scrooloose/syntastic.git'
    Plug 'https://github.com/scrooloose/nerdcommenter.git'
    Plug 'https://github.com/majutsushi/tagbar.git'
    Plug 'https://github.com/airblade/vim-gitgutter.git'
    Plug 'https://github.com/tpope/vim-rails.git'
    Plug 'https://github.com/groenewege/vim-less.git'
    Plug 'https://github.com/mattn/emmet-vim.git'
    Plug 'https://github.com/Shougo/neocomplcache.vim.git'
    Plug 'https://github.com/tpope/vim-unimpaired.git'
    Plug 'https://github.com/tpope/vim-surround.git'
    "Plug 'https://github.com/jelera/vim-javascript-syntax.git'
    Plug 'https://github.com/moll/vim-node.git'
    Plug 'https://github.com/darvelo/vim-systemd.git'
    Plug 'https://github.com/pangloss/vim-javascript.git'
    Plug 'https://github.com/othree/javascript-libraries-syntax.vim.git'
    Plug 'https://github.com/marijnh/tern_for_vim.git'
    Plug 'https://github.com/kien/ctrlp.vim.git'
    Plug 'https://github.com/tpope/vim-speeddating.git'
    Plug 'https://github.com/tpope/vim-repeat.git'
    Plug 'https://github.com/tfnico/vim-gradle'
    Plug 'https://github.com/kchmck/vim-coffee-script.git'
    Plug 'https://github.com/fatih/vim-go.git'
    Plug 'https://github.com/Valloric/YouCompleteMe.git'
    Plug 'https://github.com/vim-scripts/Conque-Shell.git'
    Plug 'https://github.com/Lokaltog/powerline.git'
    Plug 'https://github.com/christoomey/vim-tmux-navigator.git'
    Plug 'https://github.com/godlygeek/tabular.git'
    Plug 'https://github.com/plasticboy/vim-markdown.git'
    Plug 'https://github.com/joker1007/vim-markdown-quote-syntax.git'
    Plug 'https://github.com/rcmdnk/vim-markdown.git'
    Plug 'https://github.com/digitaltoad/vim-jade.git'
    Plug 'https://github.com/vim-scripts/Conque-Shell.git'
call plug#end()

"set the location of the clang lib
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

set hidden " only hide buffers, to preserve undo history

filetype plugin indent on
"autocmd FileType * if &completefunc != '' | let &omnifunc=&completefunc | endif

"http://vim.wikia.com/wiki/Fix_syntax_highlighting
"recalculate syntax highlighting from the start of the file on change
autocmd BufEnter * :syntax sync fromstart

"when saving, remove all trailing spaces from the file.
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Remove trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun


" Pathogen, bundler currently disabled.
"call pathogen#infect()
"call pathogen#helptags()

" Syntastic settings
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loclist=1
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_checkers=['jshint', 'eslint']

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
  \ 'dir':  '\v[\/](bin|build|dist|lib|eclipse|)$',
  \ }


" TagBar with JSCTags
"let g:tagbar_type_javascript = {
    "\ 'ctagsbin' : '/usr/local/bin/jsctags'
"\ }

" Ctags // DISABLED
"let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
"map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" neocomplcache settings
"let g:acp_enableAtStartup = 0
" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"if !exists('g:neocomplcache_force_omni_patterns')
      "let g:neocomplcache_force_omni_patterns = {}
  "endif
  "let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'


"Omni Complete
set completeopt=longest,menuone

" Eclim settings:
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimFileTypeValidate = 0

" configure omnicomplete settings by filetype

"set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete




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
  \    'indentation' : '    ',
  \    'snippets' : {
  \      'ap' : "data-dojo-attach-point=\"${cursor}\"",
  \      'html' : '<html lang="en">\n<head>\n\t<title></title>\n</head>\n<body>\n</body>\n</html>'
  \    }
  \  },
  \  'css' : {
  \    'filters' : 'fc',
  \    'indentation' : '    ',
  \    'snippets' : {
  \      'border-radius' : "-moz-border-radius: 10px; \n-o-border-radius: 10px; \nborder-radius: 10px;"
  \    },
  \  },
  \  'javascript' : {
  \    'indentation' : '    ',
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
\      'f' : "function () {${cursor}}",
\      'f,' : "function () {${cursor}},",
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
map <leader>t <Esc>:TagbarToggle<CR>

" Making it harder not to use VIM bindings
noremap  <Up>    <Nop>
noremap  <Down>  <Nop>
noremap  <Left>  <Nop>
noremap  <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>


"Auto generating closing braces
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR

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


"Powerline configuration
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup


" Functions around a specific todo list that I maintain.
function TODO()
    :o ~/TODO/TODO.md
endfunction

function STODO()
    :!cd ~/TODO/;git add TODO.md; git commit -m '`date`';
endfunction


"ECLIM

let g:EclimJavaHierarchyDefaultAction='edit'
map <leader>cc <Esc>:JavaSearchContext<CR>
map <leader>h <Esc>:JavaCallHierarchy<CR>
map <leader>ch <Esc>:JavaHierarchy<CR>
