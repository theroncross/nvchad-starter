require("nvchad.configs.lspconfig").defaults()

local servers = { "ts_ls", "eslint", "html", "cssls", "glint", "ember", "copilot" }

local function root_pattern_exclude(opt)
  local lsputil = require "lspconfig.util"

  return function(fname)
    local excluded_root = lsputil.root_pattern(opt.exclude)(fname)
    local included_root = lsputil.root_pattern(opt.root)(fname)

    if excluded_root then
      return nil
    else
      return included_root
    end
  end
end

vim.lsp.enable(servers)

vim.lsp.config("ts_ls", {
  root_markers = {
    root_pattern_exclude {
      root = { "pnpm-workspace.yaml" },
      exclude = { ".ember-cli" },
    },
  },
})
vim.lsp.config("glint", {
  init_options = {
    glint = {
      useGlobal = true,
    },
  },
})

-- read :h vim.lsp.config for changing options of lsp servers
