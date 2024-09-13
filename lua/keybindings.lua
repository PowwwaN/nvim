--leader
vim.g.mapleader = " "
-- keymap to toggle NvimTree 
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

--leave insert mode with jk
vim.keymap.set('i', 'jj', '<ESC>')

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

vim.keymap.set("n", "<leader>t", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>x", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<TAB>", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<S-tab>", ":tabp<CR>") --  go to previous tab

-- dismiss notifications
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>")

-- set semicolon to behave the same as a colon
vim.keymap.set('n', ';', ':')

-- set so I can jump to the end of the line comfortably
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'H', '|')
vim.keymap.set('v', 'L', '$')
vim.keymap.set('v', 'H', '|')
vim.keymap.set('n', 'E', 'ge')
vim.keymap.set('v', 'E', 'ge')
-- vim.keymap.set('n', 'W', 'b')

-- oil
vim.keymap.set("n", "<leader>e", function()
	require("oil").toggle_float()
end)

-- Obsidian
vim.keymap.set("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = "Obsidian Check Checkbox" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianFollowLink<CR>", { desc = "Show ObsidianLinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })

-- make C-Backspace work in insert mode
vim.keymap.set('i', '<C-BS>', '<C-W>')

-- spec animations
-- Press <C-b> to call specs!
-- vim.api.nvim_set_keymap('n', '<C-b>', ':lua require("specs").show_specs()', { noremap = true, silent = true })

-- You can even bind it to search jumping and more, example:
-- vim.api.nvim_set_keymap('n', 'n', 'n:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'N', 'N:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })

-- when going up and down
-- vim.api.nvim_set_keymap('n', 'j', 'j:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'k', 'k:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })

-- Or maybe you do a lot of screen-casts and want to call attention to a specific line of code:
-- vim.api.nvim_set_keymap('n', '<leader>v', ':lua require("specs").show_specs({width = 97, winhl = "Search", delay_ms = 610, inc_ms = 21})<CR>', { noremap = true, silent = true })

-- toggle_ukrainian_layout in neovim
vim.api.nvim_set_keymap('n', '<leader>ua', ':lua require("functions").toggle_ukrainian_layout()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>de', ':lua require("functions").toggle_german_layout()<CR>', {noremap = true, silent = true})
