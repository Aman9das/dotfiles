return {
  -- oatmeal ollama client
  {
    "dustinblackman/oatmeal.nvim",
    cmd = { "Oatmeal" },
    keys = {
      { "<leader>o", desc = "other" },
      { "<leader>om", mode = "n", desc = "Oatmeal session" },
      { "<leader>om", mode = "v", desc = "Oatmeal session on chunk" },
    },
    opts = {
      backend = "ollama",
      model = "codellama:7b",
      theme_file = "/var/home/aman/.cache/oatmeal/base16-tomorrow-night.tmTheme",
    },
  },
}
