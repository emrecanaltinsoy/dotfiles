" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

function! s:list_commits()
    let git = 'git -C ~/dotfiles'
    let commits = systemlist(git .' log --oneline | head -n10')
    let git = 'G'. git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction
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
          \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
" \ { 'header': ['   Commits'],        'type': function('s:list_commits') },

"------------------------------------------------------------------------------"
"                                   Bookmarks                                  "
"------------------------------------------------------------------------------"
let g:startify_bookmarks = [
            \ { 't': '~/.config/qtile/config.py' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ ]

"------------------------------------------------------------------------------"
"                                 Configuration                                "
"------------------------------------------------------------------------------"
" You can automatically restart a session like this
let g:startify_session_autoload = 1

" Let Startify take care of buffers
let g:startify_session_delete_buffers = 1

" If you want Unicode
let g:startify_fortune_use_unicode = 1

" Automatically Update Sessions
let g:startify_session_persistence = 1

" Get rid of empy buffer and quit
" let g:startify_enable_special = 0

" Number of files to show
let g:startify_files_number = 10

" Change directory to opened file directory
let g:startify_change_to_dir = 1

"------------------------------------------------------------------------------"
"                                Custom Headers                                "
"------------------------------------------------------------------------------"
let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

" let g:startify_custom_header =
"       \ startify#center(split(system('figlet STARTIFY'), '\n'))

" let g:startify_custom_header = [
"    \  '           __                    __           ___              ',
"    \  '          /\ \__                /\ \__  __  /"___\             ',
"    \  '      ____\ \ ,_\    __     _ __\ \ ,_\/\_\/\ \__/  __  __     ',
"    \  '     /",__\\ \ \/  /"__`\  /\`"__\ \ \/\/\ \ \ ,__\/\ \/\ \    ',
"    \  '    /\__, `\\ \ \_/\ \L\.\_\ \ \/ \ \ \_\ \ \ \ \_/\ \ \_\ \   ',
"    \  '    \/\____/ \ \__\ \__/.\_\\ \_\  \ \__\\ \_\ \_\  \/`____ \  ',
"    \  '     \/___/   \/__/\/__/\/_/ \/_/   \/__/ \/_/\/_/   `/___/> \ ',
"    \  '                                                        /\___/ ',
"    \  '                                                        \/__/  ',
"    \]

" let g:ascii = [
"   \ '        __',
"   \ '.--.--.|__|.--------.',
"   \ '|  |  ||  ||        |',
"   \ ' \___/ |__||__|__|__|',
"   \ ''
"   \]
" let g:startify_custom_header = 'startify#center(g:ascii + startify#fortune#boxed())'
