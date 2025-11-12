local sources = require("util.lualine")
-- local empty = { function() return " " end, padding = 0, color = "lualine_a", }
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "│",
                section_separators = { left = " ", right = "" },
				globalstatus = true,
			},
			-- sections = {
			--   lualine_a = { { "mode", "branch"--[[ , separator = { left = "|" } ]]--[[ , right_padding = 2  ]]} },
			--   lualine_b = { { "filename", path = 3 } },
			--   lualine_c = { { --[[ "tabs", mode = 1 ]] } },
			--   lualine_x = { --[[ empty  ]]},
			--   lualine_y = { "filetype", "progress" },
			--   lualine_z = { { "location"--[[ , separator = { right = "" } ]]--[[ , left_padding = 2  ]]},
			--   },
			-- },



			sections = {
				lualine_a = { sources.mode },
				lualine_b = { sources.branch, sources.diff },
				lualine_c = { sources.filetype, sources.macro },
				lualine_x = { sources.lsp_formater_linter, sources.diagnostics },
				lualine_y = { sources.indentation --[[ , sources.encoding ]] --[[ , sources.fileformat ]], },
				lualine_z = { sources.progress, sources.location },
			},




			-- inactive_sections = {
			--   lualine_a = { "filename" },
			--   lualine_b = {},
			--   lualine_c = {},
			--   lualine_x = {},
			--   lualine_y = {},
			--   lualine_z = { "location" },
			-- },
			-- tabline = {},
			-- extensions = {},
			extensions = { "fugitive", "quickfix", "fzf", "lazy", "mason", "nvim-dap-ui", "oil", "trouble" },
		})
	end,
}

-- :hi! link StatusLine Normal
-- :hi! link StatusLineNC Normal
