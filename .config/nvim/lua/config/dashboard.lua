vim.g.dashboard_disable_at_vimenter = 0

vim.g.dashboard_custom_header = {
" ⠀⠀⠀⠀⠀⢀⠄⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
" ⠀⠀⠀⢀⠔⡡⢊⢐⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⢆⠢⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
" ⠀⠠⡐⠅⡪⠐⠅⡂⡐⠄⡀⠀⠀⠀⠀⠀⠀⠀⢐⢔⢑⢌⠪⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⡽⣺⣺⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
" ⢌⠪⡘⢌⠢⡑⠅⡂⢂⠅⡂⠄⠀⠀⠀⠀⠀⠀⠰⡐⡱⡐⡑⡌⡪⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠓⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
" ⠢⡑⢌⠢⡃⡢⡁⡂⠅⡂⡂⠅⡂⠀⠀⠀⠀⠀⠨⡢⡑⡌⢆⢪⢨⠀⠀⠀⠀⠀⠀⠀⢠⡄⠀⣀⡤⡤⣤⢤⣀⠀⠀⠀⠀⠀⢀⡠⡤⠤⠤⢤⣀⠀⠀⠀⠀⠀⠀⣀⣤⢤⢤⡤⣄⡀⠀⠀⢶⣲⣲⠄⠀⠀⠀⠀⠀⢠⢶⣲⡒⢐⣖⣖⣖⠀⠀⣖⣖⡦⢀⣔⣖⣞⣖⢦⡀⢀⡤⣖⣖⣗⣖⢦⡀⠀ ",
" ⡑⡌⢆⠕⡌⡲⡐⠨⡐⡐⢄⠑⠄⢅⠀⠀⠀⠀⠨⡢⢱⠨⡊⢆⢪⠀⠀⠀⠀⠀⠀⠀⢸⢆⠎⠁⠀⠀⠀⠀⠙⣵⠀⠀⠀⣰⠓⠁⠀⠀⠀⠀⠈⠳⡄⠀⠀⣰⡝⠁⠀⠀⠀⠀⠈⠫⣦⡀⠘⣞⣞⣗⠀⠀⠀⠀⢀⡯⣟⡞⠀⢐⣗⢗⣗⠀⠀⣗⢗⣯⡻⠚⠈⠚⢪⣟⣖⣗⠯⠃⠑⠑⢯⣻⣺⠄ ",
" ⠔⡅⠥⡱⢨⠢⡁⠡⢂⠌⠄⢅⢑⢄⢑⠀⠀⠀⠨⡊⡆⡣⡱⡡⡱⠀⠀⠀⠀⠀⠀⠀⢸⡃⠀⠀⠀⠀⠀⠀⠀⣳⡃⠀⢰⠏⠀⠀⠀⠀⠀⠀⠀⠀⡯⠀⢰⡳⠀⠀⠀⠀⠀⠀⠀⠀⢱⣣⠀⠘⣞⢾⢥⠀⠀⠀⣮⣻⣺⠀⠀⢐⣗⣟⣞⠀⠀⢾⢽⣺⡂⠀⠀⠀⠀⣗⢷⢽⠀⠀⠀⠀⢸⣺⣺⡅ ",
" ⢪⢘⢌⢪⠢⣑⠂⠀⠀⠅⡅⠕⡐⡐⠄⠕⢄⠀⠨⡊⡆⡣⡊⡆⡕⠀⠀⠀⠀⠀⠀⠀⢸⡅⠀⠀⠀⠀⠀⠀⠀⢼⠆⠀⢸⡋⠙⠉⠋⠋⠋⠋⠋⠉⠙⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠨⣞⠀⠀⠹⡽⣝⡆⠀⣸⣺⣺⠂⠀⠀⢐⣗⢗⣗⠀⠀⡯⣗⢷⠅⠀⠀⠀⠀⡯⣯⣳⠀⠀⠀⠀⢸⣺⡺⡆ ",
" ⡱⢡⠣⡡⡣⡊⠆⠀⠀⠈⢂⠕⡐⠌⢌⠪⡐⢄⠨⡪⡸⡨⡪⡸⡨⠀⠀⠀⠀⠀⠀⠀⢸⠆⠀⠀⠀⠀⠀⠀⠀⢵⡃⠀⢸⡣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣆⠀⠀⠀⠀⠀⠀⠀⠀⢸⢽⠀⠀⠀⢫⢷⢽⢠⣗⣗⠇⠀⠀⠀⢐⣗⣟⣞⠀⠀⢯⢾⢽⠅⠀⠀⠀⠀⣟⣞⣞⠀⠀⠀⠀⢸⢮⢯⠇ ",
" ⡪⡊⢎⢪⢂⢇⡃⠀⠀⠀⠀⠁⡪⠨⡂⢕⠨⡂⢕⢱⢸⢨⢢⢣⢪⠀⠀⠀⠀⠀⠀⠀⢸⡃⠀⠀⠀⠀⠀⠀⠀⢵⡃⠀⠀⠫⣆⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⢳⣂⠀⠀⠀⠀⠀⠀⡠⡯⠃⠀⠀⠀⠈⢯⢯⣳⣳⡓⠀⠀⠀⠀⢐⣗⢗⣗⠀⠀⡯⡯⡯⡃⠀⠀⠀⠀⣗⣗⣗⠀⠀⠀⠀⢸⢽⣝⡇ ",
" ⡪⡪⢪⢊⢎⢲⡀⠀⠀⠀⠀⠀⠈⠢⠪⡐⢅⢊⠢⡑⡕⡱⡑⡕⢕⠀⠀⠀⠀⠀⠀⠀⠸⠅⠀⠀⠀⠀⠀⠀⠀⠵⠃⠀⠀⠀⠉⠫⠖⠦⠦⠲⠲⠋⠀⠀⠀⠀⠑⠓⠖⠤⠤⠲⠎⠋⠀⠀⠀⠀⠀⠀⠈⠗⠳⠓⠀⠀⠀⠀⠀⠐⠗⠟⠞⠀⠀⠯⠯⠯⠃⠀⠀⠀⠀⠗⠗⠷⠀⠀⠀⠀⠸⠳⠳⠃ ",
" ⢪⢪⢪⢪⢪⢢⠃⠀⠀⠀⠀⠀⠀⠈⢌⠢⡑⡐⡱⡑⡜⡸⢸⢸⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
" ⠀⠑⠕⡕⡕⡕⡅⠀⠀⠀⠀⠀⠀⠀⠀⠑⢌⠢⢪⢘⢌⢎⠪⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
" ⠀⠀⠀⠑⢕⢕⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠅⢕⢅⠇⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
" ⠀⠀⠀⠀⠀⠑⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⠃⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",}

