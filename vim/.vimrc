"dein Scripts-----------------------------"{{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:

  "Colors-------------------------
  call dein#add('gosukiwi/vim-atom-dark')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('davidklsn/vim-sialoquent')
  call dein#add('zanglg/nova.vim')
  call dein#add('KeitaNakamura/neodark.vim')
  call dein#add('tyrannicaltoucan/vim-quantum')
  call dein#add('jacoborus/tender.vim')
  call dein#add('tyrannicaltoucan/vim-deep-space')
  call dein#add('rakr/vim-one')
  call dein#add('notpratheek/vim-luna')
  call dein#add('scwood/vim-hybrid')

  "UI------------------------------
  call dein#add('ap/vim-buftabline')
  call dein#add('itchyny/lightline.vim')
  call dein#add('restore_view.vim')

  "Browse-------------------------
  call dein#add('tpope/vim-vinegar')
  call dein#add('ctrlpvim/ctrlp.vim')

  "Functionality-------------------
  call dein#add('raimondi/delimitmate')
  call dein#add('tpope/vim-fugitive')
  call dein#add('sirver/ultisnips')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('mhinz/vim-startify')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('scrooloose/nerdtree')

  "Languages
  call dein#add('posva/vim-vue')
  call dein#add('digitaltoad/vim-pug')
  call dein#add('cakebaker/scss-syntax.vim')

  "Testing
  "call dein#add('ervandew/supertab')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------"}}}

"Config-------------------------------"{{{
let mapleader = ','

set viewoptions=cursor,folds,unix "set options to auto save/restore view
let g:skipview_files = ['*\.vim']

set fdm=marker 			"fold method to marker

set tabstop=2 softtabstop=2 shiftwidth=2 "set tabs to 2 spaces
set expandtab

set nohlsearch            "don't highlight searches
set incsearch             "search while typing

set background=dark

let g:netrw_winsize=25
let g:netrw_preview=1
let g:netrw_alto=0
let g:netrw_liststyle=3

set splitbelow
set splitright"}}}

"Colors----------------------------------"{{{
" colorscheme sialoquent
" colorscheme nova
" colorscheme nord
" colorscheme neodark
" colorscheme deep-space
colorscheme one
" colorscheme luna
" colorscheme hybrid
" colorscheme tender "nice
" colorscheme quantum "nice
" colorscheme atom-dark"}}}

"Font-------------------------------------"{{{
" set guifont=CamingoCode:h18
set guifont=Fira_Code_Light:h18 "gorgeous
" set guifont=Inconsolata-dz:h18 "nice
" set guifont=Input_Mono:h18
" set guifont=Overpass_Mono:h18 "not bad
" set guifont=Source_Code_Pro:h18 "not bad either"}}}

"Gui options-----------------------------"{{{
set laststatus=2            "enable statusbar
set linespace=8             "add spacing between lines
set nu                      "show numbers
set numberwidth=5

"disable a couple of gui extras
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=e

set noeb novb t_vb=         "disable visual and audible bell

" set transparency=2
"hi LineNr guibg=bg"}}}

"Keyboard Mappings------------------------"{{{

"plugin manage
nmap <leader>pd :call map(dein#check_clean(), "delete(v:val, 'rf')")<cr>
nmap <leader>pi :call dein#install()<cr>
nmap <leader>pu :call dein#update()<cr>

"edit stuff
nmap <leader>ev :e ~/.vimrc<cr>
nmap <leader>es :UltiSnipsEdit<cr>

"movesplits
nmap <C-j> :winc j<cr>
nmap <C-k> :winc k<cr>
nmap <C-h> :winc h<cr>
nmap <C-l> :winc l<cr>

nmap <C-tab> :bn<cr>
nmap <C-W> :bd<cr>"}}}

"Plugin configs----------------------------"{{{

"lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \ },
      \ }

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

"UltiSnips
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

"commentary
autocmd FileType vue.html.javascript.css setlocal commentstring=//\ %s

"neocomplete
let g:neocomplete#enable_at_startup = 1"

"CtrlP
set wildignore+=*/.git/*,*/node_modules/*        " Linux/MacOSX
" let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode='wa'"}}}


"NERDTree
" nmap <leader>\ :NERDTreeToggle<cr>

"Reload vimrc--------------------------------
augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END
