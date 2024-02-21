return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- Keymaps
        -- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>af', builtin.find_files, {})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})
    end
}
