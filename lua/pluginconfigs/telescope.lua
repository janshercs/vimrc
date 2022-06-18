local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    mappings = {
      i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<esc>"] = actions.close,
      },
    },
  }
}

require('telescope').load_extension('fzf')
