-- Some useful plugins
local fmt = require("utils.icons").fmt
return {
  {
    --fold
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      require("ufo").setup({
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          "nvim-tree",
          "dropbar_menu",
          "CodeAction",
        },
      })
    end,
  },
  {
    "psliwka/vim-smoothie",
    keys = { "<C-u>", "<C-d>", "zz" },
  },
  {
    "NMAC427/guess-indent.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      autocmd = true,
    },
  },
  {
    "ojroques/nvim-bufdel",
    cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
    opts = { quit = false },
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>j", mode = { "n" }, ":TSJSplit<CR>", desc = fmt("Down", "Split node") },
      { "<leader>J", mode = { "n" }, ":TSJJoin<CR>", desc = fmt("Up", "Join node") },
    },
    opts = {
      use_default_keymaps = false,
    },
  },
  { "rmagatti/alternate-toggler" },
}
