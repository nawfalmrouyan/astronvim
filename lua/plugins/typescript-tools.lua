return {
  "pmizio/typescript-tools.nvim",
  ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  init = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("TS_add_missing_imports", { clear = true }),
      desc = "TS_add_missing_imports",
      pattern = { ".ts", ".tsx", ".js", ".jsx" },
      callback = function()
        vim.cmd [[TSToolsAddMissingImports]]
        vim.cmd "write"
      end,
    })
  end,
}
