-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
    [".env"] = "config",
    [".todo"] = "txt",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
    ["req.*.txt"] = "config",
    ["gitconf.*"] = "gitconfig",
    [".*/hyprland%.conf"] = "hyprlang",
  },
}

vim.opt.guicursor = {
  "n-v:block-block-Cursor/lCursor",
  "i-c-ci-ve:ver25-Cursor/lCursor",
  "r-cr:hor20",
  "o:hor50",
  "i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- in insert mode, set number
vim.api.nvim_create_autocmd("InsertEnter", {
  -- group = augroup "set_number",
  pattern = { "*" },
  callback = function()
    vim.cmd "if &relativenumber | let g:backtorelative = 1 | setlocal number norelativenumber nocursorline | endif"
  end,
})

-- in edit mode, set reelativenumber
vim.api.nvim_create_autocmd("InsertLeave", {
  -- group = augroup "set_relativenumber",
  pattern = { "*" },
  callback = function() vim.cmd 'if exists("g:backtorelative") | setlocal relativenumber cursorline | endif' end,
})

-- show diagnostic on cursor
vim.api.nvim_create_autocmd("CursorHold", {
  -- group = augroup "show_diagnostic",
  pattern = { "*" },
  callback = function() vim.cmd "lua vim.diagnostic.open_float({focusable = false})" end,
})

-- red cursor
vim.api.nvim_create_autocmd("ColorScheme", {
  -- group = augroup "cursor_red",
  pattern = { "*" },
  callback = function() vim.cmd "hi Cursor guifg=red guibg=red" end,
})

if vim.g.neovide then
  -- neovide font setup
  -- vim.opt.guifont = "PragmataPro Nerd Font Mono:h16"
  vim.opt.guifont = "Iosevka:h16"

  -- Helper function for transparency formatting
  local alpha = function() return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8))) end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.7
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#1E1E2F" .. alpha()

  -- floating blur
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  -- floating shadow
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
end

vim.cmd "colorscheme catppuccin-mocha"
