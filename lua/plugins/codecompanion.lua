return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            -- require("codecompanion").setup({
            --     provider = "deepseek",                   -- 指定使用 DeepSeek
            --     api_key = os.getenv("DEEPSEEK_API_KEY"),
            --     -- 可选配置
            --     model = "text-davinci-003",  -- DeepSeek 模型名称，可换
            --     chat = {
            --         enabled = true,            -- 启用聊天模式
            --     },
            --     transform = {
            --         enabled = true,            -- 启用代码改写模式
            --     },
            -- })

            local use_deepseek, use_gemini = true, false
            if use_deepseek then 
                require("codecompanion").setup({
                    opts = {
                        language = "Chinese",
                    },
                    adapters = {
                        -- 1. 定义 DeepSeek 适配器
                        deepseek = function()
                            return require("codecompanion.adapters").extend("deepseek", {
                                env = {
                                    api_key = os.getevn("DEEPSEEK_API_KEY"), -- 或者使用 os.getenv("DEEPSEEK_API_KEY")
                                },
                            })
                        end,
                    },
                    strategies = {
                        -- 2. 将所有策略切换为 deepseek，彻底摆脱 Copilot 依赖
                        chat = { adapter = "deepseek" },
                        inline = { adapter = "deepseek" },
                        agent = { adapter = "deepseek" },
                    },
                    -- 🔹 窗口放到右侧
                    display = {
                        chat = {
                            window = {
                                layout = "vertical", -- 垂直布局（即左右分屏）
                                side = "right",      -- 放在右侧
                                width = 0.3,         -- 占据屏幕 30% 的宽度
                            },
                        },
                    },
                    -- 功能启用
                    features = {
                        transform = true,
                        chat = true,
                        explain = true,
                        debug = true,
                        inline = true,  -- 内联模式
                    },
                })
            elseif use_gemini then
                require("codecompanion").setup({
                    adapters = {
                        -- 定义 gemini 适配器
                        gemini = function()
                            return require("codecompanion.adapters").extend("gemini", {
                                env = {
                                    api_key = os.getenv("GEMINI_API_KEY"), -- 建议从环境变量读取
                                },
                                schema = {
                                    model = {
                                        default = "gemini-1.5-pro", -- 或者使用 "gemini-1.5-flash" 速度更快
                                    },
                                },
                            })
                        end,
                    },
                    strategies = {
                        -- 核心：将所有默认策略指向 gemini，从而彻底绕过 Copilot
                        chat = { adapter = "gemini" },
                        inline = { adapter = "gemini" },
                        agent = { adapter = "gemini" },
                    },
                    -- 🔹 窗口放到右侧
                    display = {
                        chat = {
                            window = {
                                layout = "vertical", -- 垂直布局（即左右分屏）
                                side = "right",      -- 放在右侧
                                width = 0.3,         -- 占据屏幕 30% 的宽度
                            },
                        },
                    },
                    -- 功能启用
                    features = {
                        transform = true,
                        chat = true,
                        explain = true,
                        debug = true,
                        inline = true,  -- 内联模式
                    },
                })
            end
        end,
    },
    -- 2. 渲染 Markdown 内容
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" },
        config = function()
            require("render-markdown").setup()
        end,
    },
    -- 3. 提供浮窗 Markdown 预览
    {
        "OXY2DEV/markview.nvim",
        opts = {
            preview = {
                filetypes = { "markdown", "codecompanion" },
                border = "rounded",
                max_width = 80,
            },
        },
    },
}
