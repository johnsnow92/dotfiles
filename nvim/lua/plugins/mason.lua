-- Mason package configuration
-- Ensures LSPs and formatters are installed

return {
  -- Mason: manage LSP servers, linters, formatters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "json-lsp",
        "css-lsp",
        "html-lsp",
        "bash-language-server",
        "yaml-language-server",
        -- Formatters
        "prettier",
        "black",
        "stylua",
        "shfmt",
      },
    },
  },

  -- Conform: formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        python = { "black" },
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
    },
  },
}
