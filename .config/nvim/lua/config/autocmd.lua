local M = {}

M.setup = function(opts)
  vim.api.nvim_create_augroup("NvimPersistColorscheme", { clear = true })
  vim.api.nvim_create_augroup("NvimTreeResize", { clear = true })

  -- Persist colorscheme
  if opts.persist_colorscheme then
    -- Load persisted colorscheme
    local colorscheme_file = io.open(vim.fn.stdpath("config") .. "/.nvim-colorscheme", "r")
    if colorscheme_file then
      local colorscheme = colorscheme_file:read("*a")
      colorscheme_file:close()
      if colorscheme and #colorscheme > 0 then
        pcall(vim.cmd, "colorscheme " .. colorscheme)
      end
    end

    -- Enable persist color on changke
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = "NvimPersistColorscheme",
      callback = function(args)
        require("util.colorscheme").persist_colorscheme(args.match)
      end,
    })
  end

  -- Resize nvim-tree window on window resize
  vim.api.nvim_create_autocmd({ "VimResized", "WinResized" }, {
    group = "NvimTreeResize",
    callback = function()
      local api = require("nvim-tree.api")
      local winid = api.tree.winid()
      if winid and vim.api.nvim_win_is_valid(winid) then
        api.tree.close()
        api.tree.open()
      end
    end,
  })
end

return M

