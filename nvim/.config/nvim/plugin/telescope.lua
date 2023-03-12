local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
    print("Warning: telescope not available, skipping configuration.")
  return
end

local actions = require('telescope.actions')
telescope.setup({
    defaults = {
        sorting_strategy = 'ascending',
        -- layout_config = {
        --     prompt_position = 'top',
        -- },
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
            },
        },
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- Ctrl-p = fuzzy finder
vim.keymap.set('n', '<C-P>', function()
    local ok = pcall(builtin.git_files, { show_untracked = true })
    if not ok then
        builtin.find_files()
    end
end)
