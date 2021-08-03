local g = vim.g

g.nvim_tree_ignore = {'.git', 'node_modules', '.gitconfig', '.cache'}
g.nvim_tree_side = 'left'
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 10
}
g.nvim_tree_follow = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_resize = 1
g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" }

g.nvim_tree_icons= {
    default = "",
    symlink = "",
    git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
    },
}
