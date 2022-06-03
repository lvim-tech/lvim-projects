local M = {}

M.open = function()
    local winopts = {
        relativenumber = false,
        number = false,
        list = false,
        winfixwidth = false,
        winfixheight = false,
        foldenable = false,
        spell = false,
        signcolumn = "no",
        foldmethod = "manual",
        foldcolumn = "0",
        cursorcolumn = false,
        colorcolumn = "0",
        wrap = false,
        winhl = table.concat({ "Normal:LvimProjects" }, ","),
    }
    local cmd_format = "%s %s +buffer\\ %d"
    vim.cmd(cmd_format:format("botright", "sp", _G.LVIM_PROJECTS["buffer"]))
    _G.LVIM_PROJECTS["window"] = vim.fn.win_getid()
    for k, v in pairs(winopts) do
        vim.wo[_G.LVIM_PROJECTS["window"]][k] = v
    end
    -- vim.wo[_G.LVIM_PROJECTS["window"]].height = 10
end

M.close = function()
    _G.LVIM_PROJECTS["autocmd_group"] = nil

    vim.api.nvim_win_hide(_G.LVIM_PROJECTS["window"])
    _G.LVIM_PROJECTS["window"] = nil
    _G.LVIM_PROJECTS["buffer"] = nil
end

return M
