"dein Scripts{{{1-----------------------------
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

  "UI------------------------------
  call dein#add('ap/vim-buftabline')
  call dein#add('itchyny/lightline.vim')
  call dein#add('restore_view.vim')

  "Browse-------------------------
  call dein#add('tpope/vim-vinegar')
  call dein#add('ctrlpvim/ctrlp.vim')

  call dein#add('raimondi/delimitmate')
  call dein#add('tpope/vim-fugitive')
  call dein#add('ervandew/supertab')
  call dein#add('sirver/ultisnips')
  call dein#add('Shougo/neocomplete.vim')

  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('commentToggle')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('mhinz/vim-startify')
  call dein#add('nathanaelkane/vim-indent-guides')

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

"End dein Scripts-------------------------1}}}

"My Config-------------------------------
let mapleader = ','

set viewoptions=cursor,folds,unix
let g:skipview_files = ['*\.vim']

set fdm=marker 			"fold method to marker
set tabstop=2 expandtab softtabstop=2 shiftwidth=2

"Gui Options-----------------------------

colorscheme atom-dark

set guifont=Fira\ Mono\ 11
set laststatus=2
set linespace=8
set nu
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T

set guioptions-=e
set noeb vb t_vb=

hi LineNr guibg=bg
set numberwidth=6
"hi TabLineSel guibg=#445566

set nohlsearch
set incsearch


"Keyboard Mappings------------------------

"Manage the plugin manager----------------
nmap <leader>pd :call map(dein#check_clean(), "delete(v:val, 'rf')")<cr>
nmap <leader>pi :call dein#install()<cr>
nmap <leader>pu :call dein#update()<cr>

nmap <leader>ev :e ~/.vimrc<cr>
"nmap <leader>es :UltiSnipsEdit<cr>

set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

nmap <C-tab> :bn<cr>
nmap <C-W> :bd<cr>


"Status Line-------------------------------
let g:lightline = {
      \ 'colorscheme': 'powerline',
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


"Reload vimrc--------------------------------
augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END
