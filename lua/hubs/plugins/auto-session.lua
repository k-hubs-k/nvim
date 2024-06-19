local format = require("utils.icons").format
return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/Downloads" },
    })

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    opts.desc = format("Restore", "Restore session for cwd")
    keymap.set("n", "<leader>Sr", ":SessionRestore<CR>", opts)

    opts.desc = format("Save", "Save session for cwd")
    keymap.set("n", "<leader>Ss", ":SessionSave<CR>", opts)
  end,
}
