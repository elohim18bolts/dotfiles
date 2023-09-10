vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>fs", ":w<CR>")
vim.keymap.set("n", "<leader>cc", function()
	require('elohim.runc').runc()
end)
vim.keymap.set('n', '<leader>af', function()
	vim.cmd('ALEFix\nwrite!')
	print("ALE fixed document")
end
)
