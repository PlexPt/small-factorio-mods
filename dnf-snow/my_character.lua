require("lib.animation_util")
local util = require("util")
local common = require('lib.common')

local IMG_PATH = common.IMG_PATH

local char_icon = IMG_PATH .. "idle/45.png"

local char_name = common.char_name

local function getHr(s)
    return getAnimationWithHr(s)
end

local function getIdlePics(max)
    local s = getSeqPics("idle/", max)
    return s
end

local function getRunningPics(max)
    local s = {}
    for k = 1, 8 do
        for i = 1, max do
            table.insert(s, IMG_PATH .. k .. "/" .. i .. ".png")
        end
    end
    return s
end

local function getRunningGunPics(max)
    local s = {}
    local t = {
        a1 = 1,
        a2 = 1,
        a3 = 1,
        a4 = 2,
        a5 = 2,
        a6 = 2,
        a7 = 2,
        a8 = 3,
        a9 = 3,
        a29 = 3,
        a28 = 3,
        a27 = 4,
        a26 = 4,
        a25 = 4,
        a24 = 4,
        a23 = 5,
        a22 = 5,
        a21 = 5,
    }
    for _, k in pairs(t) do
        for i = 1, max do
            table.insert(s, IMG_PATH .. k .. "/" .. i .. ".png")
        end
    end
    return s
end

local function getDead()
    local s = {
        filename = IMG_PATH .. "dead.png",
        width = 200,
        height = 200,
        shift = util.by_pixel(0.0, -10.0),
        frame_count = 2,
        scale = 0.5,
    }
    return getHr(s)
end

local function getRunning()
    local s = {
        filenames = getRunningPics(21),
        width = 400,
        height = 400,
        shift = util.by_pixel(0.0, -20.0),
        frame_count = 21,
        slice = 1,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 8,
        animation_speed = 0.3,
        scale = 0.3,
    }
    return getHr(s)
end

local function getRunningGun()
    local s = {
        filenames = getRunningGunPics(21),
        width = 400,
        height = 400,
        slice = 1,
        shift = util.by_pixel(0.0, -20.0),
        frame_count = 21,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 18,
        animation_speed = 0.3,
        scale = 0.3,
    }
    return getHr(s)

end

local function getIdle()
    local s = {
        filenames = getIdlePics(72),
        slice = 1,
        width = 400,
        height = 400,
        shift = util.by_pixel(0.0, -20.0),
        frame_count = 18,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 4,
        animation_speed = 0.4,
        scale = 0.3,
    }
    return getHr(s)
end

local function getMining()
    return getIdle()
end

characteranimation = {
    idle = {
        layers = {
            getIdle(),
        }
    },
    idle_with_gun = {
        layers = {
            --characteranimations["level1"]["idle_gun"],
            getIdle(),
        }
    },
    mining_with_tool = {
        layers = {
            getMining(),
        }
    },
    running_with_gun = {
        layers = {
            getRunningGun(),
        }
    },
    running = {
        layers = {
            getRunning(),
        }
    }
}

animations_live = {
    characteranimation,
    characteranimation,
    characteranimation
}

animations_dead = {
    {
        layers = {
            getDead()
        }
    },
    {
        layers = {
            getDead()
        }
    },
    {
        layers = {
            getDead()
        }
    }
}


