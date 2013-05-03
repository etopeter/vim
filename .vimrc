"set runtimepath^=~/.vim/bundle/ctrlp.vim
execute pathogen#infect()
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()


" Let Vundle manage Vundle (required)!

Bundle 'gmarik/vundle'



" My bundles
Bundle 'ervandew/supertab'
" Bundle 'kchmck/vim-coffee-script'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
" Bundle 'wincent/Command-T'
Bundle 'koron/nyancat-vim'

Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on


let mapleader = ","
syntax on
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeToggle<CR>

map <Leader>ev :tabe ~/.vimrc<CR>
map <Leader>sv :source ~/.vimrc<CR>
map <Leader>bi :source ~/.vimrc<CR>:BundleInstall<CR>

map <Leader>cn :e ~/Dropbox/notes/coding-notes.txt<cr>
map <Leader>pn :sp ~/Dropbox/notes/project-notes.txt<cr>

map <Leader>rs :vsp <C-r>#<cr><C-w>w
map <Leader>gs :Gstatus<CR>

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


set ai "Auto indent
set si "Smart indent
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set ruler

    " Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

" Move outside brackets
inoremap <C-r> <C-o>A


map <F5> :setlocal spell! spelllang=en_us<cr>
map <F6> :setlocal spell! spelllang=de<cr>


" ctrlp Plugin set working directory where is .git
let g:ctrlp_working_path_mode = 'ra'



" Highlight curosor under word with delay
" set updatetime=700
" au! CursorMoved * set nohlsearch
" au! CursorHold * set hlsearch | let @/='\<'.expand("<cword>").'\>'
" set hlsearch

" Functions =====
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>rn :call RenameFile()<cr>


" Merge a tab into a split in the previous window
function! MergeTabs()
    if tabpagenr() == 1
        return
    endif
    let bufferName = bufname("%")
    if tabpagenr("$") == tabpagenr()
        close!
    else
        close!
        tabprev
    endif
    split
    execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>
