-- This is a config that can be merged with your
-- existing LazyVim config.
--
-- It configures all plugins necessary for quarto-nvim,
-- such as adding its code completion source to the
-- completion engine nvim-cmp.
-- Thus, instead of having to change your configuration entirely,
-- this takes your existings config and adds on top where necessary.

return {

  -- this taps into vim.ui.select and vim.ui.input
  -- and in doing so currently breaks renaming in otter.nvim
  { "stevearc/dressing.nvim", enabled = false },

  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "html", "lua" },
      },
      codeRunner = {
        enabled = true,
        default_method = "slime", -- "molten" or "slime"
      },
      keymap = {
        rename = "<leader>qR",
        format = "<leader>qf",
      },
    },
    ft = "quarto",
    keys = {
      { "<leader><cr>", ":SlimeSend<cr>", desc = "send code chunk" },
      { "<c-cr>", ":SlimeSend<cr>", desc = "send code chunk" },
      { "<c-cr>", "<esc>:SlimeSend<cr>i", mode = "i", desc = "send code chunk" },
      { "<c-cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
      { "<cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
      { "<leader>ct", desc = "terminal" },
      { "<leader>ctr", ":split term://R<cr>", desc = "terminal: R" },
      { "<leader>ctR", ":split term://radian<cr>", desc = "terminal: radian" },
      { "<leader>cti", ":split term://ipython<cr>", desc = "terminal: ipython" },
      { "<leader>ctp", ":split term://python<cr>", desc = "terminal: python" },
      { "<leader>ctj", ":split term://julia<cr>", desc = "terminal: julia" },
    },
  },

  {
    "jmbuhr/otter.nvim",
    lazy = true,
    dependencies = {
      "hrsh7th/nvim-cmp", -- optional, for completion
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      buffers = {
        set_filetype = true,
      },
    },
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "jmbuhr/otter.nvim" },
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "otter" } }))
  --   end,
  -- },

  -- send code from python/r/qmd documents to a terminal or REPL
  -- like ipython, R, bash
  {
    "jpalardy/vim-slime",
    init = function()
      vim.b["quarto_is_" .. "python" .. "_chunk"] = false
      Quarto_is_in_python_chunk = function()
        require("otter.tools.functions").is_otter_language_context("python")
      end

      vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      return a:text
      end
      endfunction
      ]])

      local function mark_terminal()
        vim.g.slime_last_channel = vim.b.terminal_job_id
        vim.print(vim.g.slime_last_channel)
      end

      local function set_terminal()
        vim.b.slime_config = { jobid = vim.g.slime_last_channel }
      end

      -- slime, neovvim terminal
      vim.g.slime_target = "neovim"
      vim.g.slime_python_ipython = 1

      require("which-key").register({
        ["<leader>cM"] = { mark_terminal, "mark terminal" },
        ["<leader>cS"] = { set_terminal, "set terminal" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        r_language_server = {},
        julials = {},
        marksman = {
          -- alsm needs:
          -- $home/.config/marksman/config.toml :
          -- [core]
          -- markdown.file_extensions = ["md", "markdown", "qmd"]
          filetypes = { "markdown", "quarto" },
          root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "bash",
        "html",
        "css",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "vim",
        "yaml",
        "python",
        "julia",
        "r",
      },
    },
  },

  -- paste an image from the clipboard or drag-and-drop
  {
    "HakonHarnes/img-clip.nvim",
    lazy = true,
    event = "BufEnter",
    opts = {
      filetypes = {
        quarto = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",

          drag_and_drop = {
            download_images = false,
          },
        },
      },
    },
  },

  -- preview equations
  {
    "jbyuki/nabla.nvim",
    lazy = true,
    keys = {
      { "<leader>oE", ':lua require"nabla".toggle_virt()<cr>', "toggle equations" },
      { "<leader>oe", ':lua require"nabla".popup()<cr>', "hover equation" },
    },
  },
}
