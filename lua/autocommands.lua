function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup '..group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

local autocmds = {
   gofiles = {
				{ "BufEnter", "*.go", "nmap <leader>tt   <Plug>(go-test)"};
				{ "BufEnter", "*.go", "nmap <leader>t    <Plug>(go-test-func)"};
				{ "BufEnter", "*.go", "nmap <leader>i    <Plug>(go-implements)"};
				{ "BufEnter", "*.go", "nmap <leader>c    <Plug>(go-callers)"};
				{ "BufEnter", "*.go", "nmap <leader>r    <Plug>(go-rename)"};
				{ "BufEnter", "*.go", "nmap <leader>ref  <Plug>(go-referrers)"};
				{ "BufEnter", "*.go", "nmap <leader>gd   <Plug>(go-def-vertical)"};
				{ "BufEnter", "*.go", "nmap <leader>alt  <Plug>(go-alternate-vertical)"};
				{ "BufEnter", "*.go", "nmap <leader>fill :GoFillStruct<CR>"};
				{ "BufEnter", "*.go", "nmap <leader>b    :GoDebugBreakpoint<CR>"};
				{ "BufEnter", "*.go", "nmap <leader>dt   :GoDebugTestFunc<CR>"};
				{ "BufEnter", "*.go", "nmap gd           :GoDef<CR>"};
    };
}

nvim_create_augroups(autocmds)

