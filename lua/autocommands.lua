-- call file by lazy
local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Cange filename in tmux tab
if vim.fn.exists('$TMUX') == 1 then
    vim.api.nvim_create_autocmd({'BufEnter', 'FocusGained'}, {
        pattern = '*',
        callback = function()
            vim.fn.system('tmux rename-window ' .. vim.fn.expand('%:t'))
        end
    })

    vim.api.nvim_create_autocmd({'BufEnter'}, {
        pattern = '*',
        callback = function()
            vim.fn.system('tmux rename-window ' .. vim.fn.expand('%:t'))
        end
    })

    vim.api.nvim_create_autocmd('VimLeave', {
        pattern = '*',
        callback = function()
            vim.fn.system('tmux set automatic-rename on')
        end
    })
end


-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "query",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})
require('Comment').setup()
