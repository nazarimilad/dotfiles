if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let g:plugged_home = '~/.vim/plugged'

" Plugins List
call plug#begin(g:plugged_home)

  " UI related
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'arcticicestudio/nord-vim'
  " Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'fneu/breezy'

  " Better Visual Guide
  Plug 'Yggdroot/indentLine'

  " syntax check
  Plug 'w0rp/ale'

  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'

  " Formater
  Plug 'Chiel92/vim-autoformat'

  " LateX
  Plug 'lervag/vimtex'
  Plug 'Konfekt/FastFold'
  Plug 'matze/vim-tex-fold'  

call plug#end()

filetype plugin indent on

" Configurations Part

" UI configuration
syntax on
syntax enable

" colorscheme
" colorscheme nord
" colorscheme dracula
set background=light
set termguicolors " if you want to run vim in a terminal
colorscheme breezy

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif

if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

set number
set relativenumber

set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" vim-autoformat
noremap <F3> :Autoformat<CR>

" NCM2
augroup NCM2
  autocmd!

  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect

  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

  " uncomment this block if you use vimtex for LaTex
  autocmd Filetype tex call ncm2#register_source({
             \ 'name': 'vimtex',
             \ 'priority': 8,
             \ 'scope': ['tex'],
             \ 'mark': 'tex',
             \ 'word_pattern': '\w+',
             \ 'complete_pattern': g:vimtex#re#ncm2,
             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
             \ })
augroup END

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Airline
let g:airline_theme='breezy'
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_enabled =1
let g:latex_fold_preamble = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'


command! Latexc VimtexCompile
let g:vimtex_quickfix_enabled = 0

augroup vimtex_event_1
    au!
    au User VimtexEventQuit     call vimtex#compiler#clean(0)
    au User VimtexEventInitPost call vimtex#compiler#compile()
augroup END

" Close viewers on quit
function! CloseViewers()
if executable('xdotool') && exists('b:vimtex')
    \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
  call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
endif
endfunction

augroup vimtex_event_2
au!
au User VimtexEventQuit call CloseViewers()
augroup END

let g:vimtex_complete_recursive_bib = 1
let g:vimtex_compiler_progname = 'nvr'

" Forward search
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
