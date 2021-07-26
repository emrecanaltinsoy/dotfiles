
"------------------------------------------------------------------------------"
"                                   Sessions                                   "
"------------------------------------------------------------------------------"
" We should specify where we want Startify to keep our sessions
let g:startify_session_dir = '~/.config/nvim/session'

"------------------------------------------------------------------------------"
"                                 Stratify List                                "
"------------------------------------------------------------------------------"
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

"------------------------------------------------------------------------------"
"                                   Bookmarks                                  "
"------------------------------------------------------------------------------"
let g:startify_bookmarks = [
            \ { 'c': '~/.config/i3/config' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Blog',
            \ '~/Code',
            \ '~/Pics',
            \ ]

"------------------------------------------------------------------------------"
"                                 Configuration                                "
"------------------------------------------------------------------------------"
" You can automatically restart a session like this
let g:startify_session_autoload = 1

" Let Startify take care of buffers
let g:startify_session_delete_buffers = 1

" Similar to Vim-rooter
let g:startify_change_to_vcs_root = 1

" If you want Unicode
let g:startify_fortune_use_unicode = 1

" Automatically Update Sessions
let g:startify_session_persistence = 1

" Get rid of empy buffer and quit
" let g:startify_enable_special = 0

"------------------------------------------------------------------------------"
"                                 Custom Header                                "
"------------------------------------------------------------------------------"
let g:startify_custom_header = [
        \ '   _  __     _         __  ___         __     ___ ',
        \ '  / |/ /  __(_)_ _    /  |/  /__ _____/ /    |_  |',
        \ ' /    / |/ / /  ` \  / /|_/ / _ `/ __/ _ \  / __/ ',
        \ '/_/|_/|___/_/_/_/_/ /_/  /_/\_,_/\__/_//_/ /____/ ',
        \]
