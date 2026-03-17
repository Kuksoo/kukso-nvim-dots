local map = vim.keymap.set

-- [ General ]
map("i", "jj", "<Esc>")
map("n", "<leader>sv", function()
    local name = vim.fn.expand("%:t:r")
    package.loaded[name] = nil
    vim.cmd("source " .. vim.fn.expand("%:p"))
    vim.notify("Config Reloaded: " .. name)
end, { desc = "Reload current file" })

-- [ Navigation ]
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- [ Tabs ]
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")
map("n", "<leader>x", function() Snacks.bufdelete() end, { desc = "Close buffer" })
for i = 1, 9 do
    map("n", string.format("<A-%s>", i), string.format("<Cmd>BufferLineGoToBuffer %s<CR>", i))
end

-- [ File explorer ]
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- [ Snacks Picker (Search) ]
map("n", "<leader><space>", function() Snacks.picker.smart() end)
map("n", "<leader>ff", function() Snacks.picker.files() end)
map("n", "<leader>fg", function() Snacks.picker.grep() end)
map("n", "<leader>fb", function() Snacks.picker.buffers() end)
map("n", "<leader>?", function() Snacks.picker.keymaps() end)

-- [ Utilities ]
map("n", "<leader>un", function() Snacks.notifier.hide() end)
map("n", "<leader>ch", function()
    Snacks.win({
        file = vim.fn.stdpath("config") .. "/lua/config/cheatsheet.md",
        width = 0.6,
        height = 0.7,
        border = "rounded",
        wo = {
            conceallevel = 3,
            concealcursor = "nvic",
            spell = false,
            number = false,
            relativenumber = false,
            signcolumn = "no",
        },
        bo = {
            filetype = "markdown",
            modifiable = false,
            buftype = "nofile",
        },
        on_win = function(win)
            vim.schedule(function()
                if not vim.api.nvim_win_is_valid(win.win) then return end
                vim.wo[win.win].conceallevel = 3
                vim.wo[win.win].concealcursor = "nvic"
                local ok, _ = pcall(vim.treesitter.start, win.buf, "markdown")
                if not ok then
                    vim.bo[win.buf].syntax = "on"
                end
            end)
        end,
    })
end)
