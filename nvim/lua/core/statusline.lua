local colors = {
    blue    = "#5ea1ff",
    green   = "#5eff6c",
    red     = "#ff6e5e",
    yellow  = "#f1ff5e",
    cyan    = "#5ef1ff",
    bg      = "#16181a",
    magenta = "#ff5ef1",
    orange  = "#ffbd5e",
}

local cyberdream = {
    normal   = { a = { fg = colors.blue, bg = colors.bg } },
    insert   = { a = { fg = colors.green, bg = colors.bg } },
    visual   = { a = { fg = colors.magenta, bg = colors.bg } },
    terminal = { a = { fg = colors.orange, bg = colors.bg } },
}

local function get_mode_color()
    local mode = vim.api.nvim_get_mode().mode

    if mode:match("i") then
        return cyberdream.insert.a
    elseif mode:match("[vV\22]") then
        return cyberdream.visual.a
    elseif mode:match("t") then
        return cyberdream.terminal.a
    else
        return cyberdream.normal.a
    end
end

local function mode_label()
    local mode = vim.api.nvim_get_mode().mode
    local map = {
        n = " NORMAL",
        i = " INSERT",
        v = " VISUAL",
        V = " V-LINE",
        ["\22"] = " V-BLOCK",
        c = " COMMAND",
        R = " REPLACE",
        t = " TERMINAL",
    }
    return map[mode] or mode
end

local function modified_flag()
    if vim.bo.modified then
        return "%#StatusModified# ● "
    end
    return ""
end

local function diag_counts()
    local bufnr = 0
    local err = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
    local warn = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })

    local parts = {}
    if err > 0 then
        table.insert(parts, "%#StatusErr# " .. err)
    end
    if warn > 0 then
        table.insert(parts, "%#StatusWarn# " .. warn)
    end

    return table.concat(parts, " ")
end

local function set_mode_highlight()
    local c = get_mode_color()

    vim.api.nvim_set_hl(0, "StatusMode", {
        fg = c.fg,
        bg = c.bg,
        bold = true,
    })
end

function _G.my_statusline()
    local left   = table.concat({
        "%#StatusMode# " .. mode_label() .. " ",
        "%#StatusDiag# " .. diag_counts() .. " ",
    })

    local center = table.concat({
        "%#StatusFile# ",
        modified_flag(),
        "%f ",
    })
    local right  = "%#StatusPos# %l:%c "

    return table.concat({
        left,
        "%=",
        center,
        right,
    })
end

vim.o.statusline = "%!v:lua.my_statusline()"

vim.api.nvim_set_hl(0, "StatusErr", { fg = colors.red, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusWarn", { fg = colors.yellow, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusDiag", { fg = colors.fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusFile", { fg = colors.fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusPos", { fg = colors.blue, bg = "NONE" })

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        set_mode_highlight()
        vim.cmd("redrawstatus")
    end,
})

set_mode_highlight()
