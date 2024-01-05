Lunar vim config
-------------------

Lvim configuration [^1].


## Installation

```
git clone https://github.com/mjacobus/lvim
cd lvim
./install
```


To remove a pattern, add the following in your `.project.lua` file

```lua
local pattern = lvim.format_on_save.pattern
for i, ext in ipairs(pattern) do
  if ext == "*.rb" then
    table.remove(pattern, i)
    break
  end
end

lvim.format_on_save.pattern = pattern
```

#### Resources

- https://www.lunarvim.org/
- https://github.com/LunarVim/starter.lvim
- https://github.com/ChristianChiarulli/lvim
- https://github.com/abzcoding/lvim
- https://github.com/rebuilt/lvim

[^1]: Extracted from [another repo](https://github.com/mjacobus/dotfiles/commit/8ce9f02b222a698bdb76c741cfb8bf269b24e054)
