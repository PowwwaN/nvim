local M = {}

-- Track the layout state
M.using_ukrainian_layout = false

-- Toggle function
function M.toggle_ukrainian_layout()
  if M.using_ukrainian_layout then
    -- Switch to default layout
    vim.cmd('set keymap=')
    M.using_ukrainian_layout = false
  else
    -- Switch to Ukrainian JCUKEN layout
    vim.cmd('set keymap=ukrainian-jcuken')
    M.using_ukrainian_layout = true
  end
end

M.using_german_layout = false

function M.toggle_german_layout()
  if M.using_german_layout then
    -- Switch to default layout
    vim.cmd('set keymap=')
    M.using_german_layout = false
  else
    -- Switch to german_qwertz layout
    vim.cmd('set keymap=german-qwertz')
    M.using_german_layout = true
  end
end

return M
