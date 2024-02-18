return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- r formatter
        ["r"] = { "rprettify" },
        ["python"] = { "black" },
        ["quarto"] = { "markdownlint-cli2", "rprettify", "black" },
        ["rmd"] = { "markdownlint-cli2", "rprettify" },
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
