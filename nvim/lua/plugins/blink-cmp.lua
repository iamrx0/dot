require("luasnip.loaders.from_vscode").lazy_load()
require("lspkind").init({
  symbol_map = {
    Copilot = "",
  },
})
require("blink.cmp").setup({
    fuzzy = {
        implementation = "lua",
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
            copilot = {
                name = "copilot",
                module = "blink-copilot",
                score_offset = 100,
                async = true,
            },
        },
    },
    completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        menu = {
            draw = {
                components = {
                    kind_icon = {
                        text = function (ctx)
                            return require('lspkind').symbol_map[ctx.kind] or ''
                        end,
                    },
                },
            },
            scrollbar = false,
        },
        documentation = {
            auto_show = false,
        },
    },
})
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder",  { fg = "#ffffff", bg = "NONE" })
