return {
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    keys = {
      {
        "<leader>fp",
        function() require("telescope").extensions.project.project {} end,
        desc = "Projects",
      },
    },
  }
}
