return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- clangd
            vim.lsp.config("clangd", {
                cmd = { "/opt/local/bin/clangd-mp-17" },
                capabilities = capabilities,
            })
            vim.lsp.enable("clangd")

            -- pyright
            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })
            vim.lsp.enable("pyright")
        end,
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "pyright" },
            })
        end,
    },
}
