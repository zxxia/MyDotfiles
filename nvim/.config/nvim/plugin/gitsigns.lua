local gitsigns_status_ok, gitsigns = pcall(require, 'gitsigns')

if not gitsigns_status_ok then
  print("Warning: gitsigns not available, skipping configuration.")
  return
end
gitsigns.setup{
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}
vim.keymap.set('n', ']c', gitsigns.next_hunk, {})
vim.keymap.set('n', '[c', gitsigns.prev_hunk, {})
