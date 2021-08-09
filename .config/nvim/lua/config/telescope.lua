local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    -- mappings = {
    --   i = {
    --     ["<esc>"] = actions.close
    --   },
    -- },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "🔍 ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
        height = 0.8,
        width = 0.8,
        prompt_position = "bottom",
        horizontal = {
            mirror = false,
        },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {".git", "node_modules"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = true,
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {"shorten"},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
    media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = {"png", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)   rg
    },
  },
}

require('telescope').load_extension('media_files')

local M = {}

-- local path_display = function(opts, path)
--           local tail = require("telescope.utils").path_tail(path)
--           return string.format("%s (%s)", tail, path)
--       end
-- 
-- local tail = require("telescope.utils").path_tail('~/.config/nvim/linked_dotfiles')

M.search_dotfiles = function()
    vim.cmd(':silent ! $HOME/.config/nvim/copy_dotfiles/copy_dotfiles.sh')
    require"telescope.builtin".find_files({
        search_dirs = { '~/.config/nvim/linked_dotfiles' },
        prompt_title = "< Dot Files >",
        follow  = true,
        hidden = true,
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
        path_display = {"shorten"},
        layout_config = {
            height = 0.8,
            width = 0.5,
            mirror = true,
        },
    })
end

return M
