require("which-key").setup {
    plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    window = {
        border = "shadow", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 10, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
}

local cur_dir = vim.cmd('pwd')

local wk = require("which-key")

visual_mod_opt = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

visual_mod_keys = {
    ["/"] = { ":CommentToggle<CR>", "Comment" },
}

normal_mod_opt = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

normal_mod_keys = {
    ["/"] = { ":CommentToggle<CR>", "Comment" },
    [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
    e = { ":NvimTreeToggle<CR>", "File Explorer"},
    h = { '<cmd>let @/=""<CR>', "No Highlight" },
    -- g = {
    --     name = "Git",
    --     j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    --     k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    --     l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    --     p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    --     r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    --     R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    --     s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    --     u = {
    --         "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    --         "Undo Stage Hunk",
    --     },
    --     o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    --     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    --     c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    --     C = {
    --         "<cmd>Telescope git_bcommits<cr>",
    --         "Checkout commit(for current file)",
    --     },
    -- },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        r = { "<cmd>lua require('utils').reload_lv_config()<cr>", "Reload" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    b = {
        name = "Buffers",
        p = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
        f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
        e = {
            "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
            "Close other buffers",
        },
        n = { "<cmd>enew<CR>", "Lazygit" },
        l = { "<cmd>BufferLineCloseLeft<cr>", "Close buffers on the left" },
        r = {
            "<cmd>BufferLineCloseRight<cr>",
            "Close buffers on the right",
        },
        D = {
            "<cmd>BufferLineSortByDirectory<cr>",
            "Sort buffers by directory",
        },
        L = {
            "<cmd>BufferLineSortByExtension<cr>",
            "Sort buffers by language",
        },
    },
    d = { ":lua require'config.telescope'.search_dotfiles()<CR>", "Dot Files"},
    s = {
        name = "Search",
        -- f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        f = { ':lua require"telescope.builtin".find_files({ hidden = true, follow = true })<CR>', "Find Files" },
        -- d = { "<cmd>Telescope file_browser<cr>", "File Browser" },
        d = { ':lua require"telescope.builtin".file_browser({ hidden = true, follow = true })<CR>', "File Browser" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        m = { "<cmd>Telescope media_files<cr>", "Media Files" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        p = {
            "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
            "Colorscheme with Preview",
        },
    },
    -- t = {
    --     name = "Test",
    --     n = { ":TestNearest<CR>", "Test Nearest"},
    --     f = { ":TestFile<CR>", "Test File"},
    --     s = { ":TestSuite<CR>", "Test Suite"},
    --     l = { ":TestLast<CR>", "Test Last"},
    --     v = { ":TestVisit<CR>", "Test Visit"},
    -- },
    t = {
        name = "Terminal",
        g = { "<cmd>lua _lazygit_toggle()<CR>", "Lazygit" },
        d = { "<cmd>lua _lazydocker_toggle()<CR>", "Lazydocker" },
        h = { ":ToggleTerm size=15 direction=horizontal dir=" .. cur_dir .. "<CR>", "Horizontal" },
        v = { ":ToggleTerm size=100 direction=vertical dir=" .. cur_dir .. "<CR>", "Vertical" },
        f = { ":ToggleTerm direction=float dir=" .. cur_dir .. "<CR>", "Float" },
    },
    w = {
        name = "Window",
        h = { "<C-W>s", "Horizontal Split"},
        v = { "<C-W>v", "Vertical Split"},
        s = { "<cmd>w!<CR>", "Save" },
        q = { "<cmd>q!<CR>", "Quit" },
        c = { "<cmd>bp | bd #<CR>", "Close Buffer" },
    },

    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Document Diagnostics",
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics",
        },
        -- f = { "<cmd>silent FormatWrite<cr>", "Format" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = {
            "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
            "Next Diagnostic",
        },
        k = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
            "Prev Diagnostic",
        },
        l = { "<cmd>silent lua require('lint').try_lint()<cr>", "Lint" },
        q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
    },
}

wk.register(visual_mod_keys, visual_mod_opt)
wk.register(normal_mod_keys, normal_mod_opt)

