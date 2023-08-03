local lazy = require("lazy")
local plugins = {
    "nvim-lua/plenary.nvim",

    -- colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeFindFileToggle","NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require("nvim-tree").setup()
        end,
    },

    -- icons, for UI related plugins
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },

    -- syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.configs.treesitter")
        end,
    },

    -- buffer + tab line
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        config = function()
            require("plugins.configs.bufferline")
        end,
    },

    -- statusline

    {
        "echasnovski/mini.statusline",
        lazy = false,
        config = function()
            require("mini.statusline").setup({ set_vim_settings = false })
        end,
    },

    -- we use cmp plugin only when in insert mode
    -- so lets lazyload it at InsertEnter event, to know all the events check h-events
    -- completion , now all of these plugins are dependent on cmp, we load them after cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- cmp sources
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",

            -- snippets
            --list of default snippets
            "rafamadriz/friendly-snippets",

            -- snippets engine
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },

            -- autopairs , autocompletes ()[] etc
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup()

                    --  cmp integration
                    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                    local cmp = require("cmp")
                    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
        },
        config = function()
            require("plugins.configs.cmp")
        end,
    },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall" },
        config = function()
            require("mason").setup()
        end,
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.configs.lspconfig")
        end,
        dependencies = {
            -- formatting , linting
            {
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                'b0o/schemastore.nvim',
                'folke/lsp-colors.nvim',
                'jose-elias-alvarez/null-ls.nvim',
                'jayp0521/mason-null-ls.nvim',
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require("plugins.configs.null")
                end,
            },
        },
    },

    -- indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("indent_blankline").setup()
        end,
    },

    -- files finder etc
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("plugins.configs.telescope")
        end,
    },

    -- git status on signcolumn etc
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- comment plugin
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    -- Add, change, and delete surrouding text
    "tpope/vim-surround",

    -- Adds :Rename, :SudoWrite
    "tpope/vim-eunuch",

    -- Adds [b and other handy mappings
    "tpope/vim-unimpaired",

    -- Jump to the last location when opening a file
    "farmergreg/vim-lastplace",

    -- Allow plugins to enable repeating of commands
    "tpope/vim-repeat",

    -- Indent autodetection with editorconfig support
    "tpope/vim-sleuth",

    -- Add more language support
    "sheerun/vim-polyglot",

    -- Automatically create parent dirs when saving
    "jessarcher/vim-heritage",

    -- Enale * searching with visually selected text
    "nelstrom/vim-visual-star-search",

    -- Automatically fix indentation when pasting code
    {
        "sickill/vim-pasta",
        config = function()
            vim.g.pasta_disable_filetypes = { "fugitive" }
        end,
    },

    -- Terminal toggle
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
        cmd = "ToggleTerm",
    },

    -- LazyGit integration
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Which key for the noobs
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    -- Glow for md files
    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow",
    },

    -- Color picker
    {
        "uga-rosa/ccc.nvim",
        lazy = false,
        config = function()
            require("ccc").setup()
        end,
    },

    -- Highlight same colors
    {
        "rrethy/vim-illuminate",
        lazy = false,
        config = function()
            require("plugins.configs.vim-illuminate")
        end,
    },

    -- Smooth scrolling
    {
        "karb94/neoscroll.nvim",
        lazy = false,
        config = function()
            require("neoscroll").setup()
        end,
    },

    -- Add a scrollbar
    {
        "petertriho/nvim-scrollbar",
        lazy = false,
        config = function()
            require("scrollbar").setup()
        end,
    },

    -- Add Zenmode
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
    },

    -- TODO: comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        'phpactor/phpactor',
        ft = 'php',
        build = 'composer install --no-dev --optimize-autoloader',
        config = function()
            vim.keymap.set('n', '<leader>pm', ':PhpactorContextMenu<CR>')
            vim.keymap.set('n', '<leader>pn', ':PhpactorClassNew<CR>')
        end,
    }
}

require("lazy").setup(plugins, require("plugins.configs.lazy"))
