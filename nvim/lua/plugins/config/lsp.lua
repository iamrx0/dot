return {
    'williamboman/mason.nvim',
    config = function()
        require("mason").setup({
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
            ui = {
                border = "single",
                width = 0.7,
                height = 0.7,
            },
        })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end
                if client.server_capabilities.signatureHelpProvider then
                    local custom_signature = function()
                        local signature_opts = {
                            max_width = 80,
                            max_height = 40,
                        }
                        vim.lsp.buf.signature_help(signature_opts)
                    end
                    vim.api.nvim_buf_set_keymap(args.buf, 'i', '<C-h>', '', {
                        noremap = true,
                        silent = true,
                        callback = custom_signature,
                    })
                end

                if client.server_capabilities.hoverProvider then
                    local custom_hover = function()
                        local hover_opts = {
                            max_width = 60,
                            max_height = 10,
                        }
                        vim.lsp.buf.hover(hover_opts)
                    end
                    vim.api.nvim_buf_set_keymap(args.buf, 'n', 'K', '', {
                        noremap = true,
                        silent = true,
                        callback = custom_hover,
                    })
                end
                vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end,
                    { silent = true, desc = "LSP Rename" })
                vim.keymap.set("n", "gC", function() vim.lsp.buf.code_action() end,
                    { silent = true, desc = "LSP Code Actions" })
                vim.keymap.set("n", "gf", function()
                    vim.lsp.buf.format()
                end, { silent = true, desc = "LSP Format" })
            end,
        })

        vim.lsp.enable({
            "roslyn",
            "luals",
            "docker_compose",
            "dockerls",
            "cmake-language-server",
            "gopls",
            "clangd",
            "jdtls",
            "jsonlsp",
            "pylsp",
            "yamlls",
            "html",
            "tsls",
        })

        vim.diagnostic.config({
            underline = true,
            virtual_text = false,
            signs = true,
        })

        local signs = { Error = " ", Warn = " ", Hint = "󰝶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end
}
