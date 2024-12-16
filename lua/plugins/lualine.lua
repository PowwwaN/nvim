-- local empty = { function() return " " end, padding = 0, color = "lualine_a", }
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "github_dark",
                -- component_separators = "|",
                -- section_separators = "",
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
                lualine_a = { "mode" },
                lualine_b = { { "branch"--[[ , separator = "" ]] }, "diff", "diagnostics" },
                lualine_c = { { "filename", path = 3 } },
                lualine_x = { "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
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
