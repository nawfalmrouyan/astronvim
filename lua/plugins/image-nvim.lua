return {
  "3rd/image.nvim",
  enabled = false,
  opts = {
    backend = "kitty",
    processor = "magick_cli",
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
