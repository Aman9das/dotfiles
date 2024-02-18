return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = {
        -- r formatter
        r = { "styler" },
      }
    end,
    keys = {
      { "<leader>cF", false },
    }
  },
}
