-- lua/lib/user/utils.lua
-- /Volumes/Data/Projects/lvim/lua/lib/user/utils.lua
M = {}
M.safe_require = function(module, callback)
  local ok, lib = pcall(require, module)
  if not ok then
    print("Error loading " .. module)
    print(lib)
  end

  callback(lib)
end

return M
