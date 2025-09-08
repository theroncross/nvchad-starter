require "nvchad.mappings"

-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<tab>")
nomap("n", "<S-tab>")
nomap("n", "<leader>b")
nomap("n", "<C-n>")

local map = vim.keymap.set

map("n", "<leader>gs", "<cmd> Git <CR>", { desc = "Git status" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next occurrence, centered" })
map("n", "N", "Nzzzv", { desc = "Prev occurrence, centered" })
map("n", "-", "<cmd> Oil <CR>", { desc = "Open parent directory in Oil" })
map("n", "<leader>fd", function()
  require("conform").format { async = true }
end, { desc = "Format buffer" })

-- Telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
map("n", "<leader>ss", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
map("n", "<leader>sw", "<cmd> Telescope grep_string <CR>", { desc = "Search word" })
map("n", "<leader>sd", "<cmd> Telescope diagnostics <CR>", { desc = "Search diagnostics" })
map("n", "<leader><space>", "<cmd> Telescope buffers <CR>", { desc = "Search buffers" })

map("n", "<leader>gd", "<cmd> Telescope lsp_definitions <CR>", { desc = "Go to definition" })

-- Diagnostic
map("n", "<leader>dp", function()
  vim.diagnostic.jump { count = -1 }
end, { desc = "Go to previous diagnostic message" })
map("n", "<leader>dn", function()
  vim.diagnostic.jump { count = 1 }
end, { desc = "Go to next diagnostic message" })
map("n", "<leader>do", function()
  vim.diagnostic.open_float()
end, { desc = "Open floating diagnostic message" })

-- lsp
map("n", "<leader>ra", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Rename" })

map("n", "<leader>e", function()
  require("nvchad.tabufline").next()
end, { desc = "Next buffer" })
map("n", "<leader><tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })
