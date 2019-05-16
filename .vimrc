set nocompatible " be iMproved, required
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
"  The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" 禁止 折叠
let g:vim_markdown_folding_disabled = 1

Plugin 'chriskempson/base16-vim'
colorscheme base16-monokai
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'reedes/vim-pencil'

"let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
" let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
" let g:pencil_neutral_code_bg = 1   " 0=gray (def), 1=normal
"let g:pencil_gutter_color = 1      " 0=mono (def), 1=color
"let g:pencil_spell_undercurl = 1       " 0=underline, 1=undercurl (def)
"let g:pencil_terminal_italics = 1

" colorscheme pencil
set background=dark


Plugin 'tamlok/detorte'

