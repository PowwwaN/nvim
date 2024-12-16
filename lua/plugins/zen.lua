return {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    opts = {
        plugins = {
            tmux = { enabled = true },
            kitty = {
                enabled = true,
                font = "+4", -- font size increment
            },
            twilight = { enabled = true },
        },
    },
}
