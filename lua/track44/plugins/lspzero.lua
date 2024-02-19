local format = require("track44.utils.format")

return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lsp_zero = require("lsp-zero")
            -- Keymaps when language server is active
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                vim.keymap.set("n", "<leader>fb", function() format.format_buffer(client.name) end)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
            end)

            -- LSP Configuration
            require("mason").setup({})
            require("mason-lspconfig").setup({
                -- Default Installed LSP
                -- LSP list https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "texlab"
                },
                -- Configure LSP
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        require("lspconfig").lua_ls.setup({
                            settings = {
                                Lua = {
                                    runtime = {
                                        version = "LuaJIT"
                                    },
                                    diagnostics = {
                                        globals = { "vim" }
                                    },
                                }
                            }
                        })
                    end
                },
            })
        end
    },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
    {
        "williamboman/mason.nvim",
        lazy = false
    },
    { "williamboman/mason-lspconfig.nvim" },
}
