return{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "autotools_ls", "marksman", "swift_mesonls"},
        automatic_installation = {},
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'folke/neodev.nvim',
    },
    config = function()
      require("neodev").setup()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.marksman.setup({})
      lspconfig.swift_mesonls.setup({})
      lspconfig.autotools_ls.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
    end
  }
}
