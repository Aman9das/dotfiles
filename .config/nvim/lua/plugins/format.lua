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
        ["*"] = { "typos", "trim_whitespace", "trim_newlines" },
      },
      formatters = {
        rprettify = {
          timeout_ms = 10000,
          inherit = false,
          stdin = false,
          command = "rprettify",
          args = { "$FILENAME" },
        },
      },
    },
  },
}
