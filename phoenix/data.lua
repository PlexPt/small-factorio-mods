local animation_creator2 = require("animation_creator")
local sounds = require("__base__.prototypes.entity.sounds")
--local ab_enemy_autoplace = require("armoured-autoplace")
local IMG_PATH = "__phoenix__/graphics/phoenix/"

local phoenix = table.deepcopy(data.raw["unit"]["behemoth-spitter"])

phoenix.name = "phoenix-biter"
phoenix.localised_name = { "entity-name.phoenix-biter" }

phoenix.icon = IMG_PATH .. "1.png"
phoenix.icon_size = 480

--.collision_box = { { 0, 0 }, { 0, 0 } }
phoenix.collision_mask = { layers = {} }
phoenix.selection_box = { { -1, -2.0 }, { 1, 2.0 } }
phoenix.distance_per_frame = 0.1
phoenix.resistances = {
    {
        type = "physical",
        decrease = 20,
        percent = 50
    },
    {
        type = "explosion",
        decrease = 50,
        percent = 80
    },
    {
        type = "fire",
        decrease = 3,
        percent = 100
    }
}

phoenix.run_animation = animation_creator2.getRunning(IMG_PATH)
phoenix.attack_parameters.animation = animation_creator2.getIdle(IMG_PATH)
phoenix.loot = {
    {
        count_max = 1,
        count_min = 1,
        item = "phoenix-biter-loot"
    }
}

phoenix.attack_parameters.ammo_category = "flamethrower"
phoenix.attack_parameters.cooldown = 1
phoenix.attack_parameters.movement_slow_down_factor = 0.4
phoenix.attack_parameters.ammo_type = {
    category = "flamethrower",
    action = {
        type = "direct",
        action_delivery = {
            type = "stream",
            stream = "flamethrower-fire-stream",
            --source_offset = { 0.15, -0.5 }
        }
    }
}

data:extend({
    phoenix,
    {
        type = "item",
        name = "phoenix-biter-loot",
        icon = IMG_PATH .. "1.png",
        icon_size = 400,
        subgroup = "other",
        stack_size = 1,
    },
})


for _, unitSpawner in pairs(data.raw["unit-spawner"]) do
    if (string.find(unitSpawner.name, "hive") or string.find(unitSpawner.name, "biter") or
            string.find(unitSpawner.name, "spitter")) then
        if not unitSpawner.flags then
            unitSpawner.flags = {}
        end
        table.insert(unitSpawner.result_units, { unit = phoenix.name,
            spawn_points = { { 0.3, 0.3 }, { 0.99, 0.8 } } })
    end
end
