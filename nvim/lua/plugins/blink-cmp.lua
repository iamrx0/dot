require("luasnip.loaders.from_vscode").lazy_load()
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
    appearance = {
        kind_icons = {
            Text = '󰉿',
            Method = '󰊕',
            Function = '󰊕',
            Constructor = '󰒓',

            Field = '󰜢',
            Variable = '󰆦',
            Property = '󰖷',

            Class = '󱡠',
            Interface = '󱡠',
            Struct = '󱡠',
            Module = '󰅩',

            Unit = '󰪚',
            Value = '󰦨',
            Enum = '󰦨',
            EnumMember = '󰦨',

            Keyword = '󰻾',
            Constant = '󰏿',

            Snippet = '󱄽',
            Color = '󰏘',
            File = '󰈔',
            Reference = '󰬲',
            Folder = '󰉋',
            Event = '󱐋',
            Operator = '󰪚',
            TypeParameter = '󰬛',
        },
    },
    completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        menu = {
            scrollbar = false,
            border = {
                "┌",
                "─",
                "┐",
                "│",
                "┘",
                "─",
                "└",
                "│",
            },
        },
        documentation = {
            auto_show = false,
            window = {
                border = {
                    "┌",
                    "─",
                    "┐",
                    "│",
                    "┘",
                    "─",
                    "└",
                    "│",
                },
            },
        },
    },
})
