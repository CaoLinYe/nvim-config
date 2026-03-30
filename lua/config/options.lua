-- 基础 UI
vim.opt.number = true              -- 显示行号
vim.opt.relativenumber = false      -- 相对行号
vim.opt.cursorline = true          -- 高亮当前行
vim.opt.wrap = false               -- 不换行
vim.opt.signcolumn = "yes"         -- 始终显示 sign column
vim.opt.scrolloff = 8              -- 上下预留行
vim.opt.sidescrolloff = 8

-- 搜索
vim.opt.ignorecase = true          -- 忽略大小写
vim.opt.smartcase = true           -- 智能大小写
vim.opt.incsearch = true           -- 增量搜索
vim.opt.hlsearch = true            -- 高亮搜索结果

-- 缩进 & Tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- 文件 & 备份
vim.opt.swapfile = false           -- 关闭 swapfile
vim.opt.backup = false             -- 关闭备份
vim.opt.undofile = true            -- 打开 undo 文件
vim.opt.updatetime = 300           -- CursorHold 延迟
vim.opt.encoding = "utf-8"

vim.opt.foldmethod = "indent"

-- 剪贴板
vim.opt.clipboard = "unnamedplus"  -- 系统剪贴板


