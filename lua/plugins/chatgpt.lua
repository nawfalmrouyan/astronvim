return {
  {
    "dreamsofcode-io/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("chatgpt").setup({
        async_api_key_cmd = "pass show chatgpt",
      })
    end,
  },
}
