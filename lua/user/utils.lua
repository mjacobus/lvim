-- lua/lib/user/utils.lua
-- /Volumes/Data/Projects/lvim/lua/lib/user/utils.lua
local NullObject = setmetatable({}, {
  __index = function(self, key)
    -- Return a function that does nothing for undefined methods
    return function(...)
      return self
    end
  end
})

M = {}
M.safe_require = function(module, callback)
  local ok, lib = pcall(require, module)
  if not ok then
    print("Error loading " .. module)
    return NullObject
  end

  if callback == nil then
    return lib
  end

  callback(lib)

  return lib
end

return M
