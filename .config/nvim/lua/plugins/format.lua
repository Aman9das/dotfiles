return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- r formatter
        ["r"] = { "rprettify" },
        ["python"] = { "black" },
        ["quarto"] = { "mdformat", "rprettify" },
        ["rmd"] = { "mdformat", "rprettify" },
        ["md"] = { "mdformat", "cbfmt" },
        ["*"] = { "codespell", "trim_whitespace", "trim_newlines" },
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
