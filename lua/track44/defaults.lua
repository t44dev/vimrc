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

-- Events
-- On Save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function ()
        -- Format on Save
        local client = vim.lsp.buf_get_clients()
        if client ~= nil then
            require("track44.utils.format").format_buffer(client)
        end
    end
})
