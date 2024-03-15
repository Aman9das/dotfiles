return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    opts = {
      formatters_by_ft = {
        -- r formatter
        ["r"] = { "rprettify" },
        ["python"] = { "black" },
        ["quarto"] = { "rprettify", "mdformat" },
        ["rmd"] = { "rprettify", "mdformat" },
        ["markdown"] = { "mdformat" },
        ["css"] = { "prettierd" },
        ["*"] = { "typos", "trim_whitespace", "trim_newlines" },
      },
      formatters = {
        rprettify = {
          inherit = false,
          stdin = false,
          command = "rprettify",
          args = { "$FILENAME" },
        },
      },
      log_level = vim.log.levels.DEBUG,
      format = {
        timeout_ms = 10000,
      },
    },
  },
}
