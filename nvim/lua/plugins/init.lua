vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/fang2hou/blink-copilot" },
    { src = "https://github.com/scottmckendry/cyberdream.nvim" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/echasnovski/mini.icons" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/seblyng/roslyn.nvim" },
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
    { src = "https://github.com/folke/trouble.nvim" },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    once = true,
    callback = function()
        vim.pack.add({
            { src = "https://github.com/OXY2DEV/markview.nvim" },
        })
        require("plugins.markview")
    end
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    once = true,
    callback = function()
        vim.pack.add({
            { src = "https://github.com/zbirenbaum/copilot.lua" },
        })
        require("plugins.copilot")
    end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
    once = true,
    pattern = "*.env*",
    callback = function()
        vim.pack.add({
            { src = "https://github.com/laytan/cloak.nvim" },
            require("plugins.cloak")
        })
    end,
})

require("plugins.icons")
require("plugins.cyberdream")
require("plugins.blink-cmp")
require("plugins.fzf")
require("plugins.lsp")
require("plugins.oil")
require("plugins.roslyn")
require("plugins.treesitter")
require("plugins.trouble")
