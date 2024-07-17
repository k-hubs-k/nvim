local fmt = require("utils.icons").fmt
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    require("which-key").register({
      c = { name = fmt("Fix", "Actions") },
      e = { name = fmt("Windows", "Widow") },
      f = { name = fmt("Search", "Telescope") },
      g = { name = fmt("Git", "Git") },
      h = { name = fmt("Git", "Gitsigns") },
      l = { name = fmt("Git", "Git") },
      m = { name = fmt("Code", "Format") },
      n = { name = fmt("Notification", "Notification") },
      r = { name = fmt("Fix", "LSP") },
      s = { name = fmt("Windows", "Window") },
      S = { name = fmt("FolderClock", "Session") },
      t = { name = fmt("Window", "Tab") },
      u = { name = fmt("Window", "UI") },
      x = { name = fmt("Debugger", "Trouble") },
      y = { name = fmt("Terminal", "Terminal") },
    }, { prefix = "<leader>" })
  end,
  opts = {
    window = {
      border = "rounded",
      winblend = 0, -- opacity between 1-100
      ignore_missing = false, -- Don't show those who don't have label
    },
  },
}
