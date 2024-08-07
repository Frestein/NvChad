local options = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "prettier",
    "pyright",
    "black",
    "ruff",
    "yaml-language-server",
    "yamllint",
    "clangd",
    "clang-format",
    "shfmt",
    "shellharden",
    "shellcheck",
    "bash-language-server",
    "hyprls",
    "taplo",
  },
  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },
}

return options
