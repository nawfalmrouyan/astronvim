return {
  { -- further customize the options set by the community
    "catppuccin",
    enabled = false,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        local u = require "catppuccin.utils.colors"
        return {
          CursorLine = {
            bg = u.vary_color(
              { latte = u.lighten(colors.mantle, 0.70, colors.base) },
              u.darken(colors.surface0, 0.64, colors.base)
            ),
          },
        }
      end,
      integrations = {
        blink_cmp = true,
        -- nvim_surround = true,
        render_markdown = true,
        dadbod_ui = true,
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
            hints = { "italic" },
            warnings = { "undercurl" },
            information = { "italic" },
          },
        },
      },
    },
  },
}
