local config = require("lvim-projects.config")
local v = vim.api
local cmd = vim.cmd
local fn = vim.fn

local M = {}

M.open = function(bufnr)
    local cmd_format = "%s %s +buffer\\ %d"
    cmd(cmd_format:format("botright", "sp", bufnr))
    config.win = fn.win_getid()
end

M.close = function()
    if config.win ~= nil then
        vim.api.nvim_win_hide(config.win)
    end
end
--[[ M.is_win_open = function()
    return M.get_winnr() ~= nil and vim.api.nvim_win_is_valid(M.get_winnr())
end

M.get_winnr = function()
    return config.tabpages[api.nvim_get_current_tabpage()]
end ]]
return M
