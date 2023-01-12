require("datas.girl_creater")
--local ab_enemy_autoplace = require("armoured-autoplace")
local IMG_PATH = "__girlfriend__/graphics/girlfriend/"
local IMG_DEAD = "__girlfriend__/graphics/dead.png"
IMG_DEAD = IMG_PATH .. "head.png"

local character_map = {
    "tianyi-skin"
}

for k, char in pairs(character_map) do

    --local char_name = "genshin-impact-" .. char .. "-skin"
    local character = data.raw["character"][char]
    create_girl_unit(character, char)
end

