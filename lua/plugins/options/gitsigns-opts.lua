local options = require "nvchad.configs.gitsigns"

options.current_line_blame = true
options.current_line_blame_opts = {
  delay = 500,
}
options.on_attach = function(bufnr)
  local gitsigns = package.loaded.gitsigns
  local map = vim.keymap.set

  local telescope_builtin = require "telescope.builtin"

  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "<leader>grh", gitsigns.reset_hunk, opts "gitsigns reset hunk")
  map("n", "<leader>gph", gitsigns.preview_hunk, opts "gitsigns preview hunk")
  map("n", "<leader>gb", gitsigns.blame_line, opts "gitsigns blame line")
  map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, opts "gitsigns toggle blame line")
  map("n", "<leader>gtd", gitsigns.toggle_deleted, opts "gitsigns toggle deleted")
  map("n", "<leader>gtn", gitsigns.toggle_numhl, opts "gitsigns toggle number highlight")

  map("n", "<leader>gc", telescope_builtin.git_commits, { desc = "telescope git commits" })
  map("n", "<leader>gs", telescope_builtin.git_status, { desc = "telescope git status" })
end

return options