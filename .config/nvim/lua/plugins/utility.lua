return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.trailspace').setup()
    end,
    init = function()
      vim.g.minitrailspace_disable = true -- disable trailing spaces
    end
  },
}
