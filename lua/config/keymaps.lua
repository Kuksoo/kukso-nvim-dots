local map = vim.keymap.set

-- [ Общее ]
map("i", "jj", "<Esc>")
map("n", "<leader>sv", function()
    local name = vim.fn.expand("%:t:r")
    package.loaded[name] = nil
    vim.cmd("source " .. vim.fn.expand("%:p"))
    vim.notify("Config Reloaded: " .. name)
end, { desc = "Reload current file" })

-- [ Навигация между окнами ]
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- [ Буферы (Вкладки) ]
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")
map("n", "<leader>x", function() Snacks.bufdelete() end, { desc = "Close buffer" })
for i = 1, 9 do
    map("n", string.format("<A-%s>", i), string.format("<Cmd>BufferLineGoToBuffer %s<CR>", i))
end

-- [ Проводник ]
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- [ Snacks Picker (Поиск) ]
map("n", "<leader><space>", function() Snacks.picker.smart() end)
map("n", "<leader>ff", function() Snacks.picker.files() end)
map("n", "<leader>fg", function() Snacks.picker.grep() end)
map("n", "<leader>fb", function() Snacks.picker.buffers() end)
map("n", "<leader>?", function() Snacks.picker.keymaps() end)

-- [ Утилиты ]
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
            filetype = "markdown", -- Оставляем только маркдаун
            modifiable = false,
            buftype = "nofile",    -- Меняем help на nofile, чтобы не было конфликтов
        },
        on_win = function(win)
            -- Форсируем настройки через schedule (после полной отрисовки)
            vim.schedule(function()
                if not vim.api.nvim_win_is_valid(win.win) then return end
                
                -- Принудительно выставляем опции окна еще раз
                vim.wo[win.win].conceallevel = 3
                vim.wo[win.win].concealcursor = "nvic"
                
                -- Включаем Treesitter если он почему-то не завелся
                local ok, _ = pcall(vim.treesitter.start, win.buf, "markdown")
                if not ok then
                    vim.bo[win.buf].syntax = "on"
                end
            end)
        end,
    })
end)
