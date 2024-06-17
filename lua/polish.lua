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
  vim.opt.guifont = "Pragmasevka:h16"

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

-- Setup keymappings. Code borrowed from surround-ui
local root_key = "s"
local grammar_targets = {
  ["["] = "",
  ["]"] = "",
  ["("] = "",
  [")"] = "",
  ["{"] = "",
  ["}"] = "",
  ["<"] = "",
  [">"] = "",
  ["`"] = "",
  ["'"] = "",
  ['"'] = "",
}
local abbreviated_targets = {
  ["b"] = " [bracket]",
}
local keywords_targets = {
  ["w"] = " [word]",
  ["W"] = " [WORD]",
  ["f"] = " [function]",
  ["q"] = " [quote]",
}

local all_targets = {}
all_targets = vim.tbl_extend("error", all_targets, grammar_targets, abbreviated_targets, keywords_targets)

local abbreviated_and_grammar_targets = {}
abbreviated_and_grammar_targets =
  vim.tbl_extend("error", abbreviated_and_grammar_targets, grammar_targets, abbreviated_targets)

local mappings = {
  ["<leader>"] = {
    [root_key] = { name = "+[surround]" },
  },
}

-- around mappings
mappings["<leader>"][root_key]["a"] = { name = "+[around]" }
for char, desc in pairs(all_targets) do
  mappings["<leader>"][root_key]["a"][char] = { name = desc }
  for ichar, target in pairs(abbreviated_and_grammar_targets) do
    mappings["<leader>"][root_key]["a"][char][ichar] =
      { '<CMD>call feedkeys("ysa\\' .. char .. "\\" .. ichar .. '")<CR>', "ysa" .. char .. ichar .. target }
  end
end

-- inner mappings
mappings["<leader>"][root_key]["i"] = { name = "+[inner]" }
for char, desc in pairs(all_targets) do
  mappings["<leader>"][root_key]["i"][char] = { name = desc }
  for ichar, target in pairs(all_targets) do
    mappings["<leader>"][root_key]["i"][char][ichar] =
      { '<CMD>call feedkeys("ysi\\' .. char .. "\\" .. ichar .. '")<CR>', "ysi" .. char .. ichar .. target }
  end
end

-- change mappings
mappings["<leader>"][root_key]["c"] = { name = "+[change]" }
for char, desc in pairs(all_targets) do
  mappings["<leader>"][root_key]["c"][char] = { name = desc }
  for ichar, target in pairs(all_targets) do
    mappings["<leader>"][root_key]["c"][char][ichar] =
      { '<CMD>call feedkeys("cs\\' .. char .. "\\" .. ichar .. '")<CR>', "cs" .. char .. ichar .. target }
  end
end

-- delete mappings
mappings["<leader>"][root_key]["d"] = { name = "+[delete]" }
for char, target in pairs(all_targets) do
  mappings["<leader>"][root_key]["d"][char] = { '<CMD>call feedkeys("ds\\' .. char .. '")<CR>', "ds" .. char .. target }
end

-- line mappings
mappings["<leader>"][root_key]["s"] = { name = "+[line]" }
for char, target in pairs(all_targets) do
  mappings["<leader>"][root_key]["s"][char] =
    { '<CMD>call feedkeys("yss\\' .. char .. '")<CR>', "yss" .. char .. target }
end
require("which-key").register(mappings)

vim.cmd "colorscheme catppuccin-mocha"
