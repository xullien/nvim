require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "vim", "vimdoc", "tsx", "html", "css", "typescript", "javascript", "php" },
    autotag = {
        enable = true,
        filetype = { 'blade' },
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = { enable = true },

    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["if"] = "@function.inner",
          ["af"] = "@function.outer",
          ["ic"] = "@class.inner",
          ["ac"] = "@class.outer",
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
    },
    context_commentstring = {
      enable = true,
    },
}
