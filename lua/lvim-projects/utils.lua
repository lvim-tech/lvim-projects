local lunajson = require("lunajson")

local M = {}

M.merge = function(t1, t2)
    for k, v in pairs(t2) do
        if (type(v) == "table") and (type(t1[k] or false) == "table") then
            if M.is_array(t1[k]) then
                t1[k] = M.concat(t1[k], v)
            else
                M.merge(t1[k], t2[k])
            end
        else
            t1[k] = v
        end
    end
    return t1
end

M.concat = function(t1, t2)
    for i = 1, #t2 do
        table.insert(t1, t2[i])
    end
    return t1
end

M.is_array = function(t)
    local i = 0
    for _ in pairs(t) do
        i = i + 1
        if t[i] == nil then
            return false
        end
    end
    return true
end

M.table_length = function(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

M.set_keymaps = function(keymaps, commands)
    for index, key in pairs(keymaps) do
        vim.api.nvim_buf_set_keymap(
            _G.LVIM_PROJECTS["buffer"],
            "n",
            key,
            commands[index],
            { noremap = true, silent = true, nowait = true }
        )
    end
end

--[[ M.tbl_set = function(tbl)
    local set = {}
    for _, l in ipairs(tbl) do
        set[l] = true
    end
    return set
end ]]

M.is_contains_value = function(tbl, val)
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            M.is_contains_value(v, val)
        elseif v == val then
            return k
        end
    end
end

M.read_file = function(f, json_decode)
    local file = io.open(f, "rb")
    if not file then
        return nil
    end
    local file_content = file:read("*a")
    file:close()
    if json_decode then
        return lunajson.decode(file_content)
    end
    return file_content
end

M.write_file = function(f, content)
    file = io.open(f, "w")
    file:write(content)
    file:close()
end

M.get_path = function()
    return vim.fn.getcwd() .. "/"
end

return M
