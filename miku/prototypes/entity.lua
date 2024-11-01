require("util")

local sounds = require("__base__/prototypes/entity/sounds")


-- Constants
local MIKU_LEVELS = 33
local BASE_HEALTH = 10000
local LOGISTICS_RADIUS = 100
local CONSTRUCTION_RADIUS = 100
local CHARGE_APPROACH_DISTANCE = 100
local ROBOT_SLOTS = 40
local MATERIAL_SLOTS = 10

-- Helper functions
local function createBlankSprite()
    return {
        filename = "__miku__/graphics/trans32.png",
        width = 1,
        height = 1,
        frame_count = 1,
        direction_count = 1
    }
end

local function createCircuitConnections()
    return {
        shadow = {
            green = {-2.5, 4.2},
            red = {-2.7, 4}
        },
        wire = {
            green = {-3.5, 3.2},
            red = {-3.7, 3}
        }
    }
end


local function createSoundEffects()
    return {
        open_door = {
            type = "play-sound",
            sound = {filename = "__base__/sound/roboport-door.ogg", volume = 1.2}
        },
        close_door = {
            type = "play-sound",
            sound = {filename = "__base__/sound/roboport-door.ogg", volume = 0.75}
        },
        working_sound = {
            sound = {{
                         filename = "__base__/sound/assembling-machine-t1-1.ogg",
                         volume = 0.5
                     }},
            audible_distance_modifier = 0.5,
            fade_in_ticks = 4,
            fade_out_ticks = 20
        }
    }
end

-- Base prototype configuration
local function createBaseMikuPrototype()
    local blank = createBlankSprite()
    local sounds = createSoundEffects()

    return {
        type = "roboport",
        name = "miku",
        localised_name = {"entity-name.miku"},
        localised_description = {"entity-description.miku"},
        icon = "__miku__/graphics/icons/miku.png",
        icon_size = 240,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 0.2, result = "miku-1"},
        max_health = BASE_HEALTH,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        resistances = {{
                           type = "fire",
                           percent = 70
                       }},
        collision_box = {{-2, -2}, {2, 2}},
        selection_box = {{-3, -3}, {3, 3}},
        alert_icon_shift = util.by_pixel(-3, -12),
        base = blank,
        base_patch = blank,
        door_animation_up = blank,
        door_animation_down = blank,
        recharging_animation = blank,
        request_to_open_door_timeout = 15,
        spawn_and_station_height = -0.1,
        draw_logistic_radius_visualization = false,
        draw_construction_radius_visualization = false,
        circuit_wire_connection_point = createCircuitConnections(),
        circuit_wire_max_distance = 10,

        -- Crafting properties
        crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
        crafting_speed = 0.5,
        energy_source = {type = "void"},
        energy_usage = "75kW",
        fast_replaceable_group = "miku",
        next_upgrade = "miku-" .. 2,
        miku_level = 1,

        -- Roboport properties
        logistics_radius = 100,
        construction_radius = 100,
        charge_approach_distance = 100,
        robot_slots_count = 40,
        material_slots_count = 10,
        recharge_minimum = "40MJ",
        charging_energy = "1000MW",
        charging_offsets = {
            {-1.5, -0.5}, {1.5, -0.5}, {1.5, 1.5}, {-1.5, 1.5}
        },

        -- Sound effects
        open_door_trigger_effect = sounds.open_door,
        close_door_trigger_effect = sounds.close_door,
        working_sound = sounds.working_sound,

        -- Miku specific properties
        is_miku = true
    }
end

-- Create item prototype
local function createMikuItem(level)
    return {
        type = "item",
        name = "miku-" .. level,
        localised_name = {"item-name.miku"},
        icon = "__miku__/graphics/icons/miku.png",
        icon_size = 240,
        subgroup = "logistic-network",
        order = "c[signal]-a[roboport]",
        place_result = "miku-" .. level,
        stack_size = 1
    }
end

-- Main generation logic
local function generateMikuPrototypes()
    local base_prototype = createBaseMikuPrototype()

    for i = 1, MIKU_LEVELS do
        local miku_entity = table.deepcopy(base_prototype)
        local start_frame = (i - 1) * 200 + 1
        local end_frame = (i - 1) * 200 + 200

        -- Set level-specific properties
        miku_entity.name = "miku-" .. i
        miku_entity.next_upgrade = "miku-" .. (i % MIKU_LEVELS + 1)
        miku_entity.miku_level = i

        -- Set animation
        miku_entity.base_animation = getStripesAnimation(
                "__miku__/graphics/entity/miku/",
                start_frame,
                end_frame,
                480, 480,
                0.5,
                util.by_pixel(0, 0)
        )

        -- Register prototypes
        data:extend({
            miku_entity,
            createMikuItem(i)
        })
    end
