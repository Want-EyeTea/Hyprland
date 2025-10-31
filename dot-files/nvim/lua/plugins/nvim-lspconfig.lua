-- lua/plugins/nvim-lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("mason").setup()

    -- Mason-lspconfig v2+: auto-enables installed servers unless you disable it.
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "gopls", "pyright", "bashls" },
      -- automatic_enable = true, -- default is true; set to false if you want to call vim.lsp.enable() yourself
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Global defaults for ALL servers (Neovim 0.11+ API)
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Per-server tweaks
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    -- If you disabled automatic_enable above, uncomment:
    -- vim.lsp.enable({ "lua_ls", "gopls", "pyright", "bashls" })
  end,
}

