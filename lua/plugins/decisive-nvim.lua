return {
  "emmanueltouzery/decisive.nvim",
  ft = "csv",
  init = function()
    vim.keymap.set(
      "n",
      "<leader>rca",
      ":lua require('decisive').align_csv({})<cr>",
      { desc = "align CSV", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>rcA",
      ":lua require('decisive').align_csv_clear({})<cr>",
      { desc = "align CSV clear", silent = true }
    )
    vim.keymap.set(
      "n",
      "[c",
      ":lua require('decisive').align_csv_prev_col()<cr>",
      { desc = "align CSV prev col", silent = true }
    )
    vim.keymap.set(
      "n",
      "]c",
      ":lua require('decisive').align_csv_next_col()<cr>",
      { desc = "align CSV next col", silent = true }
    )
  end,
  config = function() require("decisive").setup {} end,
}
