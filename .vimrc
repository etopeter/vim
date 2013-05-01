"set runtimepath^=~/.vim/bundle/ctrlp.vim
execute pathogen#infect()
let mapleader = ","
syntax on
filetype plugin indent on
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeToggle<CR>

" Color settings
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
"set background=light
colorscheme solarized

filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
      \ if &omnifunc == "" |
      \ setlocal omnifunc=syntaxcomplete#Complete |
      \ endif
      endif

"
" You might also find this useful
" PHP Generated Code Highlights (HTML & SQL)                                              

let php_sql_query=1                                                                                        
let php_htmlInStrings=1


set cindent
set smartindent
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number


map <F5> :setlocal spell! spelllang=en_us<cr>
map <F6> :setlocal spell! spelllang=de<cr>


" ctrlp Plugin set working directory where is .git
let g:ctrlp_working_path_mode = 'ra'
