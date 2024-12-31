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

  { "RRethy/nvim-treesitter-textsubjects", event = "User AstroFile", before = "nvim-treesitter" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "v",
          node_decremental = "V",
        },
      },
    },
  },

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
    keys = {
      { "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Git Files" },
    },
    opts = {
      oldfiles = {
        -- In Telescope, when I used <leader>fr, it would load old buffers.
        -- fzf lua does the same, but by default buffers visited in the current
        -- session are not included. I use <leader>fr all the time to switch
        -- back to buffers I was just in. If you missed this from Telescope,
        -- give it a try.
        include_current_session = true,
      },
      previewers = {
        builtin = {
          -- fzf-lua is very fast, but it really struggled to preview a couple files
          -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
          -- It turns out it was Treesitter having trouble parsing the files.
          -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
          -- (Yes, I know you shouldn't have 100KB minified files in source control.)
          syntax_limit_b = 1024 * 100, -- 100KB

          extensions = {
            ["png"] = { "ueberzug" },
            ["jpg"] = { "ueberzug" },
            ["jpeg"] = { "ueberzug" },
            ["svg"] = { "ueberzug" },
          },

          ueberzug_scaler = "cover",
          render_markdown = { enable = true, filetypes = { ["markdown"] = true } },
        },
      },
      grep = {
        -- One thing I missed from Telescope was the ability to live_grep and the
        -- run a filter on the filenames.
        -- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
        -- With this change, I can sort of get the same behaviour in live_grep.
        -- ex: > enable --*/plugins/*
        -- I still find this a bit cumbersome. There's probably a better way of doing this.
        rg_glob = true, -- enable glob parsing
        glob_flag = "--iglob", -- case insensitive globs
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
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
          "╔─────────────────────────────────╗",
          "│ ██████╗ ██████╗  █████╗ ██╗     │",
          "│██╔═══██╗██╔══██╗██╔══██╗██║     │",
          "│██║   ██║██████╔╝███████║██║     │",
          "│██║   ██║██╔═══╝ ██╔══██║██║     │",
          "│╚██████╔╝██║     ██║  ██║███████╗│",
          "│ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚══════╝│",
          "│    ██████╗ ███████╗██████╗      │",
          "│    ██╔══██╗██╔════╝██╔══██╗     │",
          "│    ██████╔╝███████╗██║  ██║     │",
          "│    ██╔══██╗╚════██║██║  ██║     │",
          "│    ██████╔╝███████║██████╔╝     │",
          "│    ╚═════╝ ╚══════╝╚═════╝      │",
          "╚─────────────────────────────────╝",
        },
        buttons = {
          { txt = "  Find File", keys = "Spc f f", cmd = "FzfLua files" },
          { txt = "  Recent Files", keys = "Spc f o", cmd = "FzfLua oldfiles" },
          { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "FzfLua live_grep" },
          { txt = "󱥚  Themes", keys = "Spc f t", cmd = ":lua require('nvchad.themes').open()" },
          {
            txt = "  Last Session",
            keys = "Spc S l",
            cmd = ":lua require('resession').load 'Last Session'",
          },
          { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
          {
            txt = function()
              local stats = require("lazy").stats()
              local ms = math.floor(stats.startuptime) .. " ms"
              return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
            end,
            hl = "NvDashLazy",
            no_gap = true,
          },

          { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<Esc>"] = { "hide", "fallback" },
      },
      -- completion = { list = { selection = "manual" } },
    },
  },
}
