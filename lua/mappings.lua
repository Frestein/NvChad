require "nvchad.mappings"

-- Variables {{{

local map = require("langmapper").map
local unmap = vim.keymap.del

local telescope = require "telescope"
local telescope_builtin = require "telescope.builtin"
local conform = require "conform"
local lazy = require "lazy"
local oil = require "oil"
local noice = require "noice"
local neogit = require "neogit"
local resession = require "resession"
local silicon = require "nvim-silicon"
local zen_mode = require "zen-mode"
local neorg_callbacks = require "neorg.core.callbacks"

-- }}}
-- NvChad Defaults {{{

-- nvimtree
unmap("n", "<leader>e")
unmap("n", "<C-n>")

-- conform
unmap({ "n", "v" }, "<leader>fm")

-- telescope
unmap("n", "<leader>ma")
unmap("n", "<leader>cm")
unmap("n", "<leader>gt")

--}}}

-- File {{{

map("n", "<leader>cf", function()
  vim.fn.setreg("+", vim.fn.expand "%:t")
end, { desc = "file copy name" })

map("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand "%:p")
end, { desc = "file copy path" })

-- }}}
-- Split {{{

-- Split window
map("n", "<leader>h", function()
  vim.cmd "split"
end, { desc = "split horizontal " })

map("n", "<leader>v", function()
  vim.cmd "vsplit"
end, { desc = "split vertical" })

-- Resize split window
map("n", "<C-S-Down>", function()
  vim.cmd "resize +2"
end, { desc = "split resize horizontal down" })

map("n", "<C-S-Up>", function()
  vim.cmd "resize -2"
end, { desc = "split resize horizontal up" })

map("n", "<C-S-Left>", function()
  vim.cmd "vertical resize -2"
end, { desc = "split resize vertical down" })

map("n", "<C-S-Right>", function()
  vim.cmd "vertical resize +2"
end, { desc = "split resize vertical up" })

-- }}}

-- Plugins
-- Telescope {{{

map("n", "<leader>ff", telescope_builtin.find_files, { desc = "telescope find files" })
map("n", "<leader>fm", telescope_builtin.marks, { desc = "telescope find marks" })
map("n", "<leader>fw", telescope_builtin.live_grep, { desc = "telescope live grep" })
map("n", "<leader>fb", telescope_builtin.buffers, { desc = "telescope find buffers" })
map("n", "<leader>fh", telescope_builtin.help_tags, { desc = "telescope help page" })
map("n", "<leader>fo", telescope_builtin.oldfiles, { desc = "telescope find oldfiles" })
map("n", "<leader>fz", telescope_builtin.current_buffer_fuzzy_find, { desc = "telescope find in current buffer" })
map("n", "<leader>pt", telescope.extensions.terms.terms, { desc = "telescope pick hidden term" })
map("n", "<leader>th", telescope.extensions.themes.themes, { desc = "telescope nvchad themes" })
map("n", "<leader>fip", telescope.extensions.lazy.lazy, { desc = "telescope installed plugins" })
map("n", "<leader>fs", telescope.extensions.resession.resession, { desc = "telescope find sessions" })
map("n", "<leader>zl", telescope.extensions.zoxide.list, { desc = "telescope zoxide list" })
map("n", "<leader>fd", telescope.extensions.chezmoi.find_files, { desc = "telescope find dotfiles" })

-- }}}
-- Tabufline {{{

map("n", "<C-S-[>", function()
  vim.cmd "tabprev"
end, { desc = "tabufline previous tab" })

map("n", "<C-S-]>", function()
  vim.cmd "tabnext"
end, { desc = "tabufline next tab" })

map("n", "<leader>^", function()
  vim.cmd "tabfirst"
end, { desc = "tabufline first tab" })

map("n", "<leader>$", function()
  vim.cmd "tablast"
end, { desc = "tabufline last tab" })

-- }}}
-- Oil {{{

map("n", "<leader>e", oil.open, { desc = "file open parent directory" })
map("n", "<leader>fl", oil.toggle_float, { desc = "file open parent directory (float)" })

-- }}}
-- Conform {{{

map({ "n", "v" }, "<leader>fc", function()
  conform.format { async = true }
end, { desc = "conform format buffer or selected text" })

-- }}}
-- Lazy {{{

map("n", "<leader>ll", lazy.home, { desc = "lazy open home" })
map("n", "<leader>llp", lazy.log, { desc = "lazy recent updates" })
map("n", "<leader>li", lazy.install, { desc = "lazy install missing plugins" })
map("n", "<leader>lc", lazy.check, { desc = "lazy check updates" })
map("n", "<leader>lu", lazy.update, { desc = "lazy update plugins" })
map("n", "<leader>ls", lazy.sync, { desc = "lazy sync plugins" })
map("n", "<leader>lh", lazy.health, { desc = "lazy open health" })
map("n", "<leader>lp", lazy.profile, { desc = "lazy open profile" })

-- }}}
-- Mason {{{

map("n", "<leader>mm", function()
  vim.cmd "Mason"
end, { desc = "mason open home" })

map("n", "<leader>mi", function()
  vim.cmd "MasonInstallAll"
end, { desc = "mason install all packages" })

map("n", "<leader>mu", function()
  vim.cmd "MasonUpdate"
end, { desc = "mason update packages" })

-- }}}
-- Noice {{{

map("n", "<leader>nd", function()
  noice.cmd "dismiss"
end, { desc = "notices dismiss all visible messages" })

map("n", "<leader>nl", function()
  noice.cmd "last"
end, { desc = "notices show the last message" })

map("n", "<leader>nh", function()
  noice.cmd "history"
end, { desc = "notices show the notice history" })

map("n", "<leader>fn", function()
  noice.cmd "telescope"
end, { desc = "telescope find notices" })

-- }}}
-- Neogit {{{

map("n", "<leader>gg", neogit.open, { desc = "neogit open" })

map("n", "<leader>gl", function()
  neogit.open { "log" }
end, { desc = "neogit log" })

-- }}}
-- Neorg {{{

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  keybinds.map_event_to_mode("norg", {
    n = {
      { "<C-l>", "core.integrations.telescope.find_linkable" },
    },
  }, {
    silent = true,
    noremap = true,
  })
end)

-- }}}
-- Silicon {{{

map("v", "<leader>ss", silicon.shoot, { desc = "snapshot screenshot code" })
map("v", "<leader>sf", silicon.file, { desc = "snapshot screenshot code as file" })
map("v", "<leader>sc", silicon.clip, { desc = "snapshot screenshot code to clipboard" })

-- }}}
-- Zen-mode {{{

map({ "n" }, "<leader>mz", zen_mode.toggle, { desc = "toggle zen-mode" })

-- }}}
-- Project {{{

map("n", "<leader>fp", telescope.extensions.project.project, { desc = "telescope find projects" })

-- }}}
-- Resession {{{

map("n", "<leader>rs", resession.save, { desc = "session save session" })
map("n", "<leader>rl", resession.load, { desc = "session load session" })
map("n", "<leader>rd", resession.delete, { desc = "session delete session" })

-- }}}

-- vim:fileencoding=utf-8:foldmethod=marker
