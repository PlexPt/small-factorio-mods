require("datas.girl_creater")
local animation_creator = require("animation_creator")
local sounds = require("__base__.prototypes.entity.sounds")
--local ab_enemy_autoplace = require("armoured-autoplace")
local IMG_PATH = "__girlfriend__/graphics/girlfriend/"
local IMG_DEAD = "__girlfriend__/graphics/dead.png"
IMG_DEAD = IMG_PATH .. "head.png"

local character_map = {

    --安博
    "amber",
    --刻晴
    "keqing",
    "klee",
    "xiao",
    "yea",
    "barbara",
    "ganyu",
    "paimon-plus",
    "paimon",
    "shenhe",
    "ganyu-swim",
    "diluc",
    "fischer",
    "hilichurl",
    "jean",
    "kaeya",
    "lisa",
    "ningguang",
    "traveler",
    "venti",
    "xiangling",
}

for k, char in pairs(character_map) do

    local char_name = "genshin-impact-" .. char .. "-skin"
    local character = data.raw["character"][char_name]

    create_girl_unit(character, char_name)

end

