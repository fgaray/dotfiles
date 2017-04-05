""Felipe Garay vim conf file""

"{{{Opciones basicas

	"Queremos usar Vim
	set nocompatible

	"{{{Configuramos vundle
		filetype off
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()


        Plugin 'VundleVim/Vundle.vim'

		"mis plugins
		"github

    " Para usar git en VIM
		Plugin 'tpope/vim-fugitive'                     

   " comenta cosas con <Leader>ci
   Plugin 'scrooloose/nerdcommenter'               

   " Nerdtree
   Plugin 'scrooloose/nerdtree'

   " Tabular nos ayuda a indentar texto con respecto a un patron 
   Plugin 'godlygeek/tabular'

   " Navegador de archivos
   Plugin 'ctrlpvim/ctrlp.vim'                         

   " Resaltado de sintaxis de scala
   Plugin 'derekwyatt/vim-scala'                   

   " Ariline!!
   Plugin 'bling/vim-airline'

   Plugin 'mbbill/undotree'
 
   Plugin 'eafgarland/typescript-vim'
   "Plugin 'Quramy/tsuquyomi'
   "Plugin 'Shougo/vimproc.vim'


   "colorschemes
   "Plugin 'tomasr/molokai'
   "Plugin 'altercation/vim-colors-solarized'
   "Plugin 'jnurmine/Zenburn'
   "Plugin 'junegunn/seoul256.vim'
   "Plugin 'chriskempson/base16-vim'
   Plugin 'morhetz/gruvbox'

   "Coq
   Plugin 'jvoorhis/coq.vim'

   " Mejor javascript sintaxsis
   Plugin 'jelera/vim-javascript-syntax'

   " Sintaxsis en templates de yesod
   Plugin 'pbrisbin/html-template-syntax'

   " Snips
   Plugin 'SirVer/ultisnips'
   Plugin 'honza/vim-snippets'

   " Vimwiki
   Plugin 'vimwiki/vimwiki'

   "Taskwarrior
   Plugin 'blindFS/vim-taskwarrior'

   " Projectionist
   Plugin 'tpope/vim-projectionist'

   " Elm
   Plugin 'ElmCast/elm-vim'

   Plugin 'godlygeek/csapprox'

   Plugin 'drmikehenry/vim-fontsize'


   Plugin 'tpope/vim-obsession'

   Plugin 'raichoo/purescript-vim'


   call vundle#end()            " required
   filetype plugin indent on    " required
"}}}
    

	syntax enable

	set smartindent

	"Que nos muestre el comando que estamos escribiendo
	set showcmd

	set background=dark

	set hlsearch

	"para que lo guarde antes de hacer make, entre otras cosas
	set autowrite

	"Formato Unix siempre
	set fileformat=unix

	"Sin beeps en los errores
	set noerrorbells

	"Recargamos los archivos si han sido modificados en el disco
	set autoread

	"cuando cambiamos de buffer nos deja cambiar sin guardar
	set hidden

	"Muestra puntos si la linea no cabe en la ventana
	set wrap linebreak showbreak=...

	"Muestra la posicion del cursor en la parte inferior
	set ruler

  "Numerado relativo
  set rnu

	"Opciones de GVIM
	set guioptions= "sacamos toda la gui, no quiero ningun menu
	set guioptions-=Lm

	" Always show line numbers, but only in current window.
	"set number
	":au WinEnter * :setlocal number
	":au WinLeave * :setlocal nonumber

	"Navegacion facil entre buffers
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l


    set relativenumber
    set number


	"Tratamos de mantener 80 caracteres maximo
	set textwidth=80

	"Opciones de completado
	"Ignora los siguientes archivos
	set wildignore=*.o,*.obj,*~,*.hi,*.pyc,*.class
	
	"Menu que muestra las posibilidades al usar tab al completar
	set wildmenu


	"Utilizamos la coma ',' como leader
	let mapleader = ","

	"Usamos espacios en vez de tabs ahora
	set expandtab

  "Los tabs son de 2 espacios
  set tabstop=2

  set shiftwidth=2

  "encoding
  set encoding=utf-8


  "case-sensitive if search contains an uppercase character
  set ignorecase
  set smartcase  


  "Que espere 1.5 segundo para completar un map
  set timeoutlen=1500


  set colorcolumn=81

  " Para tener una separacion de 2 lineas arriba y abajo
  set scrolloff=2

  set makeprg=make
"}}}


"{{{
  set background=dark
	if has("gui_running")
		"colorscheme zenburn
    "colorscheme molokai
    colorscheme solarized
	else
    "colorscheme seoul256
    "colorscheme solarized
    colorscheme gruvbox
    set background=dark
	endif
"}}}


filetype plugin on
filetype indent on
set ofu=syntaxcomplete#Complete

