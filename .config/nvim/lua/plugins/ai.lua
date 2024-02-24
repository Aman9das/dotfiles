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

  -- Simple, minimal Lazy.nvim configuration
  {
    "huynle/ogpt.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>og", ":OGPT<CR>", desc = "OGPT" },
    },
    opts = {
      default_provider = "ollama",
      providers = {
        ollama = {
          -- api_host = os.getenv("OLLAMA_API_HOST") or "http://localhost:11434",
          -- api_key = os.getenv("OLLAMA_API_KEY") or "",
          model = {
            name = "deepseek-coder:6.7b",
            system_message = nil,
          },
        },
      },
      popup_layout = {
        default = "right",
      },
      input_window = {
        border = {
          style = "single",
        },
        -- win_options = {
        --   winhighlight = "Normal:FloatBorder,FloatBorder:FloatBorder",
        -- },
      },
      output_window = {
        border = {
          style = "single",
        },
        -- win_options = {
        --   winhighlight = "Normal:FloatBorder,FloatBorder:FloatBorder",
        -- },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
