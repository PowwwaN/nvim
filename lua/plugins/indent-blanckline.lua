return {
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			cursor_color = "#71b7ff",
			normal_bg = "#0a0c10",
			legacy_computing_symbols_support = false,
		},
		cond = not vim.g.neovide,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enable = true,
		event = "BufEnter",
		-- main = "ibl",
		-- opts = {},
		config = function()
			require("ibl").setup({
				scope = {
					enabled = false,
					show_start = false,
					show_end = false,
				},
				indent = {
					char = "│",
					tab_char = "│",
				},
				exclude = {
					filetypes = {
						"Trouble",
						"alpha",
						"dashboard",
						"help",
						"lazy",
						"mason",
						"neo-tree",
						"notify",
						"snacks_dashboard",
						"snacks_notif",
						"snacks_terminal",
						"snacks_win",
						"toggleterm",
						"trouble",
					},
				},
			})
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = "BufEnter",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"Trouble",
					"alpha",
					"dashboard",
					"fzf",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"notify",
					"snacks_dashboard",
					"snacks_notif",
					"snacks_terminal",
					"snacks_win",
					"toggleterm",
					"trouble",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,

		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
			})
		end,
	},
}
