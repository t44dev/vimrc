return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        -- Adapters

        -- Python
        dap.adapters.python = {
            type = "executable",
            command = "python",
            args = { "-m", "debugpy.adapter" },
        }
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch File",
                program = "${file}",
                console = "internalConsole"
            },
        }

        vim.keymap.set("n", "<Up>", function() require("dap").continue() end, {})
        vim.keymap.set("n", "<Right>", function() require("dap").step_over() end, {})
        vim.keymap.set("n", "<Left>", function() require("dap").step_out() end, {})
        vim.keymap.set("n", "<Down>", function() require("dap").step_into() end, {})
        vim.keymap.set("n", "<Leader>db", function() require("dap").toggle_breakpoint() end, {})
        vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end)
        vim.keymap.set("n", "<Leader>df", function()
            local widgets = require("dap.ui.widgets")
            widgets.sidebar(widgets.frames).open()
        end)
        vim.keymap.set("n", "<Leader>ds", function()
            local widgets = require("dap.ui.widgets")
            widgets.sidebar(widgets.scopes).open()
        end)
    end
}
