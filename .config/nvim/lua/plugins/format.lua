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
        ["markdown"] = { "mdformat" },
        ["css"] = { "prettierd" },
        ["*"] = { "typos", "trim_whitespace", "trim_newlines" },
      },
      formatters = {
        rprettify = {
          timeout_ms = nil,
          inherit = false,
          stdin = false,
          command = "rprettify",
          args = { "$FILENAME" },
        },
      },
      log_level = vim.log.levels.DEBUG,
      format = {
        timeout_ms = nil,
      },
    },
  },
}
