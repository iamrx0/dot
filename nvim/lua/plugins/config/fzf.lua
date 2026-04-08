return {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local fzf = require('fzf-lua')
        fzf.setup({
            winopts = {
                border = "single",
                preview = {
                    layout = 'horizontal',
                    hidden = true,
                    title = false,
                    scrollbar = false,
                }
            },
        })
        fzf.register_ui_select()

        local config = require("fzf-lua.config")
        local actions = require("trouble.sources.fzf").actions
        config.defaults.actions.files["ctrl-t"] = actions.open

        vim.keymap.set("n", "<c-f>", "<cmd>lua require('fzf-lua').files()<CR>",
            { silent = true, desc = "Fuzzy Files" })
        -- vim.keymap.set("n", "<c-m>", "<cmd>lua require('fzf-lua').marks()<CR>",
        --     { silent = true, desc = "Fuzzy Marks" })

        vim.keymap.set("n", "<leader><space>", "<cmd>lua require('fzf-lua').buffers()<CR>",
            { silent = true, desc = "Fuzzy Buffers" })
        vim.keymap.set("n", "<leader>ps", "<cmd>lua require('fzf-lua').live_grep()<CR>",
            { silent = true, desc = "Fuzzy Grep" })
        vim.keymap.set({ "i" }, "<C-x><C-f>",
            function()
                require("fzf-lua").complete_file({
                    cmd = "rg --files",
                    winopts = { preview = { hidden = "nohidden" } }
                })
            end, { silent = true, desc = "Fuzzy complete file" })
    end
}
