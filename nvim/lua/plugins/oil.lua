require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
    view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
        end
    },
    lsp_file_methods = {
        autosave_changes = true,
    },
    float = {
        padding = 2,
        max_width = 50,
        max_height = 0,
        preview_split = "right",
        win_options = {
            winblend = 0,
        },
        override = function(conf)
            conf.width = 40
            conf.height = 20
            conf.row = vim.o.lines - conf.height - 3
            conf.col = vim.o.columns - conf.width - 1
            conf.style = "minimal"
            conf.border = "single"
            return conf
        end
    },
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        ["<C-p>"] = false,
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
    },
    preview = {
        max_width = { 50, 0.5 },
        min_width = { 50, 0.5 },
        width = 50,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        border = "single",
        win_options = {
            winblend = 0,
        },
        update_on_cursor_moved = true,
    },
    keymaps_help = {
        border = "single",
    },
})
vim.keymap.set("n", "<leader>pv", ":Oil<CR>", { silent = true, desc = "Oil Toggle" })
