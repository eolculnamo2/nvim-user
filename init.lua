-- using stylua for formatting
local config = {
  colorscheme = "onedark",
  options = {
    opt = {
      guicursor = "",
    },
  },
  plugins = {
    {
      "navarasu/onedark.nvim",
      priority = 1000, -- Ensure it loads first
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      lazy = false,
      opts = {
        filesystem = {
          filtered_items = {
            hide_by_pattern = { "*.bs.js", "*/kast-client/**/*.mjs" },
          },
        },
      },
    },
    {
      "declancm/cinnamon.nvim",
      event = { "BufRead", "BufNewFile" },
      config = function() require("cinnamon").setup() end,
    },
    -- {"AstroNvim/astrocommunity", import = "astrocommunity.motion.leap-nvim" },
    { "ggandor/leap.nvim", lazy = false },
    { "stevearc/oil.nvim", lazy = false, config = function() require("oil").setup() end },
    {
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
    },
    -- Neorg
    {
      "nvim-neorg/neorg",
      lazy = false,
      run = ":Neorg sync-parsers",
      config = function()
        vim.keymap.set("n", "<leader>zi", ":Neorg index <CR>", {})
        vim.keymap.set("n", "<leader>zr", ":Neorg return <CR>", {})
        require("neorg").setup {
          load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
              config = {
                workspaces = {
                  work = "~/notes/work",
                  kast = "~/notes/kast",
                  home = "~/notes/home",
                },
                default_workspace = "work",
              },
            },
          },
        }
      end,
    },
    -- blamer (like gitlense)
    { "APZelos/blamer.nvim", lazy = false },
    -- rust tools
    { "simrat39/rust-tools.nvim" },
    -- Elm
    { "ElmCast/elm-vim" },
    { "vim-test/vim-test", lazy = false },
    { "nvim-lspconfig", lazy = false },
    { "rescript-lang/vim-rescript", lazy = false,
        config = function()
        require'lspconfig'.rescriptls.setup{}
      end,},
    { "evanleck/vim-svelte", lazy = false },
    { "itchyny/lightline.vim", lazy = false },
    { "MunifTanjim/prettier.nvim", lazy = false },
    {
      "sindrets/diffview.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      lazy = false,
      --    config = function() require("config.flutter").setup() end,
    },
    ["tamton-aquib/duck.nvim"] = {
      config = function()
        vim.keymap.set("n", "<leader>dd", function() require("duck").hatch() end, {})
        vim.keymap.set("n", "<leader>dk", function() require("duck").cook() end, {})
        vim.keymap.set("n", "<leader>dc", function() require("duck").hatch("🐈", 0.75) end, {})
        vim.keymap.set("n", "<leader>dt", function() require("duck").hatch("🦖", 0.75) end, {})
      end,
    },
  },
  mappings = {
    n = {
      ["<S-l>"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer",
      },
      ["<S-h>"] = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      },
    },
  },
  -- colorscheme = "poimandres",
}
require("leap").add_default_mappings()

return config