--Character definition
data:extend(
        {
            {
                type = "character-corpse",
                name = char_name .. "-corpse",
                icon = char_icon,
                icon_size = 400,
                minable = { mining_time = 2 },
                time_to_live = 15 * 60 * 60, -- 15 minutes
                selection_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
                selection_priority = 100, -- 0-255 value with 255 being on-top of everything else
                flags = { "placeable-off-grid", "not-rotatable", "not-on-map" },
                pictures = animations_dead,
                -- The highest index found in the corpse is the graphics variation used
                armor_picture_mapping = {
                    --nil = 1,
                    ["light-armor"] = 2,
                    ["heavy-armor"] = not data.is_demo and 2 or nil,
                    ["modular-armor"] = not data.is_demo and 3 or nil,
                    ["power-armor"] = not data.is_demo and 3 or nil,
                    ["power-armor-mk2"] = not data.is_demo and 3 or nil
                }
            },
            {
                type = "character",
                name = char_name,
                -- character_corpse will be replaced in data-final-fixes.lua, if necessary!
                character_corpse = char_name .. "-corpse",
                icon = char_icon,
                icon_size = 400,
                flags = { "placeable-off-grid", "breaths-air", "not-repairable", "not-on-map", "not-flammable" },
                max_health = 250,
                alert_when_damaged = false,
                healing_per_tick = 0.15,
                collision_box = { { -0.2, -0.2 }, { 0.2, 0.2 } },
                selection_box = { { -0.4, -1.4 }, { 0.4, 0.2 } },
                hit_visualization_box = { { -0.2, -1.1 }, { 0.2, 0.2 } },
                sticker_box = { { -0.2, -1 }, { 0.2, 0 } },
                crafting_categories = { "crafting" },
                mining_categories = { "basic-solid" },
                inventory_size = 100,
                build_distance = 100,
                drop_item_distance = 100,
                reach_distance = 100,
                item_pickup_distance = 10,
                loot_pickup_distance = 20,
                enter_vehicle_distance = 3,
                reach_resource_distance = 2.7,
                ticks_to_keep_gun = 600,
                ticks_to_keep_aiming_direction = 100,
                --ticks you need to wait after firing a weapon or taking damage to get out of combat and get healed
                ticks_to_stay_in_combat = 600,
                damage_hit_tint = { r = 1, g = 0, b = 0, a = 0 },
                running_speed = 0.15,
                distance_per_frame = 0.13,
                maximum_corner_sliding_distance = 0.7,
                subgroup = "creatures",
                order = "a",
                eat = {
                    {
                        filename = "__base__/sound/eat.ogg",
                        volume = 1
                    }
                },
                heartbeat = {
                    {
                        filename = "__base__/sound/heartbeat.ogg"
                    }
                },
                tool_attack_result = {
                    type = "direct",
                    action_delivery = {
                        type = "instant",
                        target_effects = {
                            type = "damage",
                            damage = { amount = 8, type = "physical" }
                        }
                    }
                },

                animations = animations_live,
                light = {
                    {
                        minimum_darkness = 0.3,
                        intensity = 0.4,
                        size = 25,
                        color = { r = 1.0, g = 1.0, b = 1.0 }
                    },
                    {
                        type = "oriented",
                        minimum_darkness = 0.3,
                        picture = {
                            filename = "__core__/graphics/light-cone.png",
                            priority = "extra-high",
                            flags = { "light" },
                            scale = 2,
                            width = 200,
                            height = 200
                        },
                        shift = { 0, -13 },
                        size = 2,
                        intensity = 0.6,
                        color = { r = 1.0, g = 1.0, b = 1.0 }
                    }
                },
                mining_speed = 0.5,
                mining_with_tool_particles_animation_positions = { 19 },
                running_sound_animation_positions = { 5, 16 },
                footstep_particle_triggers = {
                    {
                        tiles = { "water-shallow" },

                        type = "create-particle",
                        repeat_count = 5,
                        particle_name = "shallow-water-droplet-particle",
                        initial_height = 0.2,
                        speed_from_center = 0.01,
                        speed_from_center_deviation = 0.05,
                        initial_vertical_speed = 0.02,
                        initial_vertical_speed_deviation = 0.05,
                        offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } }
                    },
                    {
                        tiles = { "water-mud" },

                        type = "create-particle",
                        repeat_count = 5,
                        particle_name = "shallow-water-droplet-particle",
                        initial_height = 0.2,
                        speed_from_center = 0.01,
                        speed_from_center_deviation = 0.05,
                        initial_vertical_speed = 0.02,
                        initial_vertical_speed_deviation = 0.05,
                        offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } }
                    }
                },
                water_reflection = {
                    pictures = {
                        filename = IMG_PATH .. "character-reflection.png",
                        priority = "extra-high",
                        -- flags = { "linear-magnification", "not-compressed" },
                        -- default value: flags = { "terrain-effect-map" },
                        width = 13,
                        height = 19,
                        shift = util.by_pixel(0, 67 * 0.5),
                        scale = 5,
                        variation_count = 1
                    },
                    rotate = false,
                    orientation_to_variation = false
                }
            } })

--if ((data.raw["character"]) and (data.raw["character"]["character"])) then
--    data.raw["character"]["character"]["animations"] = animations_live
--end
--
--if ((data.raw["character-corpse"]) and (data.raw["character-corpse"]["character-corpse"])) then
--    data.raw["character-corpse"]["character-corpse"]["pictures"] = animations_dead
--end

