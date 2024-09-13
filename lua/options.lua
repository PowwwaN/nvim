--tabs & tabulation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.cmd("set softtabstop=4")
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
--numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
--cursorline
vim.opt.cursorline = true
--apperance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
-- backspace
vim.opt.backspace = "indent,eol,start"
--clipboard
vim.opt.clipboard:append("unnamedplus")
--split windows
vim.opt.splitright = true
vim.opt.splitbelow = true
-- make it so vim moves the view nicely
vim.opt.scrolloff = 8

vim.opt.iskeyword:append("-")

-- obsidian signs
vim.opt.conceallevel = 2

-- setting correct value to notification background
vim.cmd([[
  hi NotifyBackground guibg = #000000
]])

-- remove ugly corners
-- vim.cmd(":hi! link StatusLine Normal") -- it doesnt work 
-- vim.cmd(":hi! link StatusLineNC Normal") -- it doesnt work  
