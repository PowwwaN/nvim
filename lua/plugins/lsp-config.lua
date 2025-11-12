return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd", --[[ "autotools_ls", ]]
                    "marksman",
                    "mesonlsp",
                    "dockerls",
                    "eslint",
                    "html",
                    -- "texlab",
                },
                automatic_installation = {},
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
        },
        config = function()
            -- 1. Налаштування neodev
            require("neodev").setup()

            -- 2. Використання vim.lsp.config для налаштування
            -- Якщо ви використовуєте Nvim 0.11+, ви можете використовувати vim.lsp.config.
            -- Але для надійності, оскільки nvim-lspconfig зараз все ще є лише сховищем конфігурацій,
            -- краще перейти на функцію vim.lsp.start() для налаштування клієнтів LSP.
            -- Однак, якщо ви використовуєте mason-lspconfig, він працює, додаючи конфігурації
            -- до vim.lsp.config (за лаштунками) і встановлюючи автоматичне налаштування через події.
            -- Оскільки ви використовуєте mason-lspconfig, кращий спосіб — використати
            -- "nvim-lspconfig" як сховище конфігурацій, а *не* як менеджер запусків.

            -- Якщо ви хочете, щоб конфігурації були застосовані до сервера, який встановлює mason,
            -- ви можете використовувати функцію `on_new_config` у `mason-lspconfig`.
            -- Або ж ви можете використовувати `vim.lsp.config.SERVERNAME` для конфігурації,
            -- і `mason-lspconfig` застосує її при запуску.

            local lspconfig = require("lspconfig")
            local lsp_config_table = vim.lsp.config -- Рекомендований підхід для Nvim 0.11+

            -- Увімкнення (широкомовного) сніпет-функціоналу для автодоповнення
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- 3. Налаштування серверів LSP за допомогою `vim.lsp.config.SERVERNAME`
            -- Цей підхід налаштовує конфігурації, які автоматично підхоплюються `mason-lspconfig`
            -- при встановленні та запуску сервера.

            -- lsp_config_table.lua_ls = vim.tbl_deep_extend("force", lsp_config_table.lua_ls or {}, {
            --     settings = {},
            -- })

            lsp_config_table.clangd = vim.tbl_deep_extend("force", lsp_config_table.clangd or {}, {
                cmd = {
                    "clangd",
                    "--fallback-style=llvm:4",
                },
            })

            -- lsp_config_table.marksman = vim.tbl_deep_extend("force", lsp_config_table.marksman or {}, {})
            -- lsp_config_table.mesonlsp = vim.tbl_deep_extend("force", lsp_config_table.mesonlsp or {}, {})
            -- lsp_config_table.dockerls = vim.tbl_deep_extend("force", lsp_config_table.dockerls or {}, {})
            -- lsp_config_table.eslint = vim.tbl_deep_extend("force", lsp_config_table.eslint or {}, {})

            lsp_config_table.html = vim.tbl_deep_extend("force", lsp_config_table.html or {}, {
                capabilities = capabilities, -- Зверніть увагу на виправлення "capabilieties" на "capabilities"
                settings = {
                    css = {
                        lint = {
                            validProperties = {},
                        },
                    },
                },
            })

            -- 4. Встановлення Keymaps (залишається без змін)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