end



-- Initialize
generateMikuPrototypes()

--
--local miku = {
--    type = "roboport",
--    name = "miku",
--    localised_name = { "entity-name.miku" },
--    localised_description = { "entity-description.miku" },
--    icon = "__miku__/graphics/icons/miku.png",
--    icon_size = 240,
--    flags = { "placeable-player", "player-creation" },
--    minable = { mining_time = 0.2, result = "miku-1" },
--    max_health = 10000,
--    --corpse = "assembling-machine-1-remnants",
--    corpse = "big-remnants",
--    dying_explosion = "medium-explosion",
--    --dying_explosion = "assembling-machine-1-explosion",
--    resistances = {
--        {
--            type = "fire",
--            percent = 70
--        }
--    },
--    collision_box = { { -2, -2 }, { 2, 2 } },
--    selection_box = { { -3, -3 }, { 3, 3 } },
--    alert_icon_shift = util.by_pixel(-3, -12),
--    base = blank,
--    base_patch = blank,
--    door_animation_up = blank,
--    door_animation_down = blank,
--    recharging_animation = blank,
--    request_to_open_door_timeout = 15,
--    spawn_and_station_height = -0.1,
--    draw_logistic_radius_visualization = false,
--    draw_construction_radius_visualization = false,
--    circuit_wire_connection_point = receiver_connections,
--    circuit_wire_max_distance = 10,
--
--    --base_animation = getStripesAnimation("__miku__/graphics/entity/miku/",
--    --        1, 200, 480, 480, 0.2, util.by_pixel(25, -80)),
--    crafting_categories = { "crafting", "basic-crafting", "advanced-crafting" },
--    crafting_speed = 0.5,
--    energy_source = { type = "void" },
--    energy_usage = "75kW",
--    fast_replaceable_group = "miku",
--    next_upgrade = "miku-" .. 2,
--    miku_level = 1,
--    is_miku = true,
--    logistics_radius = 100,
--    construction_radius = 100,
--    charge_approach_distance = 100,
--    robot_slots_count = 40,
--    material_slots_count = 10,
--    recharge_minimum = "40MJ",
--    -- per one charge slot
--    charging_energy = "1000MW",
--    charging_offsets = {
--        { -1.5, -0.5 }, { 1.5, -0.5 }, { 1.5, 1.5 }, { -1.5, 1.5 }
--    },
--    --open_sound = sounds.machine_open,
--    --close_sound = sounds.machine_close,
--    --vehicle_impact_sound = sounds.generic_impact,
--    open_door_trigger_effect = {
--        {
--            type = "play-sound",
--            sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.2 }
--        },
--    },
--    close_door_trigger_effect = {
--        {
--            type = "play-sound",
--            sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }
--        },
--    },
--    working_sound = {
--        sound = {
--            {
--                filename = "__base__/sound/assembling-machine-t1-1.ogg",
--                volume = 0.5
--            }
--        },
--        audible_distance_modifier = 0.5,
--        fade_in_ticks = 4,
--        fade_out_ticks = 20
--    }
--}
--
--for i = 1, 33 do
--
--    local start = (i - 1) * 200 + 1
--    local endf = (i - 1) * 200 + 200
--    local miku_entity = table.deepcopy(miku)
--    miku_entity.name = "miku-" .. i
--    miku_entity.next_upgrade = "miku-" .. (i + 1)
--    if i == 33 then
--        miku_entity.next_upgrade = "miku-1"
--    end
--
--    miku_entity.base_animation = getStripesAnimation("__miku__/graphics/entity/miku/",
--            start, endf, 480, 480, 0.5, util.by_pixel(0, 0))
--
--    data:extend({
--        miku_entity,
--        {
--            type = "item",
--            name = "miku-" .. i,
--            localised_name = { "item-name.miku" },
--            icon = "__miku__/graphics/icons/miku.png",
--            icon_size = 240,
--            subgroup = "logistic-network",
--            order = "c[signal]-a[roboport]",
--            place_result = "miku-" .. i,
--            stack_size = 1
--        }
--    })
--
--end

