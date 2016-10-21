if &compatible
  set nocompatible               " Be iMproved
endif

set shell=/bin/bash

" dein.vim pre-config
set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim'))
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:

call dein#add('Shougo/vimproc.vim', { 'build': 'make' })

call dein#add('scrooloose/nerdtree')
call dein#config({
\   'autoload': {
\     'commands': ['NERDTreeToggle','NERDTreeFind']
\   }
\ }) "{{{
  let NERDTreeShowHidden=0
  let NERDTreeQuitOnOpen=0
  let NERDTreeShowLineNumbers=1
  let NERDTreeChDirMode=0
  let NERDTreeShowBookmarks=0
  let NERDTreeIgnore=['\.git','\.hg']
  nnoremap <Leader>p :NERDTreeToggle<CR>
"}}}

call dein#add('Shougo/unite.vim')

call dein#add('Lokaltog/vim-easymotion') "{{{
  let g:EasyMotion_do_mapping = 0 " Disable default mappings

  " Bi-directional find motion
  " Jump to anywhere you want with minimal keystrokes, with just one key binding.
  " Need one more keystroke, but on average, it may be more comfortable.
  nmap s <Plug>(easymotion-s2)

  " Turn on case insensitive feature
  let g:EasyMotion_smartcase = 1

  " JK motions: Line motions
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)

  " Gif config
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
  " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
  " Without these mappings, `n` & `N` works fine. (These mappings just provide
  " different highlight method and have some other features )
  map  n <Plug>(easymotion-next)
  map  N <Plug>(easymotion-prev)
"}}}

call dein#add('Shougo/neocomplete') "{{{
  "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  "Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " Fuzzy completion
  let g:neocomplete#enable_fuzzy_completion = 1
  let g:neocomplete#auto_completion_start_length = 1
  let g:neocomplete#data_directory = $HOME.'/.vim/cache/neocompl'
  let g:neocomplete#min_keyword_length = 4

  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " TESTING: NeoComplete Settings tests
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"}}}

call dein#add('marijnh/tern_for_vim')

call dein#add('leafgarland/typescript-vim')

call dein#add('Quramy/tsuquyomi')

call dein#add('pangloss/vim-javascript') "{{{
  func! TrailSpaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun

  autocmd FileType c,cpp,java,javascript,ruby,python,vimscript autocmd BufWritePre <buffer> :call TrailSpaces()
"}}}

call dein#add('scrooloose/syntastic') "{{{
  let g:syntastic_mode_map={ 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }
  let g:syntastic_javascript_checkers = ['eslint']

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_javascript_eslint_exec = 'eslint_d'
"}}}

call dein#add('mxw/vim-jsx') "{{{
  let g:jsx_ext_required = 0
"}}}

call dein#add('wavded/vim-stylus') "{{{
  autocmd BufNewFile,BufRead *.styl set filetype=stylus
"}}}

call dein#add('mileszs/ack.vim') "{{{
  let g:ackprg='ag --nogroup --nocolor --column'
"}}}

call dein#add('kien/ctrlp.vim', { 'depends': 'tacahiroy/ctrlp-funky' }) "{{{
  let g:ctrlp_clear_cache_on_exit=1
  let g:ctrlp_max_height=10
  let g:ctrlp_show_hidden=0
  let g:ctrlp_follow_symlinks=1
  let g:ctrlp_max_files=20000
  let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
  let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
  let g:ctrlp_reuse_window='startify'
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_extensions=['funky']
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bin'

  nmap \ [ctrlp]
  nnoremap [ctrlp] <nop>

  nnoremap [ctrlp]t :CtrlPBufTag<cr>
  nnoremap [ctrlp]T :CtrlPTag<cr>
  nnoremap [ctrlp]l :CtrlPLine<cr>
  " nnoremap [ctrlp]o :CtrlPFunky<cr>
  nnoremap [ctrlp]b :CtrlPBuffer<cr>
"}}}

call dein#add('mhinz/vim-startify') "{{{
  let g:startify_session_dir = '~/.vim/.cache/sessions'
  let g:startify_change_to_vcs_root = 1
  let g:startify_show_sessions = 1
  nnoremap <F1> :Startify<cr>
"}}}

