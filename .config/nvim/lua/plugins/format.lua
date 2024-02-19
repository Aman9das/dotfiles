return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- r formatter
        ["r"] = { "rprettify" },
        ["python"] = { "black" },
        ["quarto"] = { "mdformat" },
        ["rmd"] = { "mdformat" },
        ["md"] = { "mdformat" },
        ["*"] = { "codespell", "trim_whitespace", "trim_newlines" },
      },
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
