return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local projects = {
        action = "Telescope projects",
        desc = " Projects",
        icon = " ",
        key = "p",
      }

      projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
      projects.key_format = "  %s"

      table.insert(opts.config.center, 3, projects)
    end,
  },

  -- {
  --   "coffebar/neovim-project",
  --   opts = {
  --     projects = dofile(os.getenv("HOME") .. "/projects/project-list.lua"),
  --     last_session_on_startup = false,
  --   },
  --   init = function()
  --     -- enable saving the state of plugins in the session
  --     vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  --   end,
  --   dependencies = {
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-telescope/telescope.nvim" },
  --     { "Shatur/neovim-session-manager" },
  --   },
  --   keys = {
  --     { "<leader>fp", "<cmd>Telescope neovim-project history<cr>", desc = "Project history" },
  --     { "<leader>fP", "<cmd>Telescope neovim-project discover<cr>", desc = "Project discover" },
  --   },
  --   lazy = false,
  --   priority = 100,
  -- },
  -- {
  --   "nvimdev/dashboard-nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     local projects = {
  --       action = "Telescope neovim-project history",
  --       desc = " Projects",
  --       icon = " ",
  --       key = "p",
  --     }
  --
  --     projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
  --     projects.key_format = "  %s"
  --
  --     table.insert(opts.config.center, 3, projects)
  --   end,
  -- },
}
