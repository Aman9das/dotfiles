return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "typos",
        "mdformat",
        -- "cbfmt",
        -- "codespell"
        "r-languageserver",
        "pyright",
        "json-lsp",
        "texlab",
        "prettierd",
        "yaml-language-server",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        r_language_server = {},
        julials = {},
        marksman = {
          -- also needs:
          -- $home/.config/marksman/config.toml :
          -- [core]
          -- markdown.file_extensions = ["md", "markdown", "qmd"]
          filetypes = { "markdown", "quarto" },
          root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "r",
        "python",
        "markdown",
        "markdown_inline",
        "julia",
        "bash",
        "yaml",
        "lua",
        "vim",
        "query",
        "vimdoc",
        "latex",
        "html",
        "css",
        "dot",
        "javascript",
        "mermaid",
        "norg",
        "typescript",
        "c",
        "json",
        "luadoc",
        "luap",
        "regex",
        "tsx",
      },
    },
  },
}
