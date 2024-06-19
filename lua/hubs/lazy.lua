local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "hubs.plugins" }, { import = "hubs.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    notify = false,
  },
})
