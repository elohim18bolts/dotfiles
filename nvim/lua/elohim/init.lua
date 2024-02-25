require("elohim.packer")
require("elohim.remap")
-- require("elohim.remap")
-- Show line numbers
vim.cmd [[set nu rnu]]
vim.cmd [[set clipboard="unnamed, unnamedplus"]]
vim.cmd [[set cursorline]]
vim.cmd [[set scrolloff=8]]
vim.cmd('autocmd BufRead,BufNewFile user-data set filetype=yaml')
