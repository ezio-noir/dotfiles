return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>uC",
        function()
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")
          require("telescope.builtin").colorscheme({
            enable_preview = true,
          })
        end,
        desc = "Pick colorscheme (with preview)",
      },
    },
  },
}
