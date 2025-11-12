local icons = require("util.icons").icons
local M = {}

M.mode = {
    "mode",
    fmt = function(name)
        local map = {
            NORMAL = icons.Normal,
            INSERT = icons.Insert,
            TERMINAL = icons.Terminal,
            VISUAL = icons.Visual,
            ["V-LINE"] = icons.Visual,
            ["V-BLOCK"] = icons.Visual,
            ["O-PENDING"] = icons.Ellipsis,
            COMMAND = icons.Command,
            REPLACE = icons.Edit,
            SELECT = icons.Visual,
        }
        local icon = map[name] and map[name] or icons.Vim
        return icon .. " " .. name
    end,
    separator = { right = "", left = "░▒▓" },
}

M.filetype = {
    "filetype",
    separator = { right = "", left = "" },
}

M.diagnostics = {
    "diagnostics",
    separator = { right = "", left = "" },
}

M.encoding = {
    "encoding",
}

M.fileformat = {
    "fileformat",
}

M.indentation = {
    "indentation",
    fmt = function()
        local type = vim.bo[0].expandtab and "spaces" or "tabs"
        local value = vim.bo[0].shiftwidth
        return type .. ": " .. value
    end,
}

M.progress = {
    "progress",
    fmt = function(location)
        return vim.trim(location)
    end,
}

M.location = {
    "location",
    fmt = function(location)
        return vim.trim(location)
    end,
}

M.macro = {
    function()
        return vim.fn.reg_recording()
    end,
    icon = icons.Recording,
    separator = { left = "", right = "" },
}

M.lsp_formater_linter = {
    function()
        -- Get active clients for current buffer
        local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
        if #buf_clients == 0 then
            return "No client active"
        end
        local buf_ft = vim.bo.filetype
        local buf_client_names = {}
        local num_client_names = #buf_client_names

        -- Add lsp-clients active in the current buffer
        for _, client in pairs(buf_clients) do
            num_client_names = num_client_names + 1
            buf_client_names[num_client_names] = client.name
        end

        local client_names_str = table.concat(buf_client_names, ", ")
        local language_servers = string.format("[%s]", client_names_str)

        return language_servers
    end,
    icon = icons.Braces,
    separator = { right = "", left = "" },
}

M.gap = {
    function()
        return " "
    end,
    padding = 0,
}

-- Function to get the width of the NvimTree window
M.nvim_tree_width = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local filetype = vim.bo[buf].filetype
        if filetype == "NvimTree" then
            return vim.api.nvim_win_get_width(win)
        end
    end
    return 0
end

-- Custom lualine component to display NvimTree text with icon centered
M.custom_nvimtree_component = function()
    local tree_open = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local filetype = vim.bo[buf].filetype
        if filetype == "NvimTree" then
            tree_open = true
            break
        end
    end

    if tree_open then
        local width = M.nvim_tree_width() -- Get the width of NvimTree

        -- Center the content
        return string.rep(" ", width - 1)
    end
    return ""
end

M.macro = {
    function()
        return vim.fn.reg_recording()
    end,
    icon = icons.Recording,
    separator = { left = "", right = "" },
}

M.filetree = {
    function()
        return M.custom_nvimtree_component()
    end,
    separator = { left = "", right = "" },
}

return M
