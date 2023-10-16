local config = {
  colorscheme = "onedark_vivid",
  options = {
    opt = {
      guicursor = "",
    }
  },
  plugins = {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },
   {"declancm/cinnamon.nvim",
     event = { "BufRead", "BufNewFile" },
     config = function() require('cinnamon').setup() end,
   },
  -- {"AstroNvim/astrocommunity", import = "astrocommunity.motion.leap-nvim" },
  {"ggandor/leap.nvim", lazy = false},
   {"stevearc/oil.nvim",
     config = function() require('oil').setup() end
   },
   -- Neorg
   {"nvim-neorg/neorg",
     run = ":Neorg sync-parsers",
     config = function()
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
               default_workspace = "work"
             }
           }
        }
       }
     end,
   },
   -- blamer (like gitlense)
   {"APZelos/blamer.nvim"},
   -- rust tools
   {"simrat39/rust-tools.nvim"},
   -- Elm
 {"ElmCast/elm-vim"},
  {"vim-test/vim-test"},
  {"rescript-lang/vim-rescript"},
  {"evanleck/vim-svelte"},
  {"itchyny/lightline.vim", lazy = false},
  {"MunifTanjim/prettier.nvim"},
  {"sindrets/diffview.nvim",
    requires = { { 'nvim-lua/plenary.nvim' } },
    lazy = false,
    --    config = function() require("config.flutter").setup() end,
  },
  ["tamton-aquib/duck.nvim"] = {
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
      vim.keymap.set('n', '<leader>dc', function() require("duck").hatch("🐈", 0.75) end, {})
      vim.keymap.set('n', '<leader>dt', function() require("duck").hatch("🦖", 0.75) end, {})
    end,
  },

  },
  mappings = {
    n = {
   ["<S-l>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<S-h>"] = {
    function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    desc = "Previous buffer",
  }
    }
  }
  -- colorscheme = "poimandres",
}
require('leap').add_default_mappings()

return config
