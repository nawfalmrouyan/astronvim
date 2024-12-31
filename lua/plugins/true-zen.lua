return {
  {
    "Pocco81/true-zen.nvim",
    enabled = false,
    keys = {
      { "<M-=>", "<cmd>TZFocus<cr>", desc = "Focus" },
      { "<M-->", "<C-\\><C-n><cmd>TZAtaraxis<cr>i", mode = "t", desc = "Ataraxis" },
    },
    cmd = { "TZFocus", "TZAtaraxis" },
    -- init = function()
    --   vim.keymap.set({ "n" }, "<M-=>", "<cmd>TZFocus<cr>")
    --   vim.keymap.set({ "t" }, "<M-=>", "<C-\\><C-n><cmd>TZFocus<cr>i")
    -- end,
  },
}
