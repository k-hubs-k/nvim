return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  init = function() vim.cmd.colorscheme("tokyonight-night") end,
  opts = {
    styles = {
      keywords = { italic = false },
    },
    on_colors = function(colors)
      colors.gitSigns.add = colors.green
      colors.gitSigns.change = colors.blue
      colors.gitSigns.delete = colors.red
      colors.gitSigns.ignored = colors.bg
      colors.status_line = colors.none
      return colors
    end,
    on_highlights = function(hl, c)
      local highlights = {
        NormalSB = { bg = nil },
        NormalFloat = { bg = nil },
        FloatBorder = { fg = c.dark3 },
        FloatTitle = { fg = c.dark3 },
        CursorLineNr = { fg = c.blue },
        WinSeparator = { fg = c.terminal_black },
        WinBar = { bg = nil },
        WinBarNC = { bg = nil },
        LspInlayHint = { fg = c.comment },

        DiagnosticSignError = { fg = c.red },
        DiagnosticSignWarn = { fg = c.yellow },
        DiagnosticSignHint = { fg = c.blue },
        DiagnosticSignInfo = { fg = c.blue },
        DiagnosticError = { fg = c.red },
        DiagnosticWarn = { fg = c.yellow },
        DiagnosticHint = { fg = c.blue },
        DiagnosticInfo = { fg = c.blue },

        BufferLineFill = { bg = c.bg }, -- All space for bufferline
        BufferLineCloseButtonSelected = { fg = c.red },
        BufferLineError = { fg = c.red, bg = c.bg, bold = true },
        BufferLineWarning = { fg = c.yellow, bg = c.bg, bold = true },
        BufferLineHint = { fg = c.blue, bg = c.bg, bold = true },
        BufferLineInfo = { fg = c.blue, bg = c.bg, bold = true },
        BufferLineModified = { fg = c.green, bg = c.bg },
        BufferLineDuplicate = { fg = c.comment, bg = c.bg, bold = true },
        BufferLineDuplicateSelected = { fg = c.fg, bg = c.bg, bold = true, italic = true },
        BufferLineTruncMarker = { bg = c.red },
        BufferLineUnderline = { bg = c.red },

        NeoTreeDirectoryName = { fg = c.fg },
        NeoTreeNormalNC = { bg = c.bg },
        NeoTreeNormal = { bg = c.bg },
        NeoTreeGitUntracked = { fg = c.orange },
        NeoTreeGitUnstaged = { fg = c.cyan },

        WhichKeyFloat = { bg = c.bg },
        FlashLabel = { fg = c.red, bg = c.bg },
        FlashCurrent = { bg = c.fg },

        TelescopeNormal = { bg = nil },
        TelescopePromptPrefix = { fg = c.dark3 },
        TelescopeBorder = { link = "FloatBorder" },

        NotifyINFOBorder = { fg = c.blue },
        NotifyINFOTitle = { fg = c.blue },
        NotifyINFOIcon = { fg = c.blue },
        NotifyERRORBorder = { fg = c.red },
        NotifyERRORTitle = { fg = c.red },
        NotifyERRORIcon = { fg = c.red },
        NotifyWARNBorder = { fg = c.yellow },
        NotifyWARNTitle = { fg = c.yellow },
        NotifyWARNIcon = { fg = c.yellow },
        ErrorMsg = { fg = c.red },

        diffAdded = { fg = c.green },
        diffRemoved = { fg = c.red },
        diffChanged = { fg = c.blue },
        diffNewFile = { fg = c.cyan },
        diffOldFile = { fg = c.comment },
        DiffAdd = { fg = c.green },
        DiffChange = { fg = c.blue },
        DiffDelete = { fg = c.red },
        DiffText = { fg = c.purple },
      }

      for key, value in pairs(highlights) do
        hl[key] = value
      end
    end,
  },
}
