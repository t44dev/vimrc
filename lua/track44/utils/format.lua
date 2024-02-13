complex = {}

-- Override default formatter for an LSP
local format_map = {
    pylsp = function() vim.cmd("Black") end
}

-- Formatting Function
function complex.format_buffer(client)
    print("Formatting...")
    if format_map[client.name] ~= nil then
        format_map[client.name]()
    else
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end
    print("Done Formatting.")
end

return complex
