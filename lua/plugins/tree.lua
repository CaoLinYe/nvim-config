return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("nvim-tree").setup({
                filters = {
                    dotfiles = true,          -- 是否隐藏点文件（.gitignore 文件）
                    custom = {
                        ".*\\.meta$", "^node_modules$",
                    },
                },
                renderer = {
                    icons = {
                        show = {
                            file = false,
                            folder = false,
                            git = false,
                        },
                    },
                },
            })
        end,
    },
}
