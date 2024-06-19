local keymap = vim.keymap
local opts = { noremap = true, silent = true }
return {
  "nvim-lua/plenary.nvim",
  "christoomey/vim-tmux-navigator",
  {
    "fedepujol/move.nvim",
    -- Line movement
    opts = {
      keymap.set({ "n", "i" }, "<A-j>", "<ESC>:MoveLine 1<CR>", opts),
      keymap.set({ "n", "i" }, "<A-k>", "<ESC>:MoveLine -1<CR>", opts),
    },
  },
}
