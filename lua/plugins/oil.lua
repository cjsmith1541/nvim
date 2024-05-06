return {
  'stevearc/oil.nvim',
  opts = {
       keymaps = {
            ["<leader>p"] = "actions.preview",
            ["<C-p>"] = false
        }
    },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
