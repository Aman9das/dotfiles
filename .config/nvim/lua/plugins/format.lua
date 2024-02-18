return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- r formatter
        ["r"] = { "rprettify", "styler" },
        ["python"] = { "black" },
        ["rmd"] = { "rprettify", "styler" },
        ["qmd"] = { "rprettify", "black" },
        ["*"] = { "codespell" },
      },
      log_level = vim.log.levels.DEBUG,
      formatters = {
        rprettify = {
          inherit = false,
          stdin = false,
          command = "rprettify",
          args = { "$FILENAME" },
        },
      },
    },
  },
}
