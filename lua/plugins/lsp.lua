return {
    {
        "neovim/nvim-lspconfig", -- 现在更多是提供配置模板
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- C/C++
            vim.lsp.config("clangd", {
                capabilities = capabilities,
            })
            vim.lsp.enable("clangd")

            -- Python
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
