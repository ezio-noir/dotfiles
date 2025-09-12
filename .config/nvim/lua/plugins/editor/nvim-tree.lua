return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      disable_netrw = true,
      sort = { sorter = "case_sensitive" },
      filters = { dotfiles = false },
      view = {
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = function()
            local WIDTH_RATIO = 0.25

            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = math.floor(screen_w * WIDTH_RATIO)
            local window_h = screen_h

            return {
              relative = "editor",
              border = "rounded",
              row = 0,
              col = screen_w - window_w,
              width = window_w,
              height = window_h,
            }
          end,
        },
      },
      renderer = {
        add_trailing = true,
      },
      tab = {
        sync = {
          open = true,
        }
      },
    },
    keys = {
      { "<leader>E", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
      { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Focus File Explorer" },
    },
    config = function(_, opts)
      local function custom_on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function map_opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "h", api.node.navigate.parent_close, map_opts("Move to parent directory"))
        vim.keymap.set("n", "l", api.node.open.tab_drop, map_opts("Expand directory/Open file in new tab"))
        vim.keymap.set("n", "L", api.node.open.edit, map_opts("Open file"))
        vim.keymap.set("n", "<C-v>", api.node.open.vertical, map_opts("Open vertical"))
      end

      opts.on_attach = custom_on_attach
      require("nvim-tree").setup(opts)
    end,
  },
}
