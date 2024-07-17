local format = require("utils.icons").format
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc }) end

      -- Navigation
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, format("Add", "Stage hunk"))
      map("n", "<leader>hr", gs.reset_hunk, format("Restore", "Reset hunk"))
      map(
        "v",
        "<leader>hs",
        function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        format("Add", "Stage hunk")
      )
      map(
        "v",
        "<leader>hr",
        function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        format("Restore", "Reset hunk")
      )

      map("n", "<leader>hS", gs.stage_buffer, format("Add", "Stage buffer"))
      map("n", "<leader>hR", gs.reset_buffer, format("Restore", "Reset buffer"))

      map("n", "<leader>hu", gs.undo_stage_hunk, format("Restore", "Undo stage hunk"))

      map("n", "<leader>hp", gs.preview_hunk, format("Search", "Preview hunk"))

      map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, format("Code", "Blame line"))
      map("n", "<leader>hB", gs.toggle_current_line_blame, format("Toggle", "Toggle line blame"))

      map("n", "<leader>hd", gs.diffthis, format("GitDiff", "Diff this"))
      map("n", "<leader>hD", function() gs.diffthis("~") end, format("GitDiff", "Diff this ~"))

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", format("Visual", "Gitsigns select hunk"))
    end,
  },
}
