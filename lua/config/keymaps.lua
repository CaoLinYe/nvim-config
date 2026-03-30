
-- 普通模式窗口移动
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

-- 快捷键
vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat<CR>")   -- 打开 AI 窗口
vim.keymap.set("v", "<leader>ct", ":CodeCompanionTransform<CR>") -- 视觉模式选中代码改写

-- 自定义按键 codeium 智能提示操作 
vim.keymap.set("i", "<C-g>", function()
    return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

vim.keymap.set("i", "<C-;>", function()
    return vim.fn
end, { expr = true, silent = true })

vim.keymap.set("i", "<C-,>", function()
    return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })

vim.keymap.set("i", "<C-x>", function()
    return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })


-- 快捷键
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>")

-- 跳转到定义（替代 gd）
vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { noremap = true, silent = true })
-- 查找引用（替代 gr）
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { noremap = true, silent = true })

vim.keymap.set("n", "<F5>", ":lua cocos_refrush()<CR>", { noremap = true, silent = true })   -- 刷新cocos
