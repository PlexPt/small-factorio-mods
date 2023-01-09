local animation_creator = require("animation_creator")
local sounds = require("__base__.prototypes.entity.sounds")
--local ab_enemy_autoplace = require("armoured-autoplace")
local IMG_PATH = "__girlfriend__/graphics/girlfriend/"
local IMG_DEAD = "__girlfriend__/graphics/dead.png"
IMG_DEAD = IMG_PATH .. "head.png"

local girlfriend = table.deepcopy(data.raw["unit"]["compilatron"])

girlfriend.name = girl_entity
girlfriend.icon = IMG_PATH .. "head.png"
girlfriend.icon_size = 225
--girlfriend.distance_per_frame = 0.1
--girlfriend.run_animation = animation_creator.getRunning(IMG_PATH)
--girlfriend.attack_parameters.animation = animation_creator.getIdle(IMG_PATH)
girlfriend.loot = {
    {
        count_max = 1,
        count_min = 1,
        item = "girlfriend-loot"
    }
}
girlfriend.NextTime = 0

data:extend({
    {
        type = "item",
        name = "girlfriend-loot",
        icon = IMG_DEAD,
        icon_size = 225,
        subgroup = "other",
        stack_size = 1,
    },
    girlfriend,

})
