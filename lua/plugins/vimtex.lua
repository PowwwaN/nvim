return {
    "lervag/vimtex",
    ft = { "tex", "bib" },
    config = function()
        vim.g.vimtex_view_method = "skim"
        -- vim.g.vimtex_compiler_method = "latexmk"
        -- vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_mappings_enabled = 1
        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_autocompile = 1
    end,
}
