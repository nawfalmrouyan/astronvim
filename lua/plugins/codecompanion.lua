return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionToggle",
    "CodeCompanionActions",
  },
  config = function()
    require("codecompanion").setup {
      adapters = {
        deepseek = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "deepseek",
            schema = {
              model = {
                default = "deepseek-r1:8b",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "deepseek",
        },
        inline = {
          adapter = "deepseek",
        },
      },
    }
  end,
}
