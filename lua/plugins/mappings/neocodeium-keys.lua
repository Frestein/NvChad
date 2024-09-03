local map = require("langmapper").map

local neocodeium = require "neocodeium"

-- stylua: ignore
local keymaps = {
  ["<C-f>"] = {
    modes = { "i" },
    func = neocodeium.accept,
    desc = "neocodeium accept",
  },
  ["<C-w>"] = {
    modes = { "i" },
    func = neocodeium.accept_word,
    desc = "neocodeium accept word",
  },
  ["<C-l>"] = {
    modes = { "i" },
    func = neocodeium.accept_line,
    desc = "neocodeium accept line",
  },
  ["<C-e>"] = {
    modes = { "i" },
    func = neocodeium.cycle_or_complete,
    desc = "neocodeium cycle or complete",
  },
  ["<C-r>"] = {
    modes = { "i" },
    func = function() return neocodeium.cycle_or_complete(-1) end,
    desc = "neocodeium cycle or complete (reverse)",
  },
  ["<C-c>"] = {
    modes = { "i" },
    func = neocodeium.clear,
    desc = "neocodeium clear",
  },
  ["<leader>tc"] = {
    modes = { "n" },
    func = neocodeium.chat,
    desc = "neocodeium chat",
  },
}

for key, value in pairs(keymaps) do
  map(value.modes, key, value.func, { desc = value.desc })
end