-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      -- opts.section.header.val = {
      --   "   ____              ______ _____ ____ ",
      --   "  / __ \\____  ____ _/ / __ / ___// __ \\",
      --   " / / / / __ \\/ __ `/ / __  \\__ \\/ / / /",
      --   "/ /_/ / /_/ / /_/ / / /_/ ___/ / /_/ / ",
      --   "\\____/ .___/\\__,_/_/_____/____/_____/  ",
      --   "    /_/                                ",
      -- }
      opts.section.header.val = {
        "________               .__ __________  ________________   ",
        "\\_____  \\ ___________  |  |\\______   \\/   _____\\______ \\  ",
        " /   |   \\\\____ \\__  \\ |  | |    |  _/\\_____  \\ |    |  \\ ",
        "/    |    |  |_> / __ \\|  |_|    |   \\/        \\|    `   \\",
        "\\_______  |   __(____  |____|______  /_______  /_______  /",
        "        \\/|__|       \\/            \\/        \\/        \\/ ",
      }

      return opts
    end,
  },

  { "max397574/better-escape.nvim", enabled = true },

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  { "RRethy/nvim-treesitter-textsubjects", event = "User AstroFile", before = "nvim-treesitter" },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    before = "nvim-treesitter",
    event = "User AstroFile",
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
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

  { "dstein64/vim-startuptime" },
  -- { "markview.nvim", ft = { "markdown", "codecompanion" } },
}
