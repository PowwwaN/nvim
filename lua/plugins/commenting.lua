return {
	"numToStr/Comment.nvim",
	event = { "BufEnter" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	config = function()
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
		require("Comment.ft").set("reason", { "//%s", "/*%s*/" })
	end,
	lazy = false,
}
