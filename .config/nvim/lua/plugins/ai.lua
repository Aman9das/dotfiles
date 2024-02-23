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

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "bw get notes chatgpt-nvim-secret-key --nointeraction --session j1h551YdVAIQRWmzey+EhEFY4t7JLRNd3co1cWc0X8ldnl4pkO3gY7oGCe1+XBvWwtZh6f57ycNS+ZnRDZabrg==",
        popup_layout = {
          default = "right",
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
