local animation_creator = require("animation_creator")
local sounds = require("__base__.prototypes.entity.sounds")
--local ab_enemy_autoplace = require("armoured-autoplace")
local IMG_PATH = "__beaver__/graphics/beaver/"

local beaver = table.deepcopy(data.raw["unit"]["behemoth-biter"])

beaver.name = "beaver-biter"
beaver.icon = IMG_PATH .. "235.png"
beaver.icon_size = 400
beaver.distance_per_frame = 0.1
beaver.run_animation = animation_creator.getRunning(IMG_PATH)
beaver.attack_parameters.animation = animation_creator.getIdle(IMG_PATH)
beaver.loot = {
    {
        count_max = 1,
        count_min = 1,
        item = "beaver-biter-loot"
    }
}
--flying.collision_box = { { 0, 0 }, { 0, 0 } }
--flying.collision_mask = {}

data:extend({
    {
        type = "item",
        name = "beaver-biter-loot",
        icon = IMG_PATH .. "235.png",
        icon_size = 400,
        subgroup = "other",
        stack_size = 1,
    },
    beaver,

})

for _, unitSpawner in pairs(data.raw["unit-spawner"]) do
    if (string.find(unitSpawner.name, "hive") or string.find(unitSpawner.name, "biter") or
            string.find(unitSpawner.name, "spitter")) then
        if not unitSpawner.flags then
            unitSpawner.flags = {}
        end
        table.insert(unitSpawner.result_units, { unit = beaver.name,
                                                 spawn_points = { { 0.0, 0.3 }, { 0.99, 0.8 } } })
    end
end
