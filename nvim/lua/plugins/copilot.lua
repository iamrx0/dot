require('copilot').setup({
    panel = { enabled = false },
    suggestion = { enabled = false },
    filetypes = {
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        ["."] = true,
    },
    copilot_node_command = 'node',
    server_opts_overrides = {},
})
