-- lua/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",          -- keep to v2 line (stable)
  build = "make install_jsregexp", -- optional; enables advanced regex
  event = "InsertEnter",     -- or load earlier if you prefer
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    -- load VSCode-style snippets if you use them
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

