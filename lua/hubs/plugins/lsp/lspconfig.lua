local format = require("utils.icons").format
local icons = require("utils.icons").icons
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },

  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap -- for conciseness

    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, noremap = true, silent = true }

        -- set keybinds
        opts.desc = format("Search", "Show LSP references")
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = format("Definition", "Go to declaration")
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = format("Definition", "Show LSP definitions")
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = format("Definition", "Show LSP implementations")
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = format("Definition", "Show LSP type definitions")
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = format("Action", "See available code actions")
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = format("Insert", "Smart rename")
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = format("Fix", "Show buffer diagnostics")
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = format("Fix", "Show line diagnostics")
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = format("Left", "Go to previous diagnostic")
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = format("Right", "Go to next diagnostic")
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = format("Hover", "Hover")
        keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = format("Restore", "Restart LSP")
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = icons.Error, Warn = icons.Confict, Hint = icons.Hint, Info = icons.Info }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      ["ast_grep"] = function()
        -- configure lua server (with special settings)
        lspconfig["ast_grep"].setup({
          capabilities = capabilities,
          filetypes = { "cs" },
        })
      end,
      ["html"] = function()
        lspconfig["html"].setup({
          capabilities = capabilities,
          filetypes = { "html", "php" },
        })
      end,
    })
  end,
}
