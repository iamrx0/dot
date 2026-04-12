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
    keymaps_help = {
        border = "single",
    },
})
vim.keymap.set("n", "<leader>pv", ":Oil<CR>", { silent = true })
