local format = require("utils.icons").format
return {
  "uga-rosa/ccc.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "CccPick",
    "CccConvert",
    "CccHighlighterEnable",
    "CccHighlighterDisable",
    "CccHighlighterToggle",
  },
  config = function()
    local ccc = require("ccc")
    ccc.setup({
      alpha_show = "show",
    })
    vim.cmd("CccHighlighterEnable")
    local opts = { noremap = true, silent = true, desc = format("Color", "Toggle color Highlightning") }
    vim.keymap.set("n", "<leader>cc", ":CccHighlighterToggle<CR>", opts)
  end,
}
