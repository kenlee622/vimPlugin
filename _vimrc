let $LANG="zh_TW.UTF-8"
set langmenu=zh_tw.utf-8
set encoding=utf8

"reload menu with UTF-8 encoding
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"set guifont=courier_new:h11
set guifont=Droid_Sans_Mono:h14
set backupdir=c:\vim_backup

execute pathogen#infect()

set nocompatible
set ignorecase
set smartcase
"set guifont=Courier\ 10\ Pitch\ 11
set langmenu=none
set incsearch
syntax on
set hlsearch
set browsedir=buffer
set laststatus=2 "Always enable the status line at bottom of window 
"set textwidth=72
"set formatoptions=cqt
set wrapmargin=0
"set cmdheight=2
"lang en
"lang mes en
set hidden
" set fileencoding=utf-8,gb18030
set fileencodings=gb18030,utf-8

set title titlestring=[%F\ %M]

set updatetime=1500

"  Turn off useless toolbar 
"set guioptions-=T 

"  Turn off menu bar (toggle with CTRL+F11) 
"set guioptions-=m 

"  Turn off right-hand scroll-bar (toggle with CTRL+F7) 
"set guioptions-=r 

" CTRL+F11 to toggle the menu bar 
nmap <C-F11> :if &guioptions=~'m' \| set guioptions-=m \| else \| set guioptions+=m \| endif<cr> 

"  CTRL+F7 to toggle the right-hand scroll bar 
nmap <C-F7> :if &guioptions=~'r' \| set guioptions-=r \| else \| set guioptions+=r \| endif<cr> 

"nnoremap <silent> <F6> :call Vm_goto_next_sign()<CR>
"nnoremap <silent> <F7> :call Vm_remove_sign()<CR>
nnoremap <silent> <F9> :call Vm_toggle_sign()<CR>

" Visual searching
vmap g/ y/<C-R>"<CR>
vmap <F3> y/<C-R>"<CR>
vmap * y/<C-R>"<CR>

"set viminfo='10,\"100,:20,%,nc:\\vim\\_viminfo 
"set viminfo='10,\"100,:20,%,nc:/vim/_viminfo 

"CD to the current directory
:autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif 

" source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

filetype plugin indent on
au FileType c setlocal ts=4 sw=4
au FileType cpp setlocal ts=4 sw=4
au FileType objc setlocal ts=4 sw=4
au FileType html setlocal ts=4 sw=4
au FileType htm setlocal ts=4 sw=4
au FileType php setlocal ts=4 sw=4
au FileType todolist setlocal ts=4 sw=4
au FileType javascript setlocal ts=4 sw=4
autocmd BufNewFile,BufRead *.json set ft=javascript

colorscheme desert
"colorscheme molokai

let Tlist_Ctags_Cmd = 'c:\ctags.exe'
let Tlist_Sort_Type = "name"
nnoremap <silent> <F8> :Tlist<CR>
nnoremap <silent> <F7> :TlistUpdate<CR>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 55
let Tlist_Display_Tag_Scope = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1

nmap ,s :source ~/.gvimrc
nmap ,v :e ~/vimfiles/vimrc

" Tip #605: replace a word with the yanked text
nmap <silent> S :let @x=@"<CR>"_diw"xP

nmap ,d :DetectIndent<CR>

autocmd! bufwritepost .vimrc source ~/.vimrc

" Highlight characters after the desired column width '80'
augroup vimrc_autocmds
	"autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
	autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#491919
	autocmd BufEnter * match OverLength /\%80v.*/
augroup END

nnoremap <F10> :setl noai nocin nosi inde=<CR>


let javascript_enable_domhtmlcss = 1

imap <C-CR> <CR><Esc>O

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_max = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|swp|ls)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" set wildignore+=*.s19,*.sm8,*.elf,*.map,*.lkf,*.dep,*.pdb,*.stp,*.stw,*.wdb,*.wed
set wildignore+=*\\Debug\\*,*\Release\\*
set wildignore+=*.dep,*.pdb,*.stp
set wildignore+=*.stw,*.wdb,*.wed


" Macros to swap lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nmap     <F3> <Plug>CtrlSFPrompt

let g:ag_prg="ag"
" let g:ag_working_path_mode="r"

" The Silver Searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


