return {
    {
        "Exafunction/codeium.vim",
        event = "InsertEnter",
        config = function()
            -- 关闭默认 Tab 映射（推荐）
            vim.g.codeium_disable_bindings = 1
        end,
    },
}
