return {
  {
    "hrsh7th/nvim-cmp",
    branch = "main",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-calc" },
      { "hrsh7th/cmp-emoji" },
      { "saadparwaiz1/cmp_luasnip" },
      { "f3fora/cmp-spell" },
      { "ray-x/cmp-treesitter" },
      { "kdheepak/cmp-latex-symbols" },
      { "jmbuhr/cmp-pandoc-references" },
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
      { "onsails/lspkind-nvim" },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      lspkind.init()

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "otter" }, -- for code chunks in quarto
        -- { name = "path" },
        -- { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip", keyword_length = 3, max_item_count = 3 },
        { name = "pandoc_references" },
        { name = "buffer", keyword_length = 5, max_item_count = 3 },
        { name = "spell" },
        { name = "treesitter", keyword_length = 5, max_item_count = 3 },
        { name = "calc" },
        { name = "latex_symbols" },
        { name = "emoji" },
      }))

      -- for friendly snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      -- for custom snippets
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snips" } })
      -- link quarto and rmarkdown to markdown snippets
      luasnip.filetype_extend("quarto", { "markdown" })
      luasnip.filetype_extend("rmarkdown", { "markdown" })
    end,
  },
}
