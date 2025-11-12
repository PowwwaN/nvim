function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				-- disable_background = true,
				-- styles = {
				--     italic = false,
				-- },
			})

			-- ColorMyPencils()
		end,
	},
	{
		"rktjmp/hotpot.nvim",
		config = function()
			require("hotpot").setup({})
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		dependencies = { "rktjmp/hotpot.nvim" },
		config = function()
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			ColorMyPencils("oxocarbon")
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				-- Enable transparent mode
				-- vim.g.tokyonight_transparent = true
			})
			-- ColorMyPencils("tokyonight")
		end,
	},
	{
		"luisiacc/gruvbox-baby",
		lazy = false,
		priority = 1000,
		config = function()
			-- Enable transparent mode
			vim.g.gruvbox_baby_transparent_mode = 1
			-- vim.cmd.colorscheme("gruvbox-baby")
			--
			-- ColorMyPencils("gruvbox-baby")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "rebelot",
		priority = 1000,
		config = function()
			-- Default options:
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "dragon", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
					light = "lotus",
				},
			})
			-- setup must be called before loading
			-- ColorMyPencils("kanagawa-dragon")
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				-- This callback can be used to override the colors used in the palette.
				on_palette = function(palette)
					return palette
				end,
				-- Enable bold keywords.
				bold_keywords = false,
				-- Enable italic comments.
				italic_comments = true,
				-- Enable general editor background transparency.
				-- transparent_bg = true,
				-- Enable brighter float border.
				bright_border = false,
				-- Reduce the overall amount of blue in the theme (diverges from base Nord).
				reduced_blue = true,
				-- Swap the dark background with the normal one.
				swap_backgrounds = false,
				-- Override the styling of any highlight group.
				on_highlight = {},
				-- Cursorline options.  Also includes visual/selection.
				cursorline = {
					-- Bold font in cursorline.
					bold = true,
					-- Bold cursorline number.
					bold_number = true,
					-- Avialable styles: 'dark', 'light'.
					theme = "light",
					-- Blending the cursorline bg with the buffer bg.
					blend = 0.85,
				},
				noice = {
					-- Available styles: `classic`, `flat`.
					style = "classic",
				},
				telescope = {
					-- Available styles: `classic`, `flat`.
					style = "flat",
				},
				leap = {
					-- Dims the backdrop when using leap.
					dim_backdrop = false,
				},
				ts_context = {
					-- Enables dark background for treesitter-context window
					dark_background = true,
				},
			})

			-- ColorMyPencils("nordic")j
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				options = {
					theme_style = "dark_high_contrast",
					transparent = false,
					hide_inactive_statusline = true,
				},
			})

			-- ColorMyPencils("github_dark_high_contrast")
		end,
	},
}
