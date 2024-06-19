local format = require("utils.icons").format
vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

opts.desc = format("Save", "Save current file")
keymap.set("n", "<leader>w", ":w<CR>", opts)

opts.desc = format("Save", "Save current file!")
keymap.set("n", "<leader>W", ":w!<CR>", opts)

opts.desc = format("Exit", "Quit")
keymap.set("n", "<leader>q", ":q<CR>", opts)

opts.desc = format("Exit", "Quit!")
keymap.set("n", "<leader>Q", ":q!<CR>", opts)

opts.desc = format("Insert", "Exit insert mode")
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", "jj", "<ESC>", opts)

opts.desc = format("Search", "Clear Search highlights")
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

-- increment/decrement numbers

opts.desc = format("Up", "Increment number")
keymap.set("n", "<leader>+", "<C-a>", opts)

opts.desc = format("Down", "Decrement number")
keymap.set("n", "<leader>-", "<C-x>", opts)

-- Window management
opts.desc = format("Vertical", "Split window vertically")
keymap.set("n", "<leader>sv", "<C-w>v", opts)

opts.desc = format("Horizontal", "Split window horizontally")
keymap.set("n", "<leader>sh", "<C-w>s", opts)

opts.desc = format("Window", "Make splits equal size")
keymap.set("n", "<leader>se", "<C-w>=", opts)

opts.desc = format("Error", "Close current split")
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts)

opts.desc = format("NewFile", "Open new tab")
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", opts)

opts.desc = format("Error", "Close current tab")
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts)

opts.desc = format("NewFile", "Open new tab")
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts)

opts.desc = format("Right", "Go to next tab")
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts)

opts.desc = format("Left", "Go to previous tab")
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts)

opts.desc = format("NewFile", "Open new buffer in new tab")
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", opts)

opts.desc = format("FileTree", "Open file explorer")
keymap.set("n", "<leader>o", "<cmd>Neotree focus<CR>", opts)

opts.desc = format("Toggle", "Toggle file explorer")
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", opts)

opts.desc = format("Toggle", "Toggle value")
keymap.set("n", "<leader>T", ":ToggleAlternate<CR>", opts)

-- Terminal
opts.desc = format("Float", "Terminal Float")
keymap.set("n", "<leader>yf", ":ToggleTerm direction=float<CR>", opts)

opts.desc = format("Window", "Terminal Tab")
keymap.set("n", "<leader>yt", ":ToggleTerm direction=tab<CR>", opts)

opts.desc = format("Vertical", "Terminal Vertical")
keymap.set("n", "<leader>yv", ":ToggleTerm direction=vertical<CR>", opts)

opts.desc = format("Horizontal", "Terminal Horizontal")
keymap.set("n", "<leader>yh", ":ToggleTerm direction=horizontal<CR>", opts)

opts.desc = format("Package", "Mason")
keymap.set("n", "<leader>M", ":Mason<CR>", opts)

opts.desc = format("Package", "Lazy")
keymap.set("n", "<leader>L", ":Lazy<CR>", opts)

opts.desc = format("Home", "Home")
keymap.set("n", "<leader><CR>", ":Alpha<CR>", opts)
