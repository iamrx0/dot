require("mason").setup({
    ui = {
        border = "single",
        width = 0.7,
        height = 0.7,
    },
})
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.api.nvim_buf_set_keymap(args.buf, 'i', '<C-h>', '', {
            noremap = true,
            silent = true,
            callback = function()
                vim.lsp.buf.signature_help({
                    max_width = 80,
                    max_height = 40,
                })
            end,
        })
        vim.api.nvim_buf_set_keymap(args.buf, 'n', 'K', '', {
            noremap = true,
            silent = true,
            callback = function()
                vim.lsp.buf.hover({
                    max_width = 60,
                    max_height = 10,
                })
            end,
        })
        vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end,
            { silent = true })
        vim.keymap.set("n", "gC", function() vim.lsp.buf.code_action() end,
            { silent = true })
        vim.keymap.set("n", "gf", function()
            vim.lsp.buf.format()
        end, { silent = true })
    end,
})

vim.lsp.enable({
    "roslyn",
    "luals",
    "gopls",
    "pylsp",
    "html",
    "tsls",
})

vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    signs = true,
})
vim.diagnostic.config({
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰝶 ",
            [vim.diagnostic.severity.INFO]  = " ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
        },
    },
})
