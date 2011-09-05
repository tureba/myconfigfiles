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
set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
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

" Load plugins managed by pathogen
call pathogen#infect()

" coisas dos arquivos
filetype on
filetype plugin on
filetype indent on
syntax on

"codificação padrão: sempre UTF-8
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set scrolloff=3

"o que o backspace pode deletar
set bs=indent,eol,start

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

" grava as alterações antes de :make e outros
set autowrite
set nobackup
set cindent
set writeany

" No annoying error noises
set noerrorbells
set novisualbell

" Não use modelines, use securemodelines
set nomodeline
let g:secure_modelines_verbose = 0
let g:secure_modelines_modelines = 15
au VimEnter * call filter(exists("g:secure_modelines_allowed_items") ? g:secure_modelines_allowed_items : [],
	\ 'v:val != "fdm" && v:val != "foldmethod"')

" Move between splits with CTRL+[hjkl]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle NERDTree plugin
"map <F2> :NERDTreeToggle<CR>

" NERDTree
"let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']

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
" autocmd BufWritePre *.cpp,*.pgc,*.h,*.pgh,*.xml :%s/[ \t\r]*$//

" retorna o cursor para a última posição no arquivo ao abrí-lo
autocmd BufReadPost *
	\	if line("'\"") > 0 && line("'\"") <= line("$") |
	\		exe "normal g`\"" |
	\	endif

au BufNewFile,BufRead *.pgc,*.pgh	setf esqlc


