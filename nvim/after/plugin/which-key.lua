local wk = require('which-key')
wk.register({
	f = {
		name = "file",                               -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		p = { "<cmd>Telescope git_files<cr>", "Find File In Project" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- noremap = false, buffer = 123 }, -- additional options for creating the keymap
		g = { "<cmd>Telescope grep_string<cr>", "Searches for the string under your cursor" },
		G = { "<cmd>Telescope live_grep<cr>", "Search for a string in your current working directory" },
		n = {
			function()
				vim.ui.input({
					prompt = "File Name: ",
				}, function(input)
					if input == "" then return end
					vim.cmd(string.format("e %s", input))
				end
				)
			end, "New File" },
		R = {
			function()
				local bufferName = vim.api.nvim_buf_get_name(0)
				if string.find(string.format("%s", bufferName), "NvimTree") ~= nil then
					require('nvim-tree.api').fs.rename_sub()
					return
				end
				vim.ui.input({
					prompt = "Rename File: ",
				}, function(input)
					vim.cmd(string.format("file %s", input))
				end
				)
			end
			, "Rename File In Place"
		},
		["1"] = "which_key_ignore", -- special label to hide it in the popup
	},
	g = {
		name = "Git",
		g = { "<cmd>Git<cr>", "Git Management" },
		p = { "<cmd>Git push origin<cr>", "Push To Remote Repo" },
	},
	b = {
		name = "Buffer",
		b = { "<cmd>Telescope buffers<cr>", "Show Opened Buffers" },
		s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find In Current Buffer" },

	},


}, { prefix = "<leader>" })
