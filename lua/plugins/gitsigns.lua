return {
    "lewis6991/gitsigns.nvim",

    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },

            signcolumn = true,  -- 左侧显示 git 标记
            numhl = false,      -- 是否高亮行号（可改 true）
            linehl = false,     -- 是否整行高亮

            current_line_blame = true, -- ⭐ 实时显示 blame（很有用）
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 300,
            },

            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },

            attach_to_untracked = true,

            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, {
                        buffer = bufnr,
                        desc = desc,
                    })
                end

                -- 跳转 hunk
                map("n", "]c", gs.next_hunk, "Next hunk")
                map("n", "[c", gs.prev_hunk, "Prev hunk")

                -- 查看 diff
                map("n", "<leader>gd", gs.preview_hunk, "Preview hunk diff")

                -- stage / undo
                map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
                map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")

                -- stage entire buffer
                map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")

                -- reset
                map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
                map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

                -- blame 当前行
                map("n", "<leader>gb", function()
                    gs.blame_line({ full = true })
                end, "Blame line")

                -- diff this file
                map("n", "<leader>gD", gs.diffthis, "Diff this file")
            end,
        })
    end,
}
