return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    init = function()
      vim.keymap.set("v", "<leader>si", "<cmd>Silicon<cr>", { silent = true })
    end,
    config = function()
      require("silicon").setup({
        font = "PragmataPro Nerd Font Mono=34",
        theme = "OneHalfDark",
        window_title = function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
        end,
      })
    end,
  },
}
