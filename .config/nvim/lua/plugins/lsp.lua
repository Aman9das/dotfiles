return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "codespell",
        "mdformat",
        "cbfmt",
        "r-languageserver",
        "pyright",
      },
    },
  },
}
