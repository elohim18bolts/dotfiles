require("elohim.packer")
require("elohim.remap")
-- Show line numbers
vim.cmd [[set nu rnu]]
vim.cmd [[set clipboard=unnamedplus]]
vim.cmd('autocmd BufRead,BufNewFile user-data set filetype=yaml')
