" Pathogen
execute pathogen#infect()

" Vundle 
if has("unix")
set rtp+=~/.vim/bundle/vundle/
elseif has("win32")
set rtp+=c:\opt\vim\vim73\bundle\vundle
endif

call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

"**********************************************
" BUNDLES
"**********************************************
Bundle 'ervandew/supertab'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'koron/nyancat-vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'xolox/vim-easytags'
Bundle 'kien/ctrlp.vim'

"Newly added
Bundle 'taglist.vim'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'scrooloose/syntastic'
"Bundle 'skammer/vim-css-color'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'maxbrunsfeld/vim-yankstack'
"Bundle 'vim-scripts/ShowMarks'
Bundle 'vim-scripts/upAndDown'
Bundle 'xolox/vim-notes'
Bundle 'xoria256.vim'
Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'xolox/vim-shell'

filetype plugin indent on

let mapleader = ","
syntax on

"Autoupdate files from the outside
set autoread
" pwd should be this file, not some other madness
set autochdir

" Save with ctrl s
:inoremap <c-s> <c-o>:Update<CR><CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <Leader>n :NERDTreeToggle<CR>


map <Leader>rn :RecentNotes<CR>
map <Leader>cn :tabedit note:coding-notes<cr>
" map <Leader>pn :sp ~/Dropbox/notes/project-notes.txt<cr>
map <Leader>pn :split note:project-notes<CR>

map <Leader>rs :vsp <C-r>#<cr><C-w>w
map <Leader>gs :Gstatus<CR>

map <Leader>tg :TlistToggle<CR>
"map <Leader>bt :TMiniBufExplorer<CR>


if has("unix")
map <Leader>ev :tabe ~/.vimrc<CR>
map <Leader>sv :source ~/.vimrc<CR>
map <Leader>bi :source ~/.vimrc<CR>:BundleInstall<CR>
elseif has("win32")
map <Leader>ev :tabe c:\opt\vim\.vimrc<CR>
map <Leader>sv :source c:\opt\vim\.vimrc<CR>
map <Leader>bi :source c:\opt\vim\.vimrc<CR>:BundleInstall<CR>
map <Leader>es :tabe C:\Users\strzyzewskip\AppData\Local\Programs\Git\etc\ssh\ssh_config<CR>
endif

" Color Scheme
" colorscheme xoria256

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

" No Bells
set noeb vb t_vb=

"mapr ctrl-tab to shift-tab
:let g:UltiSnipsListSnippets="<c-s-tab>"

" ===================================
" PLUGIN SETTINGS
" Notes
:let g:notes_directory = '~/Dropbox/notes'
:let g:notes_suffix = '.txt'
:let g:notes_title_sync = 'no'

let g:snips_author = 'Piotr Strzyzewski'
g:UltiSnipsExpandTrigger <tab>
g:UltiSnipsListSnippets <c-tab>
let g:UltiSnipsUsePythonVersion = 2

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

" Rainbor parenthesis
map <Leader>rp :RainbowParenthesesToggle<CR>
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ctags
let g:easytags_updatetime_min=10000


"
" Make the command-line completion better
set wildmenu

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

" Move outside brackets
inoremap <C-r> <C-o>A


map <F5> :setlocal spell! spelllang=en_us<cr>
map <F6> :setlocal spell! spelllang=de<cr>


" ctrlp Plugin set working directory where is .git
let g:ctrlp_working_path_mode = 'ra'
" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1 " Put errors on left side
let g:syntastic_quiet_warnings=1 " Only errors, not warnings please
let g:syntastic_auto_loc_list=2 " Only show errors when I ask
let g:syntastic_disabled_filetypes = ['html', 'js']
let g:syntastic_php_checkers=['php','phpmd']
", 'phpcs', 'phpmd']

" Syntastic styles
if has('unix')
let g:syntastic_error_symbol='★'
let g:syntastic_style_error_symbol='>'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='>'
else
let g:syntastic_error_symbol='!'
let g:syntastic_style_error_symbol='>'
let g:syntastic_warning_symbol='.'
let g:syntastic_style_warning_symbol='>'
endif




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
map <Leader>mb :call RenameFile()<cr>


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



" Titlecase A Line Or Selection
vnoremap \<F7> :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr>
nmap \<F7> V\<F7>
imap \<F7> <esc>\<F7>i 

:nnoremap + /\$\w\+_<CR>
:nnoremap _ f_x~

