return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/nvim-cmp', 'L3MON4D3/LuaSnip', 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim'},
        config = function ()
            local lsp_zero = require('lsp-zero')
            -- Keymaps when language server is active
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer=bufnr})
            end)

            -- LSP Configuration
            require('mason').setup({})
            require('mason-lspconfig').setup({
                -- Default Installed LSP 
                -- LSP list https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
                ensure_installed = { 'lua_ls', 'pylsp', 'texlab' },
                -- Configure LSP 
                handlers = {
                    lsp_zero.default_setup,
                },
            })
        end
    },
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {
        'williamboman/mason.nvim',
        lazy = false
    },
    {'williamboman/mason-lspconfig.nvim'},
}
