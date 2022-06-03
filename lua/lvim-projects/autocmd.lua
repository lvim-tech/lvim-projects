local window = require("lvim-projects.renderer.window")

local M = {}

M.create_augroup = function()
    _G.LVIM_PROJECTS["autocmd_group"] = vim.api.nvim_create_augroup(
        "LvimProjects",
        {
            clear = true,
        }
    )
end

M.delete_augroup = function()
    vim.api.nvim_del_augroup_by_name("LvimProjects")
    _G.LVIM_PROJECTS["autocmd_group"] = nil
end

M.global_autocmd = function()
    vim.api.nvim_create_autocmd({
        "WinLeave",
        "BufLeave",
    }, {
        callback = function()
            if _G.LVIM_PROJECTS["autocmd_group"] ~= nil then
                M.delete_augroup()
            elseif type(_G.LVIM_PROJECTS["window"]) == "number" then
                window.close()
            end
        end,
    })
end

return M
