local fmt = require("utils.icons").fmt
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", fmt("File", "New file", 3), ":ene <CR>"),
      dashboard.button("SPC e", fmt("Toggle", "Toggle file explorer", 3), "<cmd>Neotree toggle<CR>"),
      dashboard.button("SPC ff", fmt("FileSearch", "Find File", 3), "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", fmt("Search", "Find Word", 3), "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC fk", fmt("Insert", "View keymaps", 3), "<cmd>Telescope keymaps<CR>"),
      dashboard.button("SPC wr", fmt("Restore", "Restore Session for Current Directory", 3), "<cmd>SessionRestore<CR>"),
      dashboard.button("q", fmt("Exit", "Quit NEOVIM", 3), ":qa<CR>"),
    }
    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable the folding on alpha buffer
    vim.cmd([[autocmd FileType alpha  setlocal nofoldenable]])
  end,
}
