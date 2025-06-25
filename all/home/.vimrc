let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"plugins
call plug#begin()

Plug 'junegunn/vim-plug'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

call plug#end()

"vim option
set mouse=a
set number
set wrap
set tabstop=2
set softtabstop=0
set shiftwidth=2

"keybind
let mapleader = " "
let maplocalleader = "\\"
nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual

"plugins config
if isdirectory(expand( '~/.config/vim/plugins_data' ))
	let s:files = glob('~/.config/vim/plugins_data/*.vim', 0, 1)
	for $file in s:files
		source $file
	endfor
endif
