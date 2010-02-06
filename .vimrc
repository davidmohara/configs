set nobackup			" Do not save backup after close
set writebackup			" Do keep a backup while working
set backupcopy=yes		" Keep original file attribs
set backupdir=~/.vim/backup	" Point backups somewhere else
set directory=~/.vim/swp,.	" Point swap files outside of tree

colorscheme murphy
if has('gui_running')
	set guioptions-=T
	set columns=120
	set lines=60
endif
