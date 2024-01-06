-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
	bootstrap_packer = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		packer_install_path,
	})
	print("Installing packer... Close and reopen neovim")
	vim.cmd([[packadd packer.nvim]])
end
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	if bootstrap_packer then
		require("packer").sync()
	end
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use('nvim-lualine/lualine.nvim')
	use('kdheepak/tabline.nvim')
	--use 'freddiehaddad/feline.nvim'
	use {
		'catppuccin/nvim',
		as = "catppuccin",
		config = function()
			vim.cmd('colorscheme catppuccin-macchiato')
		end
	}
	--	use({
	--		'rose-pine/neovim',
	--		as = 'rose-pine',
	--		config = function()
	--			vim.cmd('colorscheme rose-pine-moon')
	--		end
	--	})
	use("neovim/nvim-lspconfig")
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use('ThePrimeagen/harpoon')
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use {
		'w0rp/ale',
		ft = { 'python', 'sh', 'rust', 'lua', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket',
			'vim', 'tex' },
		cmd = 'ALEEnable',
		config = 'vim.cmd[[ALEEnable]]'
	}
	use("windwp/nvim-autopairs")
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip'
		}
	}
	use {
		"pearofducks/ansible-vim",
		--config = function() require('ansible-vim').setup() end

	}
	use 'LnL7/vim-nix'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { { 'nvim-tree/nvim-web-devicons' } },
		config = function()
			vim.opt.termguicolors = true
		end

	}
	use {
		use 'voldikss/vim-floaterm'

	}
	use('nvim-orgmode/orgmode')
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end
	}
	use('lewis6991/gitsigns.nvim')
end)
