" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 1

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'    , 'comment selected' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'         , 'explorer' ]
let g:which_key_map['h'] = [ '<C-W>s'                       , 'split below']
let g:which_key_map['v'] = [ '<C-W>v'                       , 'split right']
" let g:which_key_map['r'] = [ ':RnvimrToggle'                , 'ranger' ]
" let g:which_key_map['f'] = [ ':Files'                       , 'files in directory' ]
" let g:which_key_map['g'] = [ ':Rg'                          , 'search text' ]
" let g:which_key_map['n'] = [ ':NERDTreeToggle'              , 'ToggleNERDTree' ]
" let g:which_key_map['t'] = [ ':Tags'                        , 'Tags' ]
" let g:which_key_map['m'] = [ ':Marks'                       , 'Marks' ]
" let g:which_key_map['b'] = [ ':Buffers'                     , 'Buffers' ]
let g:which_key_map['s'] = [ ':Startify'                    , 'start screen' ]
" Symbol renaming for python.
let g:which_key_map['<F2>'] = [ '<Plug>(coc-rename)'        , 'Rename' ]
" Close the current buffer and move to the previous one
let g:which_key_map['q'] = [ ':bp | bd #'                   , 'Close Buffer' ]

let g:which_key_map['f'] = [ ':Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍'  , 'Find Files' ]

" nnoremap <Leader>o o<Esc>^Da
" nnoremap <Leader>O O<Esc>^Da

"------------------------------------------------------------------------------"
"                                      Coc                                     "
"------------------------------------------------------------------------------"
let g:which_key_map.c = {
      \ 'name' : '+Coc'  ,
      \ 'a' : ['<Plug>(coc-codeaction-selected)'            , 'CodeAction Selected' ] , 
      \ 'd' : [':CocList diagnostics'                       , 'Diagnostic' ] , 
      \ 'e' : [':CocList extensions'                        , 'Extensions' ] ,
      \ 'c' : [':CocList commands'                          , 'Commands' ] , 
      \ 'o' : [':CocList outline'                           , 'Outline' ] , 
      \ 's' : [':CocList -I symbols'                        , 'Symbols' ] , 
      \ 'j' : [':CocNext'                                   , 'CocNext' ] , 
      \ 'k' : [':CocPrev'                                   , 'CocPrev' ] , 
      \ 'p' : [':CocResume'                                 , 'CocResume' ] , 
      \ 'f' : ['<Plug>(coc-format-selected)'                , 'Format Selected' ] , 
      \ }

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

"------------------------------------------------------------------------------"
"                                  Switch Tabs                                 "
"------------------------------------------------------------------------------"
" Go to tab by number
" let g:which_key_map.b = {
"       \ 'name' : '+Buffers'  ,
"       \ '1' : ['1gt'                      , 'Buffer1' ] , 
"       \ '2' : ['2gt'                      , 'Buffer2' ] ,
"       \ '3' : ['3gt'                      , 'Buffer3' ] , 
"       \ '4' : ['4gt'                      , 'Buffer4' ] ,
"       \ '5' : ['5gt'                      ,'Buffer5' ] , 
"       \ '6' : ['6gt'                      , 'Buffer6' ] ,
"       \ '7' : ['7gt'                      , 'Buffer7' ] , 
"       \ '8' : ['8gt'                      , 'Buffer8' ] ,
"       \ '9' : ['9gt'                      , 'Bufffer9' ] , 
"       \ '0' : [':tablast<cr>'             , 'Last Buffer' ] , 
"       \ 'q' : [':bp | bd #'       , 'Close Buffer' ] , 
"       \ 'b' : [':Buffers'                 , 'Buffers' ] , 
"       \ }

" S is for search
"let g:which_key_map.S = {
      "\ 'name' : '+search' ,
      "\ '/' : [':History/'     , 'history'],
      "\ ';' : [':Commands'     , 'commands'],
      "\ 'a' : [':Ag'           , 'text Ag'],
      "\ 'b' : [':BLines'       , 'current buffer'],
      "\ 'B' : [':Buffers'      , 'open buffers'],
      "\ 'c' : [':Commits'      , 'commits'],
      "\ 'C' : [':BCommits'     , 'buffer commits'],
      "\ 'f' : [':Files'        , 'files'],
      "\ 'g' : [':GFiles'       , 'git files'],
      "\ 'G' : [':GFiles?'      , 'modified git files'],
      "\ 'h' : [':History'      , 'file history'],
      "\ 'H' : [':History:'     , 'command history'],
      "\ 'l' : [':Lines'        , 'lines'] ,
      "\ 'm' : [':Marks'        , 'marks'] ,
      "\ 'M' : [':Maps'         , 'normal maps'] ,
      "\ 'p' : [':Helptags'     , 'help tags'] ,
      "\ 'P' : [':Tags'         , 'project tags'],
      "\ 's' : [':Snippets'     , 'snippets'],
      "\ 'S' : [':Colors'       , 'color schemes'],
      "\ 't' : [':Rg'           , 'text Rg'],
      "\ 'T' : [':BTags'        , 'buffer tags'],
      "\ 'w' : [':Windows'      , 'search windows'],
      "\ 'y' : [':Filetypes'    , 'file types'],
      "\ 'z' : [':FZF'          , 'FZF'],
      "\ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map") 
