local options = require "plugins.options.noice-opts"
local noice = require "noice"
local notify = require "notify"
local base46 = require "base46"

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local function setup_lsp_specific_options()
  local clients = vim.lsp.get_clients()

  for _, client in ipairs(clients) do
    if client.name == "pyright" then
      options.lsp.progress.throttle = 1000 / 5
    end
  end
end

local symbol_usage_augroup = augroup("noice_symbol_usage", { clear = true })

autocmd("LspAttach", {
  group = symbol_usage_augroup,
  callback = function()
    setup_lsp_specific_options()
    noice.setup(options)
  end,
})

noice.setup(options)

-- Transparency fix
local base16 = base46.get_theme_tb "base_16"

notify.setup {
  background_colour = base16.base00,
}