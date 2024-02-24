FRAMES_WIDGET = nil
SCOPES_WIDGET = nil

return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        -- Events/Requests *dap-extensions*
        dap.listeners.after["event_initialized"]["track44_widgets"] = function(session, body)
            local widgets = require("dap.ui.widgets")
            if FRAMES_WIDGET == nil then
                FRAMES_WIDGET = widgets.sidebar(widgets.frames)
            end
            if SCOPES_WIDGET == nil then
                SCOPES_WIDGET = widgets.sidebar(widgets.scopes)
            end
            FRAMES_WIDGET.open()
            SCOPES_WIDGET.open()
        end
        dap.listeners.after["event_exited"]["track44_widgets"] = function(session, body)
            if FRAMES_WIDGET ~= nil then
                FRAMES_WIDGET.close()
            end
            if SCOPES_WIDGET ~= nil then
                SCOPES_WIDGET.close()
            end
        end

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
                console = "integratedTerminal"
            },
        }

        vim.keymap.set("n", "<Up>", function() require("dap").continue() end, {})
        vim.keymap.set("n", "<Right>", function() require("dap").step_over() end, {})
        vim.keymap.set("n", "<Left>", function() require("dap").step_out() end, {})
        vim.keymap.set("n", "<Down>", function() require("dap").step_into() end, {})
        vim.keymap.set("n", "<Leader>db", function() require("dap").toggle_breakpoint() end, {})
        vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end)
        vim.keymap.set("n", "<Leader>df", function()
            if FRAMES_WIDGET ~= nil then
                FRAMES_WIDGET.toggle()
            end
        end)
        vim.keymap.set("n", "<Leader>ds", function()
            if SCOPES_WIDGET ~= nil then
                SCOPES_WIDGET.toggle()
            end
        end)
    end
}
