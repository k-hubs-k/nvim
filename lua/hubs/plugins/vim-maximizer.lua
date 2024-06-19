local format = require("utils.icons").format
return {
  "szw/vim-maximizer",
  keys = {
    {
      "<leader>sm",
      ":MaximizerToggle<CR>",
      { desc = format("Toggle", "Minimize/maximize split"), noremap = true, silent = true },
    },
  },
}
