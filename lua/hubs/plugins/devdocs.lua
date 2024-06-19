return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "DevdocsFetch",
    "DevdocsInstall",
    "DevdocsUninstall",
    "DevdocsOpen",
    "DevdocsOpenFloat",
    "DevdocsOpenCurrent",
    "DevdocsOpenCurrentFloat",
    "DevdocsUpdate",
    "DevdocsUpdateAll",
    "DevdocsBuild",
  },
  opts = {
    format = "markdown",
    filetypes = {
      javascript = { "html", "javascript" },
    },
    -- use_node = false,
    ensure_installed = {},
    wrap = true,
    previewer_cmd = "glow",
    cmd_args = { "-s", "auto", "-w", "97" },
    cmd_ignore = {},
    picker_cmd = true,
    picker_cmd_args = { "-s", "auto", "-w", "45" },
    mappings = {
      open_in_browser = "<leader>vb",
    },
    log_level = "debug",
  },
}
