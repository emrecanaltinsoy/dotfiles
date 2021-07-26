" set leader key
let g:mapleader = "\<Space>"

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
"------------------------------------------------------------------------------"
"                                Window Resizing                               "
"------------------------------------------------------------------------------"
" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>  :resize -2<CR>
nnoremap <silent> <M-k>  :resize +2<CR>
nnoremap <silent> <M-h>  :vertical resize -2<CR>
nnoremap <silent> <M-l>  :vertical resize +2<CR>

"------------------------------------------------------------------------------"
"                                  Switch Tabs                                 "
"------------------------------------------------------------------------------"
" Go to tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
"------------------------------------------------------------------------------"
"                               ESC Alternatives                               "
"------------------------------------------------------------------------------"
" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
" imap ii <Esc>
" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" nnoremap <Leader>o o<Esc>^Da
" nnoremap <Leader>O O<Esc>^Da

" Comment lines with ++
nnoremap ++ :Commentary<CR>
vnoremap ++ :Commentary<CR>

