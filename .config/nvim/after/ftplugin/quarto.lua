vim.opt.conceallevel = 0 -- No hiding special characters

-- keymaps
vim.keymap.set("n", "<leader>qa", ":QuartoActivate", { desc = "quarto activate" })
vim.keymap.set("n", "<leader>qP", ":lua require'quarto'.quartoPreview()<cr>", { desc = "quarto preview" }) -- preview the recently modified file.
vim.keymap.set("n", "<leader>qp", ":QuartoPreview %<cr>", { desc = "quarto preview current file" })
vim.keymap.set("n", "<leader>qc", ":lua require'quarto'.quartoClosePreview()<cr>", { desc = "quarto close" })
vim.keymap.set("n", "<leader>qh", ":QuartoHelp", { desc = "quarto help" })
vim.keymap.set("n", "<leader>qe", ":lua require'otter'.export()<cr>", { desc = "quarto export" })
vim.keymap.set("n", "<leader>qE", ":lua require'otter'.export(true)<cr>", { desc = "quarto export overwrite" })
vim.keymap.set("n", "<leader>qrr", ":QuartoSendAbove<cr>", { desc = "quarto run to cursor" })
vim.keymap.set("n", "<leader>qra", ":QuartoSendAll<cr>", { desc = "quarto run all" })

-- slime config
vim.b.slime_cell_delimiter = "```"

-- wrap text, but by word no character
-- indent the wrappped line
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.showbreak = "|"
