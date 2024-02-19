return {
  -- oatmeal ollama client
  {
    "dustinblackman/oatmeal.nvim",
    cmd = { "Oatmeal" },
    keys = {
      { "<leader>o", desc = "other" },
      { "<leader>om", mode = "n", desc = "Start Oatmeal session" },
      { "<leader>om", mode = "v", desc = "Start Oatmeal session" },
    },
    opts = {
      backend = "ollama",
      model = "deepseek-coder:6.7b",
      theme_file = "/var/home/aman/.cache/oatmeal/base16-tomorrow-night.tmTheme",
    },
  },
}
