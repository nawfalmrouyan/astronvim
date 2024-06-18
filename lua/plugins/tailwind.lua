return {
  {
    "laytan/tailwind-sorter.nvim",
    enabled = true,
    ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = function()
      require("tailwind-sorter").setup {
        on_save_enabled = true, -- If `true`, automatically enables on save sorting.
        on_save_pattern = { "*.svelte", "*.html", "*.js", "*.jsx", "*.tsx", "*.twig", "*.hbs", "*.php" }, -- The file patterns to watch and sort.
        node_path = "node",
      }
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    enabled = true,
    ft = { "html", "typescript", "javascript", "svelte", "css", "javascriptreact", "typescriptreact" },
    config = function()
      local cmp = require "cmp"
      cmp.formatting = { format = require("tailwindcss-colorizer-cmp").formatter }
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
}
