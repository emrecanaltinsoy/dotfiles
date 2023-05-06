---[[
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set iskeyword+=-")
vim.cmd("set formatoptions-=cro")
vim.cmd("set path+=**")
--]]

vim.opt.showmode=false
vim.opt.ruler=false                               -- Show the cursor position all the time
vim.opt.hidden=true                               -- Required to keep multiple buffers open multiple buffers

vim.opt.wildmenu=true					        -- Display all matches when tab complete.
vim.opt.incsearch=true                           -- Incremental search
vim.opt.wrap=false                              -- Display long lines as just one line
vim.opt.encoding="UTF-8"                     -- The encoding displayed
vim.opt.fileencoding="UTF-8"                  -- The encoding written to file
vim.opt.pumheight=10                        -- Makes popup menu smaller
vim.opt.cmdheight=2                         -- More space for displaying messages

vim.opt.mouse="a"                             -- Enable your mouse
vim.opt.conceallevel=0                      -- So that I can see `` in markdown files
vim.opt.updatetime=200                      -- Faster completion
vim.opt.timeoutlen=200                      -- By default timeoutlen is 1000 ms
vim.opt.clipboard="unnamedplus"               -- Copy paste between vim and everything else
vim.opt.ignorecase=true                          -- Ignore case sensitivity for commands
vim.opt.smartcase=true
vim.opt.swapfile=false
vim.opt.shell="/usr/bin/fish"

vim.opt.shiftwidth=4                        -- Change the number of space characters inserted for indentation
vim.opt.tabstop=4                           -- Insert 2 spaces for a tab
vim.opt.softtabstop=4                           -- Insert 2 spaces for a tab
vim.opt.smarttab=true                            -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.expandtab=true                           -- Converts tabs to spaces
vim.opt.smartindent=true                         -- Makes indenting smart
vim.opt.autoindent=true                          -- Good auto indent

vim.opt.cursorline=true                          -- Enable highlighting of the current line
vim.opt.relativenumber=true               -- Line numbers
vim.opt.number=true
vim.opt.splitbelow=true                          -- Horizontal splits will automatically be below
vim.opt.splitright=true                          -- Vertical splits will automatically be to the right
vim.o.backup=false
vim.o.writebackup=false

vim.opt.autochdir=true                          -- Your working directory will always be the same as your working directory

