return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
	"<leader>?",
	function()
	  require("which-key").show({ global = false })
	end,
	desc = "Buffer Local Keymap (which-key)",
      },
    },
  }
}
