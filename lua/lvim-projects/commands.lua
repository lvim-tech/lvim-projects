-- vim.api.nvim_create_user_command("SetGlobalPath", 'lua require("core.funcs").set_global_path()', {})
local M = {

    open = "<C-space>",
    base = {
        close = ":lua require'lvim-projects.renderer.window'.close()<CR>",
        -- projects = "p",
        -- workspaces = "w",
        -- tabs = "t",
        -- files = "f",
    },
    close = "q",
    projects = {},
    workspaces = {},
    tabs = {},
    files = {},
}

return M
