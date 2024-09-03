require("nvchad.configs.lspconfig").defaults()

local servers = { "eslint", "html", "cssls", "tsserver", "clangd", "glint", "ember" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
