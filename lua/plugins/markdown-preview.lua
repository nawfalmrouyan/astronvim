return {
  "iamcco/markdown-preview.nvim",
  enabled = false,
  build = "cd app && yarn install",
  ft = "markdown",
  config = function()
    vim.g.mkdp_browser = "firefoxMD"
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_markdown_css = "/home/opal/.config/astronvim/lua/plugins/gh-style.css"
    vim.g.mkdp_highlight_css = "/home/opal/.config/astronvim/lua/plugins/gh-highlight.css"
  end,
}
