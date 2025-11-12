return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.diagnostics.clangd,
				-- null_ls.builtins.formatting.clang_format.with({
				-- 	extra_args = { "--style={IndentWidth: 4}" },
				-- }),
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.checkmake,
				-- null_ls.builtins.formatting.marksman,
			},
			indent_width = 4,
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
