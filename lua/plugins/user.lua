---@type LazySpec
return {

  "andweeb/presence.nvim",
  "max397574/better-escape.nvim",
  "dstein64/vim-startuptime",

  -- {
  --   "goolord/alpha-nvim",
  --   opts = function(_, opts)
  --     -- customize the dashboard header
  --     -- opts.section.header.val = {
  --     --   "   ____              ______ _____ ____ ",
  --     --   "  / __ \\____  ____ _/ / __ / ___// __ \\",
  --     --   " / / / / __ \\/ __ `/ / __  \\__ \\/ / / /",
  --     --   "/ /_/ / /_/ / /_/ / / /_/ ___/ / /_/ / ",
  --     --   "\\____/ .___/\\__,_/_/_____/____/_____/  ",
  --     --   "    /_/                                ",
  --     -- }
  --     opts.section.header.val = {
  --       "________               .__ __________  ________________   ",
  --       "\\_____  \\ ___________  |  |\\______   \\/   _____\\______ \\  ",
  --       " /   |   \\\\____ \\__  \\ |  | |    |  _/\\_____  \\ |    |  \\ ",
  --       "/    |    |  |_> / __ \\|  |_|    |   \\/        \\|    `   \\",
  --       "\\_______  |   __(____  |____|______  /_______  /_______  /",
  --       "        \\/|__|       \\/            \\/        \\/        \\/ ",
  --     }
  --
  --     return opts
  --   end,
  -- },

  -- { "RRethy/nvim-treesitter-textsubjects", event = "User AstroFile", before = "nvim-treesitter" },

  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   before = "nvim-treesitter",
  --   event = "User AstroFile",
  -- },

  {
    "noice.nvim",
    opts = {
      lsp = {
        progress = { enabled = false },
        signature = { enabled = false },
      },
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
  },

  {
    "nvim-notify",
    opts = {
      render = "wrapped-compact",
      stages = "fade_in_slide_out",
      timeout = 3000,
      top_down = false,
    },
  },

  {
    "fzf-lua",
    -- config = function() require('fzf-lua').setup({'telescope'}) end,
    opts = {
      previewers = {
        builtin = {
          extensions = {
            ["png"] = { "ueberzugpp" },
            ["jpg"] = { "ueberzugpp" },
            ["jpeg"] = { "ueberzugpp" },
            ["svg"] = { "ueberzugpp" },
          },
          render_markdown = { enable = true, filetypes = { ["markdown"] = true } },
        },
      },
    },
  },

  {
    "NvChad/ui",
    opts = {
      base46 = { theme = "catppuccin" },
      nvdash = {
        load_on_startup = true,
        header = {
          " ╔─────────────────────────────────╗",
          " │ ██████╗ ██████╗  █████╗ ██╗     │",
          " │██╔═══██╗██╔══██╗██╔══██╗██║     │",
          " │██║   ██║██████╔╝███████║██║     │",
          " │██║   ██║██╔═══╝ ██╔══██║██║     │",
          " │╚██████╔╝██║     ██║  ██║███████╗│",
          " │ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚══════╝│",
          " │    ██████╗ ███████╗██████╗      │",
          " │    ██╔══██╗██╔════╝██╔══██╗     │",
          " │    ██████╔╝███████╗██║  ██║     │",
          " │    ██╔══██╗╚════██║██║  ██║     │",
          " │    ██████╔╝███████║██████╔╝     │",
          " │    ╚═════╝ ╚══════╝╚═════╝      │",
          " ╚─────────────────────────────────╝",
          "",
        },
      },
    },
  },
}
