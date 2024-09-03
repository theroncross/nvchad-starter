local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with {
    filetypes = {
      "css",
      "handlebars",
      "html",
      "javascript",
      "javascript.glimmer",
      "markdown",
      "scss",
      "typescript",
      "typescript.glimmer",
      "yaml",
    }
  }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
