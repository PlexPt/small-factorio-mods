local common = {}

-- Debugging depends on a local mod. If you don't have this but want to enable debugging,
-- set "default = true". But don't forget to reverse the change before uploading your mod!
local default = false
local debug_to_log = mods["_debug"] or default

-- Define the name of the character here. The name should contain the string "SKIN"
-- well as "SkIn_char" etc. This is important as "minime" will use this pattern
-- when looking for characters!
common.char_name = "miku-bikini-swimsuit-skin"
common.IMG_PATH = "__miku-bikini-swimsuit__/images/"

common.dwrite = function(msg)
    if debug_to_log and msg then
        log(msg)
    end
end

return common
