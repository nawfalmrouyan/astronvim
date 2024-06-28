-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    -- foo = "fooscript",
  },
  filename = {
    -- ["Foofile"] = "fooscript",
    [".env"] = "config",
    [".todo"] = "txt",
  },
  pattern = {
    -- ["~/%.config/foo/.*"] = "fooscript",
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
  vim.opt.guifont = "Pragmasevka:h13"

  -- Helper function for transparency formatting
  local alpha = function() return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8))) end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.9
  vim.g.transparency = 0.9
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

-- use gh to move to the beginning of the line in normal mode
-- use gl to move to the end of the line in normal mode
vim.keymap.set("n", "gh", "^", { desc = "Go to the beginning of the line" })
vim.keymap.set("n", "gl", "$", { desc = "go to the end of the line" })
vim.keymap.set("v", "gh", "^", { desc = "Go to the beginning of the line in visual mode" })
vim.keymap.set("v", "gl", "$", { desc = "Go to the end of the line in visual mode" })

-- Make the file you run the command on, executable, so you don't have to go out to the command line
-- Had to include quotes around "%" because there are some apple dirs that contain spaces, like iCloud
vim.keymap.set("n", "<leader>fx", '<cmd>!chmod +x "%"<CR>', { silent = true, desc = "Make file executable" })
vim.keymap.set("n", "<leader>fX", '<cmd>!chmod -x "%"<CR>', { silent = true, desc = "Remove executable flag" })

-- Paste images
-- I use a Ctrl keymap so that I can paste images in insert mode
-- I tried using <C-v> but duh, that's used for visual block mode
-- so don't do it
vim.keymap.set({ "n", "v", "i" }, "<C-a>", function()
  -- Call the paste_image function from the Lua API
  -- Using the plugin's Lua API (require("img-clip").paste_image()) instead of the
  -- PasteImage command because the Lua API returns a boolean value indicating
  -- whether an image was pasted successfully or not.
  -- The PasteImage command does not
  -- https://github.com/HakonHarnes/img-clip.nvim/blob/main/README.md#api
  local pasted_image = require("img-clip").paste_image()
  if pasted_image then
    -- "Update" saves only if the buffer has been modified since the last save
    vim.cmd "update"
    print "Image pasted and file saved"
    -- Only if updated I'll refresh the images by clearing them first
    -- I'm using [[ ]] to escape the special characters in a command
    vim.cmd [[lua require("image").clear()]]
    -- Reloads the file to reflect the changes
    vim.cmd "edit!"
    -- Switch back to command mode
    vim.cmd "stopinsert"
  else
    print "No image pasted. File not updated."
  end
end, { desc = "Paste image from system clipboard" })

-- Open image under cursor in the Preview app
vim.keymap.set("n", "<leader>ao", function()
  local function get_image_path()
    -- Get the current line
    local line = vim.api.nvim_get_current_line()
    -- Pattern to match image path in Markdown
    local image_pattern = "%[.-%]%((.-)%)"
    -- Extract relative image path
    local _, _, image_path = string.find(line, image_pattern)

    return image_path
  end

  -- Get the image path
  local image_path = get_image_path()

  if image_path then
    -- Check if the image path starts with "http" or "https"
    if string.sub(image_path, 1, 4) == "http" then
      print "URL image, use 'gx' to open it in the default browser."
    else
      -- Construct absolute image path
      local current_file_path = vim.fn.expand "%:p:h"
      local absolute_image_path = current_file_path .. "/" .. image_path

      -- Construct command to open image in Preview
      local command = "feh " .. vim.fn.shellescape(absolute_image_path)
      -- Execute the command
      local success = os.execute(command)

      if success then
        print("Opened image in Preview: " .. absolute_image_path)
      else
        print("Failed to open image in Preview: " .. absolute_image_path)
      end
    end
  else
    print "No image found under the cursor"
  end
end, { desc = "Open image under cursor in Preview" })

-- Delete image file under cursor using trash app
vim.keymap.set("n", "<leader>ad", function()
  local function get_image_path()
    -- Get the current line
    local line = vim.api.nvim_get_current_line()
    -- Pattern to match image path in Markdown
    local image_pattern = "%[.-%]%((.-)%)"
    -- Extract relative image path
    local _, _, image_path = string.find(line, image_pattern)

    return image_path
  end

  -- Get the image path
  local image_path = get_image_path()

  if image_path then
    -- Check if the image path starts with "http" or "https"
    if string.sub(image_path, 1, 4) == "http" then
      vim.api.nvim_echo({
        { "URL image cannot be deleted from disk.", "WarningMsg" },
      }, false, {})
    else
      -- Construct absolute image path
      local current_file_path = vim.fn.expand "%:p:h"
      local absolute_image_path = current_file_path .. "/" .. image_path

      -- Check if trash utility is installed
      if vim.fn.executable "trash" == 0 then
        vim.api.nvim_echo({
          { "- Trash utility not installed. Make sure to install it first\n", "ErrorMsg" },
        }, false, {})
        return
      end

      -- Prompt for confirmation before deleting the image
      vim.ui.input({
        prompt = "Delete image file? (y/n) ",
      }, function(input)
        if input == "y" or input == "Y" then
          -- Delete the image file using trash app
          local success, _ = pcall(function() vim.fn.system { "trash", vim.fn.fnameescape(absolute_image_path) } end)

          if success then
            vim.api.nvim_echo({
              { "Image file deleted from disk:\n", "Normal" },
              { absolute_image_path, "Normal" },
            }, false, {})
            -- I'll refresh the images, but will clear them first
            -- I'm using [[ ]] to escape the special characters in a command
            vim.cmd [[lua require("image").clear()]]
            -- Reloads the file to reflect the changes
            vim.cmd "edit!"
          else
            vim.api.nvim_echo({
              { "Failed to delete image file:\n", "ErrorMsg" },
              { absolute_image_path, "ErrorMsg" },
            }, false, {})
          end
        else
          vim.api.nvim_echo({
            { "Image deletion canceled.", "Normal" },
          }, false, {})
        end
      end)
    end
  else
    vim.api.nvim_echo({
      { "No image found under the cursor", "WarningMsg" },
    }, false, {})
  end
end, { desc = "Delete image file under cursor" })

-- Refresh the images in the current buffer
-- Useful if you delete an actual image file and want to see the changes
-- without having to re-open neovim
vim.keymap.set("n", "<leader>ar", function()
  -- First I clear the images
  -- I'm using [[ ]] to escape the special characters in a command
  vim.cmd [[lua require("image").clear()]]
  -- Reloads the file to reflect the changes
  vim.cmd "edit!"
  print "Images refreshed"
end, { desc = "Refresh images" })

-- Set up a keymap to clear all images in the current buffer
vim.keymap.set("n", "<leader>ac", function()
  -- This is the command that clears the images
  -- I'm using [[ ]] to escape the special characters in a command
  vim.cmd [[lua require("image").clear()]]
  print "Images cleared"
end, { desc = "Clear images" })

-- Call theme
vim.cmd "colorscheme catppuccin-mocha"
