-- This is a config that can be merged with your
-- existing LazyVim config.
--
-- It configures all plugins necessary for quarto-nvim,
-- such as adding its code completion source to the
-- completion engine nvim-cmp.
-- Thus, instead of having to change your configuration entirely,
-- this takes your existings config and adds on top where necessary.

return {

  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto" },
    dev = false,
    opts = {
      lspFeatures = {
        languages = {
          "r",
          "python",
          "julia",
          "bash",
          "lua",
          "html",
          "dot",
          "javascript",
          "typescript",
          "ojs",
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "slime",
      },
      keymap = {
        rename = "<leader>qR",
        format = "<leader>qf",
      },
    },
    dependencies = {
      "jmbuhr/otter.nvim",
    },
    keys = {
      { "<leader><cr>", ":QuartoSend<cr>", desc = "send code chunk" },
      { "<c-cr>", ":QuartoSend<cr>", desc = "send code chunk" },
      {
        "<c-cr>",
        "<esc>:QuartoSend<cr>a",
        mode = "i",
        desc = "send code chunk",
      },
      {
        "<c-cr>",
        "<Plug>SlimeSend<cr>",
        mode = "v",
        desc = "send code chunk",
      },
      {
        "<cr>",
        "<Plug>SlimeSend<cr>",
        mode = "v",
        desc = "send code chunk",
      },
      { "<leader>ct", desc = "terminal" },
      { "<leader>ctR", ":vsplit term://R<cr>", desc = "terminal: R" },
      {
        "<leader>ctr",
        ":vs term://radian --profile=~/.config/nvim/extras/.radian_profile<cr>",
        desc = "terminal: radian",
      },
      {
        "<leader>cti",
        ":vsplit term://ipython<cr>",
        desc = "terminal: ipython",
      },
      { "<leader>ctp", ":vsplit term://python<cr>", desc = "terminal: python" },
      { "<leader>ctj", ":vsplit term://julia<cr>", desc = "terminal: julia" },
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
      handle_leading_whitespace = true,
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

  -- send code from python/r/qmd documets to a terminal or REPL
  -- like ipython, R, bash
  {
    "jpalardy/vim-slime",
    init = function()
      vim.b["quarto_is_python_chunk"] = false
      Quarto_is_in_python_chunk = function()
        require("otter.tools.functions").is_otter_language_context("python")
      end
      vim.b["quarto_is_" .. "r" .. "_chunk"] = false
      Quarto_is_in_r_chunk = function()
        require("otter.tools.functions").is_otter_language_context("r")
      end

      vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      call v:lua.Quarto_is_in_r_chunk()

      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      return [a:text]
      end

      endfunction
      ]])

      vim.g.slime_target = "neovim"
      vim.g.slime_python_ipython = 1
    end,
    config = function()
      local function mark_terminal()
        vim.g.slime_last_channel = vim.b.terminal_job_id
        print("terminal job id: " .. vim.b.terminal_job_id)
      end

      local function set_terminal()
        vim.b.slime_config = { jobid = vim.g.slime_last_channel }
      end
      vim.keymap.set(
        "n",
        "<leader>cM",
        mark_terminal,
        { desc = "mark terminal" }
      )
      vim.keymap.set("n", "<leader>cs", set_terminal, { desc = "set terminal" })
    end,
  },

  -- paste an image from the clipboard or drag-and-drop
  {
    "HakonHarnes/img-clip.nvim",
    event = "BufEnter",
    opts = {
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",
          drag_and_drop = {
            download_images = false,
          },
        },
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

  -- paste an image from the clipboard or drag-and-drop
  {
    "HakonHarnes/img-clip.nvim",
    event = "BufEnter",
    opts = {
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",
          drag_and_drop = {
            download_images = false,
          },
        },
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
    keys = {
      {
        "<leader>oe",
        ':lua require"nabla".toggle_virt()<cr>',
        desc = "toggle math equations",
      },
    },
  },

  {
    "benlubas/molten-nvim",
    enabled = false,
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
    end,
    keys = {
      { "<leader>mi", ":MoltenInit<cr>", desc = "[m]olten [i]nit" },
      {
        "<leader>mv",
        ":<C-u>MoltenEvaluateVisual<cr>",
        mode = "v",
        desc = "molten eval visual",
      },
      {
        "<leader>mr",
        ":MoltenReevaluateCell<cr>",
        desc = "molten re-eval cell",
      },
    },
  },
}
