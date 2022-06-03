local config = require("lvim-projects.config")
local utils = require("lvim-projects.utils")
local buffer = require("lvim-projects.renderer.buffer")
local window = require("lvim-projects.renderer.window")
local autocmd = require("lvim-projects.autocmd")
local commands = require("lvim-projects.commands")

local M = {}

M.action = function()
    if _G.LVIM_PROJECTS["autocmd_group"] == nil then
        print("hello")
        autocmd.create_augroup()
        local path = utils.get_path()
        local project_name = utils.is_contains_value(
            _G.LVIM_PROJECTS["projects"],
            path
        )
        if project_name ~= nil then
            -- print("hello")
            M.projects()
        else
            -- print("hello2")
            -- print(path)
            -- projects
        end
    end
end

M.projects = function()
    buffer.create("LvimProjects")
    window.open()
    vim.api.nvim_buf_set_option(_G.LVIM_PROJECTS["buffer"], "modifiable", true)
    local count = 0
    for k, v in pairs(_G.LVIM_PROJECTS["projects"]) do
        vim.api.nvim_buf_set_lines(_G.LVIM_PROJECTS["buffer"], count, -1, false, {
            k .. " - " .. v,
        })
        count = count + 1
    end
    vim.api.nvim_buf_set_option(_G.LVIM_PROJECTS["buffer"], "modifiable", false)
    utils.set_keymaps(config.key_maps.base, commands.base)
end

M.workspaces = function()
    -- bt LvimProjects
end

M.tabs = function()
    -- tabs
end

M.files = function()
    -- files
end

return M
