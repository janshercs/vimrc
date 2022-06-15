set nocompatible              " required
filetype off                  " required
"test test
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
" vim appearances
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
" General IDE
Bundle 'Valloric/YouCompleteMe'
Bundle 'yssl/QFEnter'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
" Plugin 'kien/ctrlp.vim'
Plugin 'dominikduda/vim_current_word'
" Go
Plugin 'fatih/vim-go'
" Python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

call vundle#end()            " required
filetype plugin indent on    " required

" formatting for code
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

set encoding=utf-8


" IDE appearance
set showcmd
set nu
set relativenumber

let python_highlight_all=1
syntax on

let g:airline_theme='onedark'
colo onedark

" twin word highlighting settings
let g:vim_current_word#enabled = 1
" hi CurrentWord ctermfg=205
" hi CurrentWordTwins ctermbg=237

" Close buffer after autosuggest
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" For Quickfix/Location list
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

" Keymappings
" Go
"runs all tests in current file
autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test) 
autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test-func)
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>c  <Plug>(go-callers)

"python with virtualenv support

python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  print(project_base_dir)
  execfile(activate_this, dict(__file__=activate_this))
EOF

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

