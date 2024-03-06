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
      },
    },
  },
}
