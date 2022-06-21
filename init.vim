set nocompatible              " required
filetype off                  " required
set encoding=utf-8

set rtp+=/usr/local/opt/fzf
:lua require('init')

autocmd Filetype lua setlocal tabstop=2
autocmd Filetype lua setlocal shiftwidth=2
"
" Themes and all
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
colo onedark

" vim performance
set updatetime=300

" IDE appearance
set nowrap
set showcmd
"set noshowmode " displays vim-go function signature
set nu
set relativenumber
set signcolumn=number

syntax on

" vim-go settings
hi def goSameId ctermfg=48

" twin word highlighting settings
let g:vim_current_word#enabled = 1
let g:vim_current_word#excluded_filetypes = ['go']
hi CurrentWord ctermfg=213
hi CurrentWordTwins ctermfg=48

" Close buffer after autosuggest
let g:ycm_autoclose_preview_window_after_completion = 1

" For Quickfix/Location list
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

" Keymappings
" Go
"runs all tests in current file
autocmd BufEnter *.go nmap <leader>tt  <Plug>(go-test) 
autocmd BufEnter *.go nmap <leader>t   <Plug>(go-test-func)
autocmd BufEnter *.go nmap <leader>i   <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>c   <Plug>(go-callers)
autocmd BufEnter *.go nmap <leader>r   <Plug>(go-rename)
autocmd BufEnter *.go nmap <leader>ref <Plug>(go-referrers)
autocmd BufEnter *.go nmap <leader>gd  <Plug>(go-def-vertical)
autocmd BufEnter *.go nmap <leader>alt <Plug>(go-alternate-vertical)

autocmd BufEnter *.go nmap <leader>fill :GoFillStruct<CR>
autocmd BufEnter *.go nmap <leader>b    :GoDebugBreakpoint<CR>
autocmd BufEnter *.go nmap <leader>dt   :GoDebugTestFunc<CR>

let g:go_debug_mappings = {
    \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
    \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
    \ '(go-debug-step)': {'key': 's'},
  \}

let g:UltiSnipsExpandTrigger="<C-space>"

" coc autocomplete keymappings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

