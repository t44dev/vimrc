return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim' },
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup({})

        -- Keymaps
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, {})
        vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {})
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, {})
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, {})
    end
}
