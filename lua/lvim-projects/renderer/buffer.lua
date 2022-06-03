local M = {}

M.create = function(filetype)
    local bufopts = {
        swapfile = false,
        buftype = "nofile",
        modifiable = false,
        filetype = filetype,
        bufhidden = "hide",
    }
    _G.LVIM_PROJECTS["buffer"] = vim.api.nvim_create_buf(false, false)
    for k, v in pairs(bufopts) do
        vim.bo[_G.LVIM_PROJECTS["buffer"]][k] = v
    end
end

M.content = function()
    vim.api.nvim_buf_set_option(_G.LVIM_PROJECTS["buffer"], "modifiable", true)
    vim.api.nvim_buf_set_lines(
        _G.LVIM_PROJECTS["buffer"],
        0,
        -1,
        false,
        { "Biser", "sdfsdf" }
    )
    vim.api.nvim_buf_set_lines(
        _G.LVIM_PROJECTS["buffer"],
        1,
        -1,
        false,
        { "Stoilovvvvvvvvv" }
    )
    vim.api.nvim_buf_set_option(_G.LVIM_PROJECTS["buffer"], "modifiable", false)
end

return M