vim.g.dashboard_default_executive = "telescope"

local dotfiles = {
   "~/.config/nvim/init.lua",
   "~/.config/qtile/config.py"
}

vim.g.dashboard_custom_section = {
    a = {
        description = { "  New Buffer              SPC-b-n" },
        command = ":enew",
    },
    b = {
        description = { "  Toggle Terminal          Ctrl-t" },
        command = ":ToggleTerm<CR>",
    },
    c = {
        description = { "  Find File               SPC-s-f" },
        command = ":lua require'telescope.builtin'.find_files({ hidden = true, follow = true })", --Telescope find_files
    },
    d = {
        description = { "  File Browser            SPC-s-d" },
        command = ":lua require'telescope.builtin'.file_browser({ hidden = true, follow = true })", --Telescope file_browser
    },
    e = {
        description = { "  Recently Used Files     SPC-s-r" },
        command = "Telescope oldfiles",
    },
    f = {
        description = { "  Find Word               SPC-s-t" },
        command = "Telescope live_grep",
    },
    g = {
        description = { "  Dot Files                 SPC-d" },
        command = ":lua require'config.telescope'.search_dotfiles()",
    },
    h = {
        description = { "  Configuration                  " },
        command = ":e ~/.config/nvim/init.lua",
    },
}

vim.g.dashboard_session_directory = "/home/emrecan/.config/nvim/dashboard_sessions/"

vim.cmd "let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))"

vim.api.nvim_exec(
    [[
        let g:dashboard_custom_footer = ['Loaded '..packages..' plugins ']
    ]],
    false
)