"{{{ Maps

        "para movernos bien entre lineas largas
        nmap j gj
        nmap k gk

	"Para tener resize con + y - con ventanas horizontales
	if bufwinnr(1)
		nmap + <C-W>+
		nmap - <C-W>-
	endif
	"resize con + y - con ventanas verticales
	"if bufwinnr(1)
	"	map - <C-W><C-W>
	"	map + <S-C-W><S-C-W>
	"endif

	nnoremap <Leader>ce :copen<CR>
	nnoremap <Leader>tb :TagbarToggle<CR>

	"acciones con los buffers
	nnoremap <F5> :buffers<CR>:buffer<Space>
	nnoremap <F6> :buffers<CR>:vert sb <Space>
	nnoremap <F7> :buffers<CR>:to sb <Space>

	"Para movernos por los errores
	nnoremap <Leader>p "+p
	"nnoremap <Leader>y :cn<CR>

	"Alt keys: Activa o desactiva ciertas funcionalidades
	nnoremap <A-n> :setlocal number!<CR>
	nnoremap <Leader>s :call SpellOn()<CR>
	nnoremap <A-c> :close<CR>


	"pone en la linea de comando para editar un archivo en el directorio del arhivo
	"actual
	nnoremap <Leader>fn :e %h:p/


  nnoremap gq :Tabularize /=<CR>

  nnoremap <Leader>n :NERDTree<CR>
  nnoremap <Leader>m :NERDTreeMirror<CR>

	"Cambiamos de tabs al igual que en 
	nmap gt :tabn<CR>
	nmap gT :tabp<CR>

  "Activa el fold
  nnoremap <Leader>f :set foldmethod=syntax<CR>

  " Firma el texto que esta en el buffer actual
  nnoremap <Leader>gs :%!gpg --clearsign<CR>

  "Compilar
  nnoremap <Leader>c :make<CR>
  nnoremap <Leader>cd :make -Q debug=1<CR>


  "{{{ Maps para git
  nnoremap <Leader>gc :Gcommit<CR>
  nnoremap <Leader>gw :Gwrite<CR>
  nnoremap <Leader>gps :Git push origin master<CR>
  nnoremap <Leader>gpl :Git pull origin master<CR>
  nnoremap <Leader>gr :Git rebase master<CR>
  nnoremap <Leader>gb :Git checkout -b<Space> 
  nnoremap <Leader>go :Git checkout<Space>
  nnoremap <Leader>gm :Git checkout master<CR>
  nnoremap <Leader>gs :Git stripspace<CR>
  "}}}
    
   
  "Permite copiar (+p) y pegar (+y) facilmente desde X
  nnoremap +p "+p
  nnoremap +y "+y

  nnoremap <Leader>p :.!xsel<CR>

  map! <F1> <
  map! <F2> >


  " How do i
  nnoremap <Leader>hd :.!howdoi 

  "Para los buffers
  map <c-l> :CtrlPBuffer<CR>


  map <leader>gf :e <cfile><CR>

  "Gudardar rapidamente
  noremap <leader>s :wa<CR>

"}}}

"{{{AUTOCMDs

        "Scons Files
        autocmd BufReadPre,BufNewFile SConstruct set filetype=python
        autocmd BufReadPre,BufNewFile SConscript set filetype=python



"}}]


"{{{Folds

set foldnestmax=2


"}}]



set laststatus=2

"Buscar ctags
set tags=tags;/



"sudo en el archivo que estamos editando con :W
:command! W w !sudo tee % > /dev/null


"{{{ Archivos de vim
	set writebackup "Guardamos backups pero los borramos al terminar de escribir el archivo
	set swapfile
	set directory=$HOME/.vim/swap// " Same for swap files
  set backupdir=$HOME/.vim/backups//
	set viewdir=$HOME/.vim/views// " same for view files
"}}}

""STATUSLINE
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


"{{{ persistent undo
	set undofile                " Save undo's after file closes
	set undodir=$HOME/.vim/undo " where to save undo histories
	set undolevels=1000         " How many undos
	set undoreload=10000        " number of lines to save for undo
"}}}




"{{{ Opciones plugins
        let g:clang_complete_auto = 0
        let g:clang_user_options = " -std=c++11"
        let g:clang_exec = "clang++"

        "opciones de Ack
        let g:ackprg="ack-grep -H --nocolor --nogroup --column"


        let g:syntastic_cpp_compiler_options = ' -std=c++11'
        let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python', 'ruby'],
                           \ 'passive_filetypes': ['java', 'scala'] }

        let g:ctrlp_working_path_mode = 'a'



        "Opciones latex-box

        let g:LatexBox_latexmk_async = 1
        let g:LatexBox_show_warnings = 0

        let g:necoghc_enable_detailed_browse = 1

        let g:task_rc_override = 'rc.defaultwidth=0'

"}}}



"{{{ Funciones varias

function! CreateFunction()
    :normal pmigg/::byt:'iwi pli::==A€kb{}kkkwhxjj:noh
endfunction


function! SpellOn()
 :setlocal spell! spelllang=es
 :syntax spell toplevel
endfunction



nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction



"}}}"


"imap aa á
"imap ee é
"imap ii í
"imap oo ó
"imap uu ú
