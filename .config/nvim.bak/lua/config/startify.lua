local g = vim.g
local fn = vim.fn

g.startify_lists = {
    { type = 'sessions', header = {' Sessions'}                         }, 
    { type = 'files', header = {' Files'}                               }, 
    { type = 'dir', header = {' Current Directory ' .. fn.getcwd()}     }, 
    { type = 'bookmarks', header = {' Bookmarks'}                       }, 
    { type = 'commands', header = {' Commands'}                         }
}

g.startify_bookmarks = {
    { t = '~/.config/qtile/config.py'     },
    { i = '~/.config/nvim/init.lua'       }
}

-- We should specify where we want Startify to keep our sessions
g.startify_session_dir = '~/.config/nvim/session'

-- You can automatically restart a session like this
g.startify_session_autoload = 1

-- Let Startify take care of buffers
g.startify_session_delete_buffers = 1

-- If you want Unicode
g.startify_fortune_use_unicode = 1

-- Automatically Update Sessions
g.startify_session_persistence = 1

-- Get rid of empy buffer and quit
g.startify_enable_special = 1

-- Number of files to show
g.startify_files_number = 10

-- Change directory to opened file directory
g.startify_change_to_dir = 1

g.startify_custom_header = 'startify#pad(startify#fortune#boxed())'
