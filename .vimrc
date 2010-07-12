runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

" Swap files ******************************************************************
set nobackup			" Do not save backup after close
set writebackup			" Do keep a backup while working
set backupcopy=yes		" Keep original file attribs

" Directories *****************************************************************
set backupdir=~/.vim/backup	" Point backups somewhere else
set directory=~/.vim/swp,.	" Point swap files outside of tree

" Borrowed from http://github.com/armmer/vim_files/blob/master/.vimrc
" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces
 
function! Tabstyle_tabs()
" Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction
 
function! Tabstyle_spaces()
" Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction
 
call Tabstyle_spaces()

" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent (local to buffer)

:syntax on

" Mappings ********************************************************************
imap jj <Esc>
imap uu _
imap hh =>
imap aa @

map <S-Enter> O<Esc> " awesome, inserts new line without going into insert mode
map <Enter> o<Esc>
set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)
 

" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge
 
 
" Ruby stuff ******************************************************************
compiler ruby " Enable compiler support for ruby
map <F5> :!ruby %<CR>
 
" validates ruby syntax while in the file
map ,val :!ruby -c %<CR>
 
filetype plugin indent on 
" Omni Completion *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 

"Add fuzzy search to :e lookups
set wildmenu

colorscheme herald
if has('gui_running')
	set guioptions-=T
	set columns=120
	set lines=60
  set number
endif
