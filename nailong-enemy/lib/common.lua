local common = {}
local debug_to_log = mods["_debug"]

-- Define the name of the character here. The name should contain the string "SKIN"
-- well as "SkIn_char" etc. This is important as "minime" will use this pattern
-- when looking for characters!
common.IMG_PATH = "__dnf-snow__/images/"

common.char_name = "dnf-snow-mage-skin"

common.dwrite = function(msg)
    if debug_to_log and msg then
        log(msg)
    end
end

return common
