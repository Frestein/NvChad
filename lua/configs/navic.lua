dofile(vim.g.base46_cache .. "navic")

local options = {
  click = true,
  highlight = true,
  lsp = { auto_attach = true },
}

require("nvim-navic").setup(options)
