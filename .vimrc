" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" required for vundle
filetype off


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Python and PHP Debugger
"Bundle 'fisadev/vim-debug.vim'
" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" max number of mru entries, if it gets too large it takes time to load it
let g:ctrlp_mruf_max = 150
" Zen coding
Bundle 'mattn/zencoding-vim'
" Git integration
"Bundle 'motemen/git-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Powerline
Bundle 'Lokaltog/vim-powerline'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Townk/vim-autoclose'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
" Bundle 'klen/python-mode'
" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" Git diff icons on the side of the file lines
Bundle 'airblade/vim-gitgutter'
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative 
" numbering every time you go to normal mode. Author refuses to add a setting 
" to avoid that)
" Bundle 'myusuf3/numbers.vim'

" Bundles from vim-scripts repos

" Autocompletion
Bundle 'AutoComplPop'
"Bundle 'Valloric/YouCompleteMe'

" Python code checker
" Bundle 'pyflakes.vim'         # MATTI turn off
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'

Bundle 'rking/ag.vim'

Bundle 'duff/vim-bufonly'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1

Bundle 'gist-vim'




" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" allow plugins by file type
let g:syntastic_mode_map = { 'mode': 'passive' }
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" always show status bar
set ls=2

" incremental search
set incsearch

"Ignore case when searching
set ignorecase 
set smartcase

" highlighted search results
set hlsearch

" line numbers
set nu

" toggle Tagbar display
"map <F4> :TagbarToggle<CR>
map tb :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" show pending tasks list
map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletion
highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add
" namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can
" change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0


" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,b :CtrlPBuffer<CR>
nmap ,m :CtrlPMRUFiles<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    " color
    colorscheme fisa
else
    " color
    colorscheme delek
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest


set wildignore+=*/static/*

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

set gfn=Menlo:h15
set shell=/bin/zsh

set t_Co=256
set nonu
if has("gui_running")
    set guioptions-=T
    set nonu
    colorscheme wombat
else
    set t_Co=256
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

let NERDTreeIgnore=['\.pyc$']

map - /
map _ ?
map ö :
map Ö :
map <silent><leader>B :b#<CR>
"NERDToggleComment
map <leader><Space> <leader>c<Space>
nnoremap ,cd :cd %:p:h<CR>

"this needs to be there otherwise it keeps popping up new split windows if we
"have dirty buffers
set hidden

" Make SnipMate recognize Django files
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html


"add snippets to autocompletion
fun! GetSnipsInCurrentScope() 
    let snips = {} 
    for scope in [bufnr('%')] + split(&ft, '\.') + ['_'] 
        call extend(snips, get(s:snippets, scope, {}), 'keep') 
        call extend(snips, get(s:multi_snips, scope, {}), 'keep') 
    endfor 
    return snips 
endf 

"this allows me to scroll the autocomplete box with Ctrl j/k instead of Ctrl n/p
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

map <leader>a :Ag 
map <C-N> :cnext<CR>
map <C-S-N> :cprevious<CR>

map <silent><leader>d :bdelete<CR>
map <silent><leader>D :bufdo bdelete<CR>

" Resize window
map + <C-W><
map ´  <C-W>>

" Save fast
map <leader>w :w<CR>

" Treat wrapped lines as normal lines
nnoremap j gj
nnoremap k gk

" Toggle line numbers
map <leader>l :set nu!<CR>

"https://github.com/scrooloose/nerdtree/issues/21
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <leader>q :e ~/Dropbox/notes/misc_notes.txt<cr>
au BufRead,BufNewFile ~/Dropbox/notes/misc_notes.txt iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>


"select last pasted text from http://vim.wikia.com/wiki/VimTip759
"nnoremap gp `[v`]

"map <leader>f :FufFile **/<CR>
"let g:EasyMotion_leader_key = '<Leader>m'
"map <leader>f :CommandT<CR>
"map <leader>f :FufFile **/<CR>
"map å :FufTag<CR>
"map <silent><leader>B :b#<CR>
"map <leader>b :CommandTBuffer<CR>
"map <leader>b :CtrlPBuffer<CR>
"map <leader>M :MRU<CR>
"map <leader>n :NERDTreeToggle<CR>
"map <leader>r :NERDTreeFind<CR>
"map ä :bNext<CR>
"map <leader>t <C-]>
"map <leader>T <C-T>
"map <leader>. `.
"map <leader>o :TlistToggle<CR>
map <silent><Esc>n :nohlsearch<CR>
"map <leader>g :GundoToggle<CR>
"map <leader>v :TagbarOpenAutoClose<CR>


