local M = {}

--M.load_commands = function()
  --local cmd = vim.cmd
    --cmd "syntax enable"
    --cmd "set termguicolors"
    --cmd "set whichwrap+=<,>,[,],h,l"
    --cmd "set iskeyword+=-"
    --cmd "set formatoptions-=cro"
    --cmd "set path+=**"
    --cmd "set t_Co=256"
    --cmd "au! BufWritePost $MYVIMRC source %"
--end
vim.cmd "syntax enable"
vim.cmd "set termguicolors"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set iskeyword+=-"
vim.cmd "set formatoptions-=cro"
vim.cmd "set path+=**"
vim.cmd "set t_Co=256"
vim.cmd "au! BufWritePost $MYVIMRC source %"

vim.opt.hidden=true                              -- Required to keep multiple buffers open multiple buffers
vim.opt.wildmenu=true					        -- Display all matches when tab complete.
vim.opt.incsearch=true                           -- Incremental search
vim.opt.wrap=false                              -- Display long lines as just one line
vim.opt.encoding="UTF-8"                     -- The encoding displayed
vim.opt.pumheight=10                        -- Makes popup menu smaller
vim.opt.fileencoding="UTF-8"                  -- The encoding written to file
vim.opt.ruler=true                               -- Show the cursor position all the time
vim.opt.cmdheight=2                         -- More space for displaying messages
vim.opt.mouse="a"                             -- Enable your mouse
vim.opt.splitbelow=true                          -- Horizontal splits will automatically be below
vim.opt.splitright=true                          -- Vertical splits will automatically be to the right
vim.opt.conceallevel=0                      -- So that I can see `` in markdown files
vim.opt.tabstop=4                           -- Insert 2 spaces for a tab
vim.opt.shiftwidth=4                        -- Change the number of space characters inserted for indentation
vim.opt.smarttab=true                            -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.expandtab=true                           -- Converts tabs to spaces
vim.opt.smartindent=true                         -- Makes indenting smart
vim.opt.autoindent=true                          -- Good auto indent
vim.opt.laststatus=2                        -- Always display the status line
vim.opt.number=true
vim.opt.relativenumber=true               -- Line numbers
vim.opt.cursorline=true                          -- Enable highlighting of the current line
vim.opt.background="dark"                     -- tell vim what the background color looks like
vim.opt.backup=false                           -- This is recommended by coc
vim.opt.writebackup=false                       -- This is recommended by coc
vim.opt.updatetime=300                      -- Faster completion
vim.opt.timeoutlen=500                      -- By default timeoutlen is 1000 ms
vim.opt.clipboard="unnamedplus"               -- Copy paste between vim and everything else
vim.opt.ignorecase=true                          -- Ignore case sensitivity for commands
vim.opt.autochdir=true                          -- Your working directory will always be the same as your working directory
vim.opt.smartcase=true
vim.opt.swapfile=false
vim.opt.shell="/usr/bin/fish"
vim.opt.guifont="Mononoki Nerd Font"  

--vim.g.python_highlight_all = 1


