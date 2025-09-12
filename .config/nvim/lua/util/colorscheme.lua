-- lua/utils/colorscheme.lua
local M = {}

function M.set(name)
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. name)
  if not status_ok then
    vim.notify("Colorscheme " .. name .. " not found!")
    return
  end

  local file = io.open(vim.fn.stdpath("config") .. "/.nvim-colorscheme", "w")
  if file then
    file:write(name)
    file:close()
  end
end

function M.load_persisted_colorscheme(name)
  local ok, _ = pcall(vim.cmd, "colorscheme" .. name)
  if not ok then
    vim.notify("Colorscheme " .. name .. " not found", vim.log.levels.ERROR)
    return
  end
end

function M.persist_colorscheme(name)
  local path = vim.fn.stdpath("config") .. "/.nvim-colorscheme"
  local file = io.open(path, "w")
  if file then
    file:write(name)
    file:close()
  else
    vim.notify("Failed to persist colorscheme to" .. path, vim.log.levels.ERROR)
  end
end

return M
