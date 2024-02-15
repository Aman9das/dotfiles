require("neo-tree").setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      -- always_show = {
      --   ".config",
      --   ".gitignore*",
      --   ".zshrc"
      -- }
    }
  }
}
