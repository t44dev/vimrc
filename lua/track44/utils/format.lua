complex = {}

-- Override default formatter for an LSP
local format_map = {
    pylsp = function() vim.cmd("Black") end
}

-- Formatting Function
function complex.format_buffer(client_name)
    if format_map[client_name] ~= nil then
        format_map[client_name]()
    else
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end
end

return complex
