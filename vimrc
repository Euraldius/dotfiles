set nocompatible

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
filetype plugin indent on

let mapleader = " "

set autoindent
set autowrite
set backspace=2
set background=dark
set colorcolumn=+1
set cursorline
set expandtab
set history=50
set incsearch
set laststatus=2
set list listchars=tab:»·,trail:·
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set number
set numberwidth=5
set rnu
set ruler
set scrolloff=5
set shiftround
set shiftwidth=2
set showcmd
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set t_Co=256
set textwidth=80

nmap <leader>y :! printf % \| pbcopy<cr><cr>

nnoremap <leader><leader> <c-^>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>w :%s/\s\+$//g<cr>''
nnoremap - :Ex<cr>
nnoremap <leader>eh :Vexplore<cr>
nnoremap <leader>ej :Hexplore<cr>
nnoremap <leader>ek :Hexplore!<cr>
nnoremap <leader>el :Vexplore!<cr>
nnoremap <leader>= <C-w>=
nnoremap <leader>a :Ag! -i

colorscheme Tomorrow-Night

let g:jsx_ext_required = 0
let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
let g:ale_python_flake8_options = '-m flake8'

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

set wildmode=list:longest,list:full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
