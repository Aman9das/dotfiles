require("neo-tree").config.filesystem.filtered_items.hide_dotfiles = false -- neo-tree show dotfiles
vim.keymap.set(
	"n",
	"<leader>sg",
	'<cmd>lua require("telescope.builtin").grep_string({ additional_args = { "--hidden" } })<cr>'
)
vim.keymap.set(
	"n",
	"<leader>sG",
	'<cmd>lua require("telescope.builtin").grep_string({ cwd = vim.fn.expand "%:p:h", additional_args = { "--hidden" } })<cr>'
)
