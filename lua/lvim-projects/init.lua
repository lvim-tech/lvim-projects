local config = require("lvim-projects.config")
local utils = require("lvim-projects.utils")
local autocmd = require("lvim-projects.autocmd")
local actions = require("lvim-projects.actions")
local window = require("lvim-projects.renderer.window")

local M = {}

M.setup = function(user_config)
    if user_config ~= nil then
        utils.merge(config, user_config)
    end
    vim.schedule(function()
        _G.LVIM_PROJECTS = {
            autocmd_group = nil,
            cwd = utils.get_path(),
            window = nil,
        }
        local projects = utils.read_file(
            os.getenv("HOME") .. "/" .. config.file_path .. "LVIM_PROJECTS.json",
            true
        )
        if projects ~= nil then
            _G.LVIM_PROJECTS["projects"] = projects
        else
            utils.write_file(
                os.getenv("HOME")
                .. "/"
                .. config.file_path
                .. "LVIM_PROJECTS.json",
                "{}"
            )
            _G.LVIM_PROJECTS["projects"] = {}
        end
        vim.keymap.set("n", config.key_maps.open, function()
            actions.action()
        end)
        autocmd.global_autocmd()
    end)
end

return M
