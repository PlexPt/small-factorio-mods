local animation_creator = require("animation_creator")
local sounds = require("__base__.prototypes.entity.sounds")
--local ab_enemy_autoplace = require("armoured-autoplace")
local IMG_PATH = "__girlfriend__/graphics/girlfriend/"
local IMG_DEAD = "__girlfriend__/graphics/dead.png"
IMG_DEAD = IMG_PATH .. "head.png"

function loge(entity, name)
    log("=======================" .. name .. "==============================")
    log(serpent.block(entity))
    log("=======================" .. name .. "==============================")
end


local compilatron_animations =
{
    walk =
    {
        width = 78,
        height = 104,
        frame_count = 2,
        axially_symmetrical = false,
        direction_count = 32,
        shift = util.by_pixel(0.0, -14),
        scale = 0.5,
        stripes =
        {
            {
                filename = "__girlfriend__/graphics/compilatron/compilatron-walk-1.png",
                width_in_frames = 2,
                height_in_frames = 16
            },
            {
                filename = "__girlfriend__/graphics/compilatron/compilatron-walk-2.png",
                width_in_frames = 2,
                height_in_frames = 16
            }
        }
    },
    walk_shadow =
    {
        width = 142,--72,
        height = 56,--30,
        frame_count = 2,
        axially_symmetrical = false,
        direction_count = 32,
        shift = util.by_pixel(15.5, -0.5),
        draw_as_shadow = true,
        scale = 0.5,
        stripes = util.multiplystripes(2,
                {
                    {
                        filename = "__girlfriend__/graphics/compilatron/compilatron-walk-shadow.png",
                        width_in_frames = 1,
                        height_in_frames = 32
                    }
                })
    }
}

local girlfriend = {
    type = "unit",
    name = "compilatron",
    icon = "__girlfriend__/graphics/compilatron-icon.png",
    icon_size = 64,
    flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air" },
    map_color = { r = 0, g = 0.365, b = 0.58, a = 1 },
    max_health = 100,
    order = "z-z-z",
    subgroup = "enemies",
    has_belt_immunity = true,
    selectable_in_game = true,
    can_open_gates = true,
    healing_per_tick = 0,
    collision_box = { { -0.2, -0.2 }, { 0.2, 0.2 } },
    selection_box = { { -0.8, -1.3 }, { 0.8, 0.5 } },
    attack_parameters = {
        type = "projectile",
        damage_modifier = 1,
        range = 0.5,
        cooldown = 35,
        ammo_category = "melee",
        ammo_type = {
            category = "melee",
            target_type = "entity",
            action = {
                type = "direct",
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        type = "damage",
                        damage = {
                            amount = 10,
                            type = "physical"
                        }
                    }
                }
            }
        },
        animation = {
            layers = {
                compilatron_animations.walk_shadow,
                compilatron_animations.walk
            }
        }
    },
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.1,
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    run_animation = {
        layers = {
            compilatron_animations.walk_shadow,
            compilatron_animations.walk
        }
    },
    water_reflection = {
        pictures = {
            filename = "__girlfriend__/graphics/compilatron/compilatron-reflection.png",
            priority = "extra-high",
            width = 20,
            height = 20,
            shift = util.by_pixel(0, 67 * 0.5),
            scale = 5,
            variation_count = 1
        },
        rotate = false,
        orientation_to_variation = false
    }
}

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



data:extend(
        {
            {
                type = "sprite",
                name = "tooltip-category-electricity",
                filename = "__core__/graphics/icons/tooltips/tooltip-category-electricity.png",
                priority = "extra-high-no-scale",
                width = 32,
                height = 40,
                flags = {"gui-icon"},
                mipmap_count = 2,
                scale = 0.5
            }

        })
