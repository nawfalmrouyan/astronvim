return {
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      transparent_background = true,
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        rainbow_delimiters = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            -- hints = { "undercurl" },
            warnings = { "undercurl" },
            -- information = { "undercurl" },
          },
        },
      },
    },
  },
}
