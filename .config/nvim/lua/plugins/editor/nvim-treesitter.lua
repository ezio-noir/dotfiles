return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "comment",
          "css",
          "dockerfile",
          "go",
          "html",
          "hyprlang",
          "java",
          "javadoc",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "sql",
          "typescript",
          "xml",
          "yaml",
        },

        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },

        incremental_selection = {
          enable = true,
          -- keymaps = {},
        },
      })
    end,
  }
}
