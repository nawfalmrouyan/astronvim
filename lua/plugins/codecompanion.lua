return {
  {
    "olimorris/codecompanion.nvim",
    enabled = false,
    keys = {
      { "<C-a>", "<Cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanionActions" },
      { "ga", "<Cmd>CodeCompanionChat Add<cr>", mode = { "v" }, desc = "CodeCompanionChat Add" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup {
        strategies = {
          chat = { adapter = "ollama" },
          inline = { adapter = "ollama" },
        },
      }
      vim.cmd [[cab cc CodeCompanion]]
    end,
  },
}
