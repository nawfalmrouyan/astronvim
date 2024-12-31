return {
  "emmanueltouzery/decisive.nvim",
  ft = "csv",
  keys = {
    { "<leader>rca", ":lua require('decisive').align_csv({})<cr>", desc = "align CSV" },
    { "<leader>rcA", ":lua require('decisive').align_csv_clear({})<cr>", desc = "align CSV clear" },
    { "[c", ":lua require('decisive').align_csv_prev_col()<cr>", desc = "align CSV prev col" },
    { "]c", ":lua require('decisive').align_csv_prev_col()<cr>", desc = "align CSV next col" },
  },
  config = function() require("decisive").setup {} end,
}
