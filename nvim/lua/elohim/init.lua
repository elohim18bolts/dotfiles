require("elohim.packer")
require("elohim.remap")
-- require("elohim.remap")
-- Show line numbers
--vim.cmd [[set nu rnu]]
--vim.cmd [[set clipboard="unnamedplus"]]
--vim.cmd [[set cursorline]]
--vim.cmd [[set scrolloff=15]]
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


vim.cmd('autocmd BufRead,BufNewFile user-data set filetype=yaml')
