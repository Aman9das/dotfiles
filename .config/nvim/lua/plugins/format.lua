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
          inherit = false,
          stdin = false,
          command = "rprettify",
          args = { "$FILENAME" },
        },
      },
    },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Chunk",
      },
      {
        "<leader>cF",
        function()
          -- This file is automatically loaded by lazyvim.config.init
          local Util = require("lazyvim.util")
          Util.format({ force = true })
        end,
        mode = { "n", "v" },
        desc = "Format Document",
      },
    },
  },
}
