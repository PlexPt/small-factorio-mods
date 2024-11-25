local IMG_PATH = GENSHIN.modRoot.."/images/"
local util = require("util")
require("lib.animation_util")

--~ local char_name = "miku-bikini-swimsuit-skin"
local my_character = {}

local function getIdlePics(max, IMG_PATH)
    local s = getSeqPics(IMG_PATH .. "idle/", max)
    return s
end

local function getRunningPics(max, IMG_PATH)
    local s = {}
    for i = 1, max do
        table.insert(s, IMG_PATH .. "run/" .. i .. ".png")
    end
    return s
end

local function getRunningGunPics(max, IMG_PATH)
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
            local from = (k - 1) * max
            local name = i + from
            table.insert(s, IMG_PATH .. "run/" .. name .. ".png")
        end
    end
    return s
end

local function getDead(IMG_PATH)
    local s = {
        filename = IMG_PATH .. "dead.png",
        width = 400,
        height = 400,
        shift = util.by_pixel(0.0, -10.0),
        frame_count = 1,
        scale = 0.3,
    }
    return s
end

local function getRunning(IMG_PATH)
    local s = {
        filenames = getRunningPics(160, IMG_PATH),
        width = 400,
        height = 400,
        shift = util.by_pixel(0.0, -20.0),
        frame_count = 20,
        slice = 1,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 8,
        animation_speed = 0.3,
        scale = 0.3,
    }
    return s
end

local function getRunningGun(IMG_PATH)
    local s = {
        filenames = getRunningGunPics(20, IMG_PATH),
        width = 400,
        height = 400,
        slice = 1,
        shift = util.by_pixel(0.0, -20.0),
        frame_count = 20,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 18,
        animation_speed = 0.3,
        scale = 0.3,
    }
    return s

end

local function getIdle(IMG_PATH)
    local s = {
        filenames = getIdlePics(256, IMG_PATH),
        slice = 1,
        width = 400,
        height = 400,
        shift = util.by_pixel(0.0, -20.0),
        frame_count = 64,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 4,
        animation_speed = 0.3,
        scale = 0.3,
    }
    return s
end

local function getMining(imgPath)
    return getIdle(imgPath)
end

local function get_mapping(x)
    return (not data.is_demo) and x or nil
end

my_character.create = function(imgPath, name)

    local characteranimation = {
        idle = {
            layers = {
                getIdle(imgPath),
            }
        },
        idle_with_gun = {
            layers = {
                --characteranimations["level1"]["idle_gun"],
                getIdle(imgPath),
            }
        },
        mining_with_tool = {
            layers = {
                getMining(imgPath),
            }
        },
        running_with_gun = {
            layers = {
                getRunningGun(imgPath),
            }
        },
        running = {
            layers = {
                getRunning(imgPath),
            }
        }
    }

    local animations_live = {
        characteranimation,
        characteranimation,
        characteranimation
    }

    local animations_dead = {
        {
            layers = {
                getDead(imgPath)
            }
        },
        {
            layers = {
                getDead(imgPath)
            }
        },
        {
            layers = {
                getDead(imgPath)
            }
        }
    }

    ------------------------------------------------------------------------------------
    --                                Character corpse                                --
    ------------------------------------------------------------------------------------
    -- We only store properties with values different from the defaults
    -- Define the corpse
    --~ local corpse = table.deepcopy(data.raw["character-corpse"]["character-corpse"])
    local corpse = {}
    corpse.name = name .. "-corpse"
    corpse.localised_name = {"", "entity-name." .. corpse.name ,"genshin-impact-skin.corpse"}
    corpse.localised_description = { "entity-name." .. corpse.name }
    corpse.icon = imgPath .. "icon.png"
    corpse.icon_size = 400
    corpse.pictures = animations_dead

    corpse.armor_picture_mapping = {
        ["heavy-armor"] = 2,
        --~ ["light-armor"] = 2,
        --~ ["modular-armor"] = 3,
        --~ ["power-armor"] = 3,
        --~ ["power-armor-mk2"] = 3
        ["light-armor"] = get_mapping(2),
        ["modular-armor"] = get_mapping(3),
        ["power-armor"] = get_mapping(3),
        ["power-armor-mk2"] = get_mapping(3)
    }



    --~ -- Apply changed values to the copy
    --~ for p_name, property in pairs(corpse) do
        --~ corpse[p_name] = property
    --~ end

    --~ -- Create the corpse
    --~ data:extend({ corpse })



    ------------------------------------------------------------------------------------
    --                                    Character                                   --
    ------------------------------------------------------------------------------------
    -- 我们只存储与默认值不同的属性
    -- We only store properties with values different from the defaults
    local character = {}
    character.name = name
    character.localised_name = { "entity-name." .. character.name }
    character.localised_description = { "entity-name." .. character.name }
    character.icon = imgPath .. "icon.png"
    character.icon_size = 400

    character.animations = animations_live
    character.build_distance = 100
    character.character_corpse = corpse.name
    character.drop_item_distance = 100
    character.enter_vehicle_distance = 3
    character.inventory_size = 100
    character.item_pickup_distance = 10
    character.loot_pickup_distance = 20
    character.mining_with_tool_particles_animation_positions = { 19 }
    character.reach_distance = 100
    character.reach_resource_distance = 2.7
    character.running_sound_animation_positions = { 5, 16 }

    character.tool_attack_result = {
        type = "direct",
        action_delivery = {
            type = "instant",
            target_effects = {
                type = "damage",
                damage = { amount = 8, type = "physical" }
            }
        }
    }
    character.footstep_particle_triggers = {
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
    }
    character.water_reflection = {
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


    --~ -- Copy the default character
    --~ local char = table.deepcopy(data.raw.character.character)

    --~ -- Apply changed values to the copy
    --~ for p_name, property in pairs(character) do
        --~ char[p_name] = property
    --~ end

    --~ -- Create the character
    --~ data:extend({ char })

    return {character = character, corpse = corpse}

end

return my_character
