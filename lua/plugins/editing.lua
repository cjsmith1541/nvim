return{
    {
        'christoomey/vim-tmux-navigator', event = "BufReadPre"
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
    'numToStr/Comment.nvim',
    lazy = false,
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    {
        "Pocco81/auto-save.nvim",
    },
    {
        'mbbill/undotree',
    },
    {
        "folke/zen-mode.nvim",
    },
    {
        'norcalli/nvim-colorizer.lua'
    },
    {
        'HiPhish/rainbow-delimiters.nvim'
    },
    {
        'tpope/vim-surround',
    },
    {
        'rmagatti/auto-session',
    },
    {
        'jbyuki/nabla.nvim',
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup { scope = { highlight = highlight } }

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    }
}
