return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local use_deepseek, use_gemini = true, false
            local cfg_data = {
                opts = {
                    language = "Chinese",
                },
                adapters = {
                    -- 1. 定义 DeepSeek 适配器
                    deepseek = function()
                        return require("codecompanion.adapters").extend("deepseek", {
                            env = {
                                api_key = os.getenv("DEEPSEEK_API_KEY"), -- 或者使用 os.getenv("DEEPSEEK_API_KEY")
                            },
                        })
                    end,
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
                    -- 2. 将所有策略切换为 deepseek，彻底摆脱 Copilot 依赖
                    chat = { adapter = "deepseek" },
                    inline = { adapter = "deepseek" },
                    agent = { adapter = "deepseek" },
                },
                -- 🔹 窗口放到右侧
                display = {
                    chat = {
                        window = {
                            position = "right",   -- 可选: "left" | "right" | "top" | "bottom"
                            width = 60,           -- 窗口宽度 (列数)
                            height = 30,          -- 窗口高度 (行数)
                            border = "rounded",   -- 边框样式: "none", "single", "double", "rounded"
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
            }

            if use_deepseek then
                cfg_data.strategies = {
                    -- 2. 将所有策略切换为 deepseek，彻底摆脱 Copilot 依赖
                    -- chat = { adapter = "deepseek" },
                    -- inline = { adapter = "deepseek" },
                    agent = { adapter = "deepseek" },
                    chat = { adapter = { name = "deepseek", model = "deepseek-chat" } },
                    inline = { adapter = { name = "deepseek", model = "deepseek-reasoner" } },
                }
            elseif use_gemini then
                cfg_data.strategies = {
                    -- 核心：将所有默认策略指向 gemini，从而彻底绕过 Copilot
                    chat = { adapter = "gemini" },
                    inline = { adapter = "gemini" },
                    agent = { adapter = "gemini" },
                }
            end
            require("codecompanion").setup(cfg_data);
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
