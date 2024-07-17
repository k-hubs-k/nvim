local format = require("utils.icons").format
local fmt = require("utils.icons").fmt
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_directory = { "smart" },
        prompt_prefix = fmt("Insert", " "),
        selection_caret = fmt("Right", ""),
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })
    -- telescope.load_extension("fzf")

    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      { desc = format("Search", "Fuzzy find files in cwd") }
    )
    keymap.set(
      "n",
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      { desc = format("Restore", "Fuzzy find recent files") }
    )
    keymap.set(
      "n",
      "<leader>fg",
      "<cmd>Telescope live_grep<cr>",
      { desc = format("BookmarkSearch", "Find string in cwd") }
    )
    keymap.set(
      "n",
      "<leader>fc",
      "<cmd>Telescope grep_string<cr>",
      { desc = format("Definition", "Find string under cursor in cwd") }
    )
    keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = format("Insert", "Find keymaps") })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = format("Todo", "Find todos") })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = format("File", "Opened Files") })
  end,
}
