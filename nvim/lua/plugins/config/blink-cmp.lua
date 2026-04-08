return {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            dependencies = {
                { "rafamadriz/friendly-snippets" }
            }
        },
        {
            "fang2hou/blink-copilot",
            opts = {
                max_completions = 1,
                max_attempts = 2,
                kind_hl = "Normal",
            }
        },
    },
    version = '*',
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("blink.cmp").setup({
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
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
    end,
}
