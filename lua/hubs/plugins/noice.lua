local icons = require("utils.icons").icons
local format = require("utils.icons").format

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      config = function()
        vim.keymap.set("n", "<leader>nn", ":lua require('notify').dismiss()<CR>", {
          desc = format("NotificationDismiss", "Dismiss notification"),
          noremap = true,
          silent = true,
        })
        local notify = require("notify")
        notify.setup({
          render = "minimal",
          timeout = 2500,
          top_down = false,
        })
      end,
    },
  },
  opts = {
    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = icons.Command, lang = "vim" },
      },
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        silent = true,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = "rounded",
    },
  },
}
