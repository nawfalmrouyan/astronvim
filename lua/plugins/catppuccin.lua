return {
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      transparent_background = true,
      integrations = {
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
