return {
  {
    "Pocco81/true-zen.nvim",
    cmd = { "TZFocus", "TZAtaraxis" },
    --   keys = {
    --     { "<leader>z", "<cmd>TZAtaraxis<cr>", desc = "Zen Mode" },
    --   },
    init = function()
      vim.keymap.set({ "n" }, "<M-=>", "<cmd>TZFocus<cr>")
      vim.keymap.set({ "t" }, "<M-=>", "<C-\\><C-n><cmd>TZFocus<cr>i")
    end,
    --   config = function() require("true-zen").setup() end,
  },
}
