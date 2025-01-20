require 'telescope'.setup {
  defaults = {
    layout_config = {
      prompt_position = "top",
      width = 1.0,
    },
    layout_strategy = "flex",
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      previewer = false,
    },
    live_grep = {
      theme = "dropdown",
      previewer = true,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
    },
    help_tags = {
      theme = "dropdown",
      previewer = false,
    },
    treesitter = {
      theme = "ivy",
      previewer = false,
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})
