return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        event = { "BufEnter" },
        dependencies = { "zbirenbaum/copilot.lua" },
        fix_pairs = true,
        config = function()
            require("copilot_cmp").setup()
        end,
    },
    {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            dependencies = {
                { "copilot.lua" },
                { "plenary.nvim" },
            },
            build = "make tiktoken", -- Only on MacOS or Linux
            opts = {
                model = "claude-3.5-sonnet",
            },
            -- config = function()
            --     vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { noremap = true, silent = true })
            --     vim.keymap.set("v", "<leader>cc", ":<C-U>CopilotChat<CR>", { noremap = true, silent = true })
            -- end,
            -- See Commands section for default commands if you want to lazy load on them
        },
    },
}
