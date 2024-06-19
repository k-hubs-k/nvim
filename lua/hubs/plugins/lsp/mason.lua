local icons = require("utils.icons").icons
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        border = "rounded",
        package_installed = icons.Check,
        package_pending = icons.Dots,
        package_uninstalled = icons.Close,
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "bashls",
        "gopls",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_language_server",
        "pyright",
        "jdtls",
        "ast_grep",
        "taplo",
        "jsonls",
        "intelephense",
        "vimls",
      },
    })

    mason_tool_installer.setup({
      "prettier",
      "stylua",
      "isort", -- pyton formatter
      "black", -- pyton formatter
      "pylint", -- python linter
      "eslint_d",
    })
  end,
}
