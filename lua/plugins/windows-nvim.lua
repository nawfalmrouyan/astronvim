return {
  {
    "JoseConseco/windows.nvim",
    requires = {
      "JoseConseco/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      vim.o.winwidth = 20
      vim.o.winminwidth = 20
      vim.o.equalalways = false
      require("windows").setup()

      local function cmd(command) return table.concat { "<Cmd>", command, "<CR>" } end

      vim.keymap.set("n", "<C-w>z", cmd "WindowsMaximize")
      vim.keymap.set("n", "<C-w>_", cmd "WindowsMaximizeVertically")
      vim.keymap.set("n", "<C-w>|", cmd "WindowsMaximizeHorizontally")
      vim.keymap.set("n", "<C-w>=", cmd "WindowsEqualize")
    end,
  },
}
