return {
  {
    "ckolkey/ts-node-action",
    enabled = false,
    event = "BufRead",
    keys = {
      { "<TAB>", "<cmd>TSNodeAction<cr>", { desc = "Trigger Node Action" } },
    },
    dependencies = { "nvim-treesitter" },
    -- init = function()
    --   vim.keymap.set({ "n" }, "<TAB>", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
    -- end,
  },
}
