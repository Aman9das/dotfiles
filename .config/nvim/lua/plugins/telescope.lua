return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults.hidden = true
      -- return {
      --   defaults = {
      --     hidden = true,
      --   },
    end,
  },
}
