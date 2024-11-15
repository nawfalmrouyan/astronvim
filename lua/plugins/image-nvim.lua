return {
  "3rd/image.nvim",
  enabled = true,
  opts = {
    backend = "kitty",
    processor = "magick_rock",
    integrations = {
      markdown = {
        only_render_image_at_cursor = true,
      },
      neorg = {
        enabled = false,
      },
    },
  },
}