call dein#add('bling/vim-airline')
call dein#add('flazz/vim-colorschemes')
call dein#add('twe4ked/vim-colorscheme-switcher') "{{{
  autocmd VimEnter * :silent! SetColors all
"}}}

call dein#add('wakatime/vim-wakatime')

"{{{ dein.vim post-config
call dein#end()
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
"}}}

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers

"turn on syntax highlighting
syntax on
au BufRead,BufNewFile *.hbs set filetype=html

"turn off needless toolbar on gvim/mvim
set guioptions-=T
set guioptions-=L
set guioptions-=r

"indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
autocmd BufRead,BufNewFile *.js setlocal tabstop=2 shiftwidth=2 softtabstop=2
"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" TMP directory for *.swp files
if has("win32") || has("win64")
  set directory=$TMP
else
  set directory=/tmp
end

" E492: Noe an editor command W
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>

"make Y consistent with C and D
nnoremap Y y$

"mapping for command key to map navigation thru display lines instead
""of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

"statusline setup
set statusline=%f     "tail of the filename

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Easy access to vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"Reload vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>


" Legacy plugins
" ==============
"
"NeoBundle "jelera/vim-javascript-syntax", {'autoload':{'filetypes':['javascript']}}
"NeoBundle "nathanaelkane/vim-indent-guides"
"NeoBundle "honza/vim-snippets"
"NeoBundle "SirVer/ultisnips" "{{{
"  " Trigger configuration. Do not use <tab> if you use
"  " https://github.com/Valloric/YouCompleteMe.
"  let g:UltiSnipsExpandTrigger="<tab>"
"  let g:UltiSnipsJumpForwardTrigger="<tab>"
"  let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
""}}}
" Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'matchit.zip'
"
" NeoBundle 'marijnh/tern_for_vim'
" 
" NeoBundle 'pangloss/vim-javascript' "{{{
"   func! TrailSpaces()
"     let l = line(".")
"     let c = col(".")
"     %s/\s\+$//e
"     call cursor(l, c)
"   endfun
" 
"   autocmd FileType c,cpp,java,javascript,ruby,python,vimscript autocmd BufWritePre <buffer> :call TrailSpaces()
" "}}}
" 
" NeoBundle "scrooloose/syntastic" "{{{
"   let g:syntastic_mode_map={ 'mode': 'active',
"     \ 'active_filetypes': [],
"     \ 'passive_filetypes': ['html'] }
"   let g:syntastic_javascript_checkers = ['eslint']
" 
"   let g:syntastic_always_populate_loc_list = 1
"   let g:syntastic_javascript_eslint_exec = 'eslint_d'
" "}}}
" 
" NeoBundle 'mxw/vim-jsx' "{{{
"   let g:jsx_ext_required = 0
" "}}}
" NeoBundle 'tpope/vim-fugitive'

" ColorSchemes legacy
" ===================

if has("gui_running")
  set antialias
  "tell the term has 256 colors
  set t_Co=256

  colorscheme desert 
  set guitablabel=%M%t
  set lines=40
  set columns=115
  
  "Vertical Split separator
  hi vertsplit gui=none guibg=grey22 

  if has("gui_mac") || has("gui_macvim")
    set guifont=Source\ Code\ Pro\ Light:h13
    " set guifont=Menlo:h13
    " set guifont=Skyhook\ Mono:h16
    " set guifont=M+\ 1m\ regular:h14
    " set guifont=Input\ Mono:h13
    " set guifont=DejaVu\ Sans\ Mono:h14
    " set guifont=Monaco:h13
    " set guifont=Envy\ Code\ R\ for\ Powerline:h13
    " set guifont=Inconsolata:h13
    " set guifont=Pragmata\ TT:h14
    " set guifont=Dark\ Courier:h16
    " set guifont=Cousine:h14

    set invmmta
    set fuoptions=maxvert,maxhorz

    macmenu &File.New\ Tab key=<nop>
    macmenu &File.Save key=<nop>
    macmenu &File.Open\.\.\. key=<nop>
  endif

  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
    set enc=utf-8
  endif
else
  "dont load csapprox if there is no gui support - silences an annoying warning
  set t_Co=256
  let g:CSApprox_loaded = 1
  colorscheme desert256
endif

set fillchars-=vert:\|
