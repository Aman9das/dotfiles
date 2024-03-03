return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = "",
        component_separators = "",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "copy path to clipboard",
          },
          ["="] = {
            function(state)
              local path = state.path -- this gives you the path

              -- do whatever you want to do here
              vim.fn.chdir(path)
            end,
            desc = "cd to current root",
          },
        },
      },
    },
  },
}
