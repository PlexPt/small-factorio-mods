-- prototypes/entity.lua
local util = require("util")

local cloningvat = {
    --基础属性
    type = "furnace",
    name = "thermal-cloning-vat",
    minable = { mining_time = 0.5, result = "thermal-cloning-vat" },
    max_health = 2000,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    crafting_categories = { "cloning" },
    energy_usage = "100kW",
    crafting_speed = 10,
    source_inventory_size = 1,
    result_inventory_size = 1,
    allowed_effects = { 'consumption', 'speed', 'pollution' },
    module_specification = {
        module_slots = 5
    },
    energy_source = {
        type = "burner", -- 这里"burner"对于热能
        fuel_categories = { "chemical" },
        effectivity = 1,
        fuel_inventory_size = 4,
        emissions_per_minute = { pollution = 100 },
        usage_priority = "secondary-input",
        light_flicker = {
            color = { 0, 0, 0 },
            minimum_intensity = 0.6,
            maximum_intensity = 0.95
        },
        smoke = {
            {
                name = "smoke",
                deviation = { 0.1, 0.1 },
                frequency = 5,
                position = { 0.0, -0.8 },
                starting_vertical_speed = 0.08,
                starting_frame_deviation = 60
            }
        }
    },
    --图形
    icon = "__cloning-vat__/graphics/icons/thermal-cloning-vat.png",
    icon_size = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    collision_box = { { -4.25, -4.25 }, { 4.25, 4.25 } },
    selection_box = { { -4.5, -4.5 }, { 4.5, 4.5 } },
    scale_entity_info_icon = true,
    always_draw_idle_animation = true,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__cloning-vat__/graphics/entity/thermal-cloning-vat.png",
                    priority = "extra-high",
                    width = 500,
                    height = 500,
                    frame_count = 1,
                    scale = 0.6
                    --shift = util.by_pixel(14.5, 2)
                }
            }
        },
    },
    resistances = {
        {
            type = "fire",
            percent = 90
        },
        {
            type = "explosion",
            percent = 30
        },
        {
            type = "impact",
            percent = 30
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            --pipe_covers = pipecoverspictures(),  -- 这是一个标准的函数来显示流体管道连接的覆盖图
            base_area = 10,
            base_level = -1,
            pipe_connections = {
                {
                    direction = defines.direction.west,
                    flow_direction = "input",
                    position = { -4.25, 0 }
                }
            }, -- 你可以更改这个位置以符合你的实体的图形
            volume = 1000
        },
        {
            production_type = "output",
            --pipe_covers = pipecoverspictures(),
            base_area = 10,
            base_level = 1,
            pipe_connections = {
                {
                    direction = defines.direction.east,
                    flow_direction = "output",
                    position = { 4.25, 0 }
                }
            }, -- 同样，更改这个位置以适应你的设计
            volume = 1000
        }
    },

    se_allow_in_space = true
    -- other entity properties...
}

local electriccloningvat = table.deepcopy(cloningvat)

electriccloningvat.name = "electric-cloning-vat"
electriccloningvat.minable = { mining_time = 1, result = "electric-cloning-vat" }
electriccloningvat.icon = "__cloning-vat__/graphics/icons/electric-cloning-vat.png"
electriccloningvat.energy_usage = "90kW"
electriccloningvat.energy_source = { type = "electric",
                                     emissions_per_minute = { pollution = 100 },
                                     usage_priority = "secondary-input" }
electriccloningvat. graphics_set. animation = {
    layers = {
        {
            filename = "__cloning-vat__/graphics/entity/electric-cloning-vat.png",
            priority = "extra-high",
            width = 500,
            height = 500,
            frame_count = 1,
            scale = 0.8
            --shift = util.by_pixel(14.5, 2)
        }
    }
}

data:extend({
    cloningvat,
    electriccloningvat
})
