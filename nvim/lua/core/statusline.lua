local colors = {
    blue    = "#5ea1ff",
    green   = "#5eff6c",
    red     = "#ff6e5e",
    yellow  = "#f1ff5e",
    magenta = "#ff5ef1",
    orange  = "#ffbd5e",
    bg      = "#16181a",
    fg      = "#c5c8c6",
}

local mode_map = {
    n = { label = " NORMAL",   fg = colors.blue },
    i = { label = " INSERT",   fg = colors.green },
    v = { label = " VISUAL",   fg = colors.magenta },
    V = { label = " V-LINE",   fg = colors.magenta },
    ["\22"] = { label = " V-BLOCK", fg = colors.magenta },
    c = { label = " COMMAND",  fg = colors.yellow },
    R = { label = " REPLACE",  fg = colors.red },
    t = { label = " TERMINAL", fg = colors.orange },
}

local function current_mode()
    local mode = vim.api.nvim_get_mode().mode
    return mode_map[mode] or { label = " " .. mode, fg = colors.blue }
end

local function modified_flag()
    return vim.bo.modified and "%#StatusModified# ● " or ""
end

local function diag_counts()
    local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warns  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

    local parts = {}

    if errors > 0 then
        parts[#parts + 1] = "%#StatusErr# " .. errors
    end

    if warns > 0 then
        parts[#parts + 1] = "%#StatusWarn# " .. warns
    end

    return table.concat(parts, " ")
end

local function set_mode_highlight()
    local mode = current_mode()

    vim.api.nvim_set_hl(0, "StatusMode", {
        fg = mode.fg,
        bg = colors.bg,
        bold = true,
    })
end

function _G.my_statusline()
    local mode = current_mode()
    local diag = diag_counts()

    local left = "%#StatusMode# " .. mode.label .. " "
    if diag ~= "" then
        left = left .. "%#StatusDiag# " .. diag .. " "
    end

    local center = "%#StatusFile# " .. modified_flag() .. "%f "
    local right = "%#StatusPos# %l:%c "

    return left .. "%=" .. center .. right
end

vim.o.statusline = "%!v:lua.my_statusline()"

vim.api.nvim_set_hl(0, "StatusErr", { fg = colors.red, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusWarn", { fg = colors.yellow, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusDiag", { fg = colors.fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusFile", { fg = colors.fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusPos", { fg = colors.blue, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusModified", { fg = colors.red, bg = "NONE" })

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        set_mode_highlight()
        vim.cmd("redrawstatus")
    end,
})

set_mode_highlight()
