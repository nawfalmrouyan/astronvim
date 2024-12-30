return {
  {
    "Pocco81/true-zen.nvim",
    enabled = false,
    cmd = { "TZFocus", "TZAtaraxis" },
    init = function()
      vim.keymap.set({ "n" }, "<M-=>", "<cmd>TZFocus<cr>")
      vim.keymap.set({ "t" }, "<M-=>", "<C-\\><C-n><cmd>TZFocus<cr>i")
    end,
  },
}
