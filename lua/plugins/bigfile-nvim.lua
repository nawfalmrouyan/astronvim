if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "LunarVim/bigfile.nvim",
  event = { "FileReadPre", "BufReadPre", "User FileOpened" },
}
