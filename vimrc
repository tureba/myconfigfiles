"
" Tureba's base vimrc
"
"   To use it, place the whole repo in ~/.config/vim and source
"   bashrc from ~/.bashrc
"
" who: Arthur Nascimento <tureba@gmail.com>
" where: github.com/tureba/myconfigfiles
"

" Forget about vi and set it first as it modifies future behaviour
set nocompatible

" Make vim respect the XDG base directory spec.
set directory=$XDG_CACHE_HOME/vim
set backupdir=$XDG_CACHE_HOME/vim
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
let g:netrw_home="$XDG_CACHE_HOME/vim"

" additional directories for pathogen (distro dependent)
" Exherbo
set runtimepath+=/usr/share/vim/vimfiles
" OpenSUSE/Fedora
set runtimepath+=/usr/share/vim/current
" Ubuntu/Debian
set runtimepath+=/usr/share/vim/addons

set tags=.tags,~/.tags

" Load plugins managed by pathogen
call pathogen#infect()

" coisas dos arquivos
filetype on
filetype plugin on
filetype indent on
syntax on
set cindent
"set foldenable
"set foldmethod=syntax

set mouse=a

" codificação padrão: sempre UTF-8
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set scrolloff=3

" o que o backspace pode deletar
set backspace=indent,eol,start

" show match in insert mode
set showmatch
set wrapscan
set incsearch
set ignorecase
set smartcase
set hlsearch

" Tab size
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

set ruler
set showmode
set showcmd

set hidden
" grava as alterações antes de :make e outros
set autowrite
set autowriteall
" backup before writing but erase it afterwards
set nobackup
set writebackup
set writeany

" No annoying error noises
set noerrorbells
set novisualbell
set report=0

" Don't use modelines, use securemodelines
set nomodeline

" for :X
set cryptmethod=blowfish

" Move between splits with CTRL+[hjkl]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" disable imaps plugin if it exists
let did_latexSuite_disabled=0

" Toggle NERDTree plugin
map <F2> :NERDTreeToggle<CR>
" open NERDTree if no file was specified
autocmd vimenter * if !argc() | NERDTree | endif
" close vim if NERDTree is the last buffer and it is being closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc$', '\.o$', '\.class$']

" Toggle paste mode (particularly useful to temporarily disable autoindent)
set pastetoggle=<F3>

" Toggle spelling and show it's status
map <F7> :setlocal spell! spell?<CR>

" snipMate
let g:snips_author='Arthur Nascimento <tureba@gmail.com>'
let g:snippets_dir="$XDG_CONFIG_HOME/vim/bundle/snipmate-snippets"

" mostra os espaços antes de um tab
highlight BeginningWhitespace ctermbg=darkred guibg=darkred
2match BeginningWhiteSpace /[ ]\+\ze\t\|\t\zs[ ]\+/

" mostra os espaços no final da linha
highlight EndingWhitespace ctermbg=darkgreen guibg=lightgreen
match EndingWhiteSpace /[ \t\r]\+$/

" remove os espaços do final das linhas
"autocmd BufWritePre *.cpp,*.pgc,*.h,*.pgh,*.xml :%s/[ \t\r]*$//

" retorna o cursor para a última posição no arquivo ao abrí-lo
autocmd BufReadPost *
	\	if line("'\"") > 0 && line("'\"") <= line("$") |
	\		exe "normal g`\"" |
	\	endif

au BufNewFile,BufRead *.pgc,*.pgh	setf esqlc

map <F4> :call ToggleHex()<CR>

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
