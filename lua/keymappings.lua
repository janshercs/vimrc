function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- clear highlights
map("n", "<C-space>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR>", { silent = true })

-- window navigation
map("n", "<C-k>", ":wincmd k <CR>", { silent = true })
map("n", "<C-j>", ":wincmd j <CR>", { silent = true })
map("n", "<C-h>", ":wincmd h <CR>", { silent = true })
map("n", "<C-l>", ":wincmd l <CR>", { silent = true })

-- telescope
map("n", "<C-p>", ":Telescope git_files<CR>", { silent = true })
map("n", "<C-f>", ":Telescope live_grep<CR>", { silent = true })

-- coc
map("n", "<C-n>", "<Plug>(coc-diagnostic-next)", { silent = true})
