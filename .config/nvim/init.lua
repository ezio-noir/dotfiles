-- toggle line number
vim.opt.number = true

-- Use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

require("config.autocmd").setup({
  persist_colorscheme = true,
})
