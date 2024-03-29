-- Remaps
-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard
vim.keymap.set({ "n", "x" }, "<leader>C", '"+y')
vim.keymap.set({ "n", "x" }, "<leader>P", '"+p')

-- Other
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Plugin/Command Ease of Access
vim.keymap.set("n", "<leader>fs", vim.cmd.Ex)

-- Options
-- Line Numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Events
-- On Save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        -- Format on Save
        client = vim.lsp.get_clients({ buffer = bufnr })[1]
        if client ~= nil then
            require("track44.utils.format").format_buffer(client.name)
        end
    end
})
