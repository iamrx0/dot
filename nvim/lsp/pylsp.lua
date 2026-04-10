return {
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "requirements.txt" },
    settings = {
        pylsp = {
            configurationSources = {},
            plugins = {
                rope_autoimport = { enabled = false },
                ruff = {
                    enabled = true,
                    formatEnabled = true,
                    executable = "ruff",
                },
                pycodestyle = {
                    enabled = false,
                },
                mccabe = {
                    enabled = false,
                },
                pyflakes = {
                    enabled = false,
                },
                autopep8 = {
                    enabled = false,
                },
                black = {
                    enabled = false,
                },
                flake8 = {
                    enabled = false,
                },
                yapf = {
                    enabled = false,
                },
            },
        },
    },
}
