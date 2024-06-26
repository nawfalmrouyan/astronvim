if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "rasulomaroff/telepath.nvim",
    dependencies = "ggandor/leap.nvim",
    lazy = false,
    config = function() require("telepath").use_default_mappings() end,
  },
}
