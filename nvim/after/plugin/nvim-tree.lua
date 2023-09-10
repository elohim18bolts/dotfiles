local icons = {}

local data = {
	kind = {
		Class = "󰠱",
		Color = "󰏘",
		Constant = "󰏿",
		Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "󰇽",
		File = "󰈙",
		Folder = "󰉋",
		Fragment = "",
		Function = "󰊕",
		Interface = "",
		Implementation = "",
		Keyword = "󰌋",
		Method = "󰆧",
		Module = "",
		Namespace = "󰌗",
		Number = "",
		Operator = "󰆕",
		Package = "",
		Property = "󰜢",
		Reference = "",
		Snippet = "",
		Struct = "",
		Text = "󰉿",
		TypeParameter = "󰅲",
		Undefined = "",
		Unit = "",
		Value = "󰎠",
		Variable = "",
		-- ccls-specific icons.
		TypeAlias = "",
		Parameter = "",
		StaticMethod = "",
		Macro = "",
	},
	type = {
		Array = "󰅪",
		Boolean = "",
		Null = "󰟢",
		Number = "",
		Object = "󰅩",
		String = "󰉿",
	},
	documents = {
		Default = "",
		File = "",
		Files = "",
		FileTree = "󰙅",
		Import = "",
		Symlink = "",
	},
	git = {
		Add = "",
		Branch = "",
		Diff = "",
		Git = "󰊢",
		Ignore = "",
		Mod = "M",
		Mod_alt = "",
		Remove = "",
		Rename = "",
		Repo = "",
		Unmerged = "󰘬",
		Untracked = "󰞋",
		Unstaged = "",
		Staged = "",
		Conflict = "",
	},
	ui = {
		Accepted = "",
		ArrowClosed = "",
		ArrowOpen = "",
		BigCircle = "",
		BigUnfilledCircle = "",
		BookMark = "󰃃",
		Bug = "",
		Calendar = "",
		Check = "󰄳",
		ChevronRight = "",
		Circle = "",
		Close = "󰅖",
		Close_alt = "",
		CloudDownload = "",
		Comment = "󰅺",
		CodeAction = "󰌵",
		Dashboard = "",
		Emoji = "󰱫",
		EmptyFolder = "",
		EmptyFolderOpen = "",
		File = "󰈤",
		Fire = "",
		Folder = "",
		FolderOpen = "",
		FolderWithHeart = "󱃪",
		Gear = "",
		History = "󰄉",
		Incoming = "󰏷",
		Indicator = "",
		Keyboard = "",
		Left = "",
		List = "",
		Square = "",
		SymlinkFolder = "",
		Lock = "󰍁",
		Modified = "✥",
		Modified_alt = "",
		NewFile = "",
		Newspaper = "",
		Note = "󰍨",
		Outgoing = "󰏻",
		Package = "",
		Pencil = "󰏫",
		Perf = "󰅒",
		Play = "",
		Project = "",
		Right = "",
		RootFolderOpened = "",
		Search = "󰍉",
		Separator = "",
		DoubleSeparator = "󰄾",
		SignIn = "",
		SignOut = "",
		Sort = "",
		Spell = "󰓆",
		Symlink = "",
		Tab = "",
		Table = "",
		Telescope = "",
	},
	diagnostics = {
		Error = "",
		Warning = "",
		Information = "",
		Question = "",
		Hint = "󰌵",
		-- Holo version
		Error_alt = "󰅚",
		Warning_alt = "󰀪",
		Information_alt = "",
		Question_alt = "",
		Hint_alt = "󰌶",
	},
	misc = {
		Campass = "󰀹",
		Code = "",
		Gavel = "",
		Glass = "󰂖",
		NoActiveLsp = "󱚧",
		PyEnv = "󰢩",
		Squirrel = "",
		Tag = "",
		Tree = "",
		Watch = "",
		Lego = "",
		LspAvailable = "󱜙",
		Vbar = "│",
		Add = "+",
		Added = "",
		Ghost = "󰊠",
		ManUp = "",
		Vim = "",
	},
	cmp = {
		Codeium = "",
		TabNine = "",
		Copilot = "",
		Copilot_alt = "",
		-- Add source-specific icons here
		buffer = "",
		cmp_tabnine = "",
		codeium = "",
		copilot = "",
		copilot_alt = "",
		latex_symbols = "",
		luasnip = "󰃐",
		nvim_lsp = "",
		nvim_lua = "",
		orgmode = "",
		path = "",
		spell = "󰓆",
		tmux = "",
		treesitter = "",
		undefined = "",
	},
	dap = {
		Breakpoint = "󰝥",
		BreakpointCondition = "󰟃",
		BreakpointRejected = "",
		LogPoint = "",
		Pause = "",
		Play = "",
		RunLast = "↻",
		StepBack = "",
		StepInto = "󰆹",
		StepOut = "󰆸",
		StepOver = "󰆷",
		Stopped = "",
		Terminate = "󰝤",
	},
}

---Get a specific icon set.
---@param category "kind"|"type"|"documents"|"git"|"ui"|"diagnostics"|"misc"|"cmp"|"dap"
---@param add_space? boolean @Add trailing space after the icon.
function get(category, add_space)
	if add_space then
		return setmetatable({}, {
			__index = function(_, key)
				return data[category][key] .. " "
			end,
		})
	else
		return data[category]
	end
end

local icons = {
	diagnostics = get("diagnostics"),
	documents = get("documents"),
	git = get("git"),
	ui = get("ui"),
}


require('nvim-tree').setup({
	disable_netrw = false,
	hijack_netrw = true,
	renderer = {
		add_trailing = false,
		group_empty = true,
		highlight_git = true,
		full_name = false,
		highlight_opened_files = "none",
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
		symlink_destination = true,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
		root_folder_label = ":.:s?.*?/..?",
		icons = {
			webdev_colors = true,
			git_placement = "after",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			padding = " ",
			symlink_arrow = " 󰁔 ",
			glyphs = {
				default = icons.documents.Default, --
				symlink = icons.documents.Symlink, --
				bookmark = icons.ui.Bookmark,
				git = {
					unstaged = icons.git.Mod_alt,
					staged = icons.git.Add, --󰄬
					unmerged = icons.git.Unmerged,
					renamed = icons.git.Rename, --󰁔
					untracked = icons.git.Untracked, -- "󰞋"
					deleted = icons.git.Remove, --
					ignored = icons.git.Ignore, --◌
				},
				folder = {
					arrow_open = icons.ui.ArrowOpen,
					arrow_closed = icons.ui.ArrowClosed,
					-- arrow_open = "",
					-- arrow_closed = "",
					default = icons.ui.Folder,
					open = icons.ui.FolderOpen,
					empty = icons.ui.EmptyFolder,
					empty_open = icons.ui.EmptyFolderOpen,
					symlink = icons.ui.SymlinkFolder,
					symlink_open = icons.ui.FolderOpen,
				},
			},
		},
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = true,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},

})
