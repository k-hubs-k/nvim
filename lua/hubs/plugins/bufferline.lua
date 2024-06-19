local format = require("utils.icons").format

return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffer",
      separator_style = "slant",

      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      diagnostics_indicator = nil,
      indicator = "none",
      offsets = {
        {
          filetype = "NvimTree",
          text = format("Folder", "NvimTree"),
          text_align = "left",
          separator = "│",
        },
      },
    },
  },
  config = function(_, opts)
    local colors = require("tokyonight.colors")

    vim.opt.showtabline = 2
    opts.highlights = {
      background = { bg = colors.night.bg },
      close_button = { bg = colors.night.bg },
      separator = { fg = colors.night.bg, bg = colors.night.bg },
      offset_separator = { bg = colors.night.bg },
      pick = { bg = colors.night.bg },
    }

    require("bufferline").setup(opts)
  end,
}
