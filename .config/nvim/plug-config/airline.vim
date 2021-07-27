" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

let g:airline_powerline_fonts = 1

" Do not draw separators for empty sections (only for the active window)
let g:airline_skip_empty_sections = 1

" enable tabline
let g:airline#extensions#tabline#enabled = 1

" add numbers for buffers
let g:airline#extensions#tabline#buffer_idx_mode = 1

" hide parent directory names for buffers
let g:airline#extensions#tabline#fnamemod = ':t' 

" add number for tab names
let g:airline#extensions#tabline#tab_nr_type= 1

" enable and set tab/buffer labels
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
let g:airline#extensions#tabline#tabs_label = 'TABS'



