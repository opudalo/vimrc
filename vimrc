set nocompatible               " Be iMproved
syntax on

if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
set shell=/bin/bash

set switchbuf=useopen,usetab

" let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"Bundle 'tpope/vim-surround'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'mattn/emmet-vim', "{{{
  let g:user_emmet_install_global = 0
  let g:user_emmet_leader_key='<C-e>'
  autocmd FileType html,hbs EmmetInstall
"}}}

NeoBundle 'scrooloose/nerdtree', {'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}} "{{{
  let NERDTreeShowHidden=0
  let NERDTreeQuitOnOpen=0
  let NERDTreeShowLineNumbers=1
  let NERDTreeChDirMode=0
  let NERDTreeShowBookmarks=0
  let NERDTreeIgnore=['\.git','\.hg']
  let NERDTreeBookmarksFile='~/.vim/.cache/NERDTreeBookmarks'
  nnoremap <Leader>p :NERDTreeToggle<CR>
"}}}

NeoBundle 'kien/ctrlp.vim', { 'depends': 'tacahiroy/ctrlp-funky' } "{{{
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

NeoBundle 'pangloss/vim-javascript', "{{{
  let javascript_enable_domhtmlcss=1
"}}}

NeoBundle 'wavded/vim-stylus', "{{{
  autocmd BufNewFile,BufRead *.styl set filetype=stylus
"}}}

NeoBundle 'mhinz/vim-startify', "{{{
  let g:startify_session_dir = '~/.vim/.cache/sessions'
  let g:startify_change_to_vcs_root = 1
  let g:startify_show_sessions = 1
  nnoremap <F1> :Startify<cr>
"}}}

NeoBundle 'mileszs/ack.vim', "{{{
  let g:ackprg='ag --nogroup --nocolor --column'
"}}}

NeoBundle 'bling/vim-airline'


" Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'matchit.zip'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'


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
autocmd FileType html,hbs,styl setlocal tabstop=4 shiftwidth=4 softtabstop=4
set autoindent

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1


if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  colorscheme desert 
  set guitablabel=%M%t
  set lines=40
  set columns=115

  if has("gui_gnome")
    set term=gnome-256color
    colorscheme desert 
    set guifont=Monospace\ Bold\ 12
  endif

  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h14
    set invmmta
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
  let g:CSApprox_loaded = 1

  "set railscasts colorscheme when running vim in gnome terminal
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
    colorscheme railscasts
  else
    colorscheme default
  endif
endif

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


call neobundle#end()


filetype plugin indent on
syntax enable
NeoBundleCheck
