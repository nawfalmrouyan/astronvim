return {
  { "christoomey/vim-tmux-navigator" },
  { "RRethy/nvim-treesitter-textsubjects", event = "User AstroFile", before = "nvim-treesitter" },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    before = "nvim-treesitter",
    event = "User AstroFile",
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "noice.nvim",
    opts = {
      lsp = {
        progress = { enabled = false },
        signature = { enabled = false },
      },
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
  },
  { "dstein64/vim-startuptime" },
  { "nvim-notify", enabled = false },
  -- { "neogit", tag = "v0.0.1" },
}
