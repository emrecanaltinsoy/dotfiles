" set leader key
" let g:mapleader = "\<Space>"
lua require'keybindings'

"let g:CommentFrame_SkipDefaultMappings = v:true

"let g:NERDCreateDefaultMappings = 0

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

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
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


" Better window navigation 
nnoremap o o<ESC>D
nnoremap O O<ESC>D

" Better tabbing
vnoremap < <gv
vnoremap > >gv

