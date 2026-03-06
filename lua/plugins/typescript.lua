return {
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("typescript-tools").setup({
                capabilities = capabilities,

                settings = {
                    tsserver_file_preferences = {
                        includeInlayParameterNameHints = "all",
                        includeInlayVariableTypeHints = true,
                    },
                },
            })

        end,
    },
}
