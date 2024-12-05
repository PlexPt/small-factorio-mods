local pipe_pic = assembler3pipepictures()
local pipecoverpic = pipecoverspictures()

local box48 = { { -2.4, -2.4 }, { 2.4, 2.4 } }

local box3 = { { -1.5, -1.5 }, { 1.5, 1.5 } }  -- 调整为3的大小
local box4 = { { -2, -2 }, { 2, 2 } }  -- 保持不变
local box5 = { { -2.5, -2.5 }, { 2.5, 2.5 } }  -- 保持不变
local box6 = { { -3, -3 }, { 3, 3 } }  -- 调整为6的大小
local box7 = { { -3.5, -3.5 }, { 3.5, 3.5 } }  -- 调整为7的大小
local box8 = { { -4, -4 }, { 4, 4 } }  -- 调整为8的大小
local box11 = { { -5.5, -5.5 }, { 5.5, 5.5 } }

local function shrinkBox(box)
    -- 获取 box 的左下角和右上角坐标
    local leftBottom = box[1]
    local rightTop = box[2]

    -- 计算缩小后的坐标
    local newLeftBottom = { leftBottom[1] + 0.1, leftBottom[2] + 0.1 }
    local newRightTop = { rightTop[1] - 0.1, rightTop[2] - 0.1 }

    -- 返回缩小后的 box
    return { newLeftBottom, newRightTop }
end

local base = {
    type = "assembling-machine",
    name = "advanced-foundry",
    icon = "__finely-crafted-graphics__/graphics/icon.png",
    icon_size = 144,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { hardness = 0.2, mining_time = 1, result = "universal-machine" },
    max_health = 2000,
    inventory_size = 300,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    resistances = { { type = "fire", percent = 90 } },
    fluid_boxes = {
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { -2, -2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 0, -2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 2, -2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        --北
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.west, flow_direction = "input", position = { -2.3, -2 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.west, flow_direction = "input", position = { -2.3, 0 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.west, flow_direction = "input", position = { -2.3, 2 } } },
            secondary_draw_orders = { north = -1 }
        },
        --{
        --    production_type = "input",
        --    volume = 1000,
        --    pipe_picture = pipe_pic,
        --    pipe_covers = pipecoverpic,
        --    pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 4, -4 } } },
        --    secondary_draw_orders = { north = -1 }
        --},
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { -2, 2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 0, 2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 2, 2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.east, flow_direction = "output", position = { 2.3, -2 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.east, flow_direction = "output", position = { 2.3, 0 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.east, flow_direction = "output", position = { 2.3, 2 } } },
            secondary_draw_orders = { north = -1 }
        },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
    selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
    graphics_set = {
        animation = {
            layers = {

            },
        },

        reset_animation_when_frozen = true
    },
    crafting_categories = { "advanced-crafting",
                            "basic-crafting",
                            "centrifuging",
                            "chemistry",
                            "crafting",
                            "crafting-with-fluid",
                            "crafting-with-fluid-or-metallurgy",
                            "pressing",
                            "electronics",
                            "electronics-with-fluid",
                            "electronics-or-assembling",
                            "cryogenics-or-assembling",
                            "organic-or-hand-crafting",
                            "organic-or-assembling",
                            "metallurgy-or-assembling",
                            "oil-processing",
                            "rocket-building",
                            "smelting", },

    crafting_speed = 3,
    impact_category = "metal",
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {
            pollution = 10
        }
    },

    circuit_connector = circuit_connector_definitions["assembling-machine"],
    circuit_wire_max_distance = 20,
    energy_usage = "300kW",
    ingredient_count = 6,
    module_slots = 20,
    allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
    heating_energy = feature_flags["freezing"] and "100kW" or nil,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    squeak_behaviour = false,
    working_sound = {
        audible_distance_modifier = 0.5,
        fade_in_ticks = 4,
        fade_out_ticks = 20,
        sound = {
            filename = "__base__/sound/assembling-machine-t3-1.ogg",
            volume = 0.45
        }
    }
}
local base_item = {
    type = "item",
    name = "base-machine",
    icon = "__basee__/graphics/icon.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "a-a",
    place_result = "v-machine",
    weight = 10,
    stack_size = 50
}

local function add_item(entity)
    local item = table.deepcopy(base_item)
    item.name = entity.name
    item.icon = entity.icon
    item.icon_size = entity.icon_size
    item.place_result = item.name

    data:extend({ item })

end

local function add_recipe (entity)
    data:extend {
        {
            type = "recipe",
            name = entity.name,
            icon = entity.icon,
            icon_size = entity.icon_size,
            enabled = true,
            energy_required = 5,
            ingredients = {
                { type = "item", name = "iron-plate", amount = 100 },
            },
            results = { { type = "item", name = entity.name, amount = 1 } }
        },
    }

end
local function add_entity(entity)
    local base_entity = table.deepcopy(base)

    base_entity.name = entity.name
    base_entity.minable.result = entity.name
    base_entity.icon = entity.icon
    base_entity.icon_size = entity.icon_size
    base_entity.fluid_boxes = entity.fluid_boxes
    base_entity.selection_box = entity.selection_box
    base_entity.collision_box = shrinkBox(entity.selection_box)
    base_entity.graphics_set = entity.graphics_set

    data:extend({ base_entity })

    add_item(entity)
    add_recipe(entity)
end

------------------------------------------------------------------------------------------------------------
add_entity({
    name = "advanced-foundry",
    icon = "__finely-crafted-graphics__/graphics/advanced-foundry/advanced-foundry-icon.png",
    icon_size = 64,
    selection_box = box8,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/advanced-foundry/advanced-foundry-hr-shadow.png",
                    priority = "high",
                    width = 900,
                    height = 800,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 120,
                    draw_as_shadow = true,
                    animation_speed = 0.3,
                    scale = 0.5,
                },
                {
                    priority = "high",
                    width = 530,
                    height = 530,
                    frame_count = 120,
                    animation_speed = 0.3,
                    scale = 0.5,
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/advanced-foundry/advanced-foundry-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/advanced-foundry/advanced-foundry-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 7,
                        },
                    },
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    priority = "high",
                    width = 530,
                    height = 530,
                    frame_count = 120,
                    draw_as_glow = true,
                    scale = 0.5,
                    animation_speed = 0.3,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/advanced-foundry/advanced-foundry-hr-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/advanced-foundry/advanced-foundry-hr-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 7,
                        },
                    },
                },
            }
        },
        reset_animation_when_frozen = true
    }
})

------------------------------------------------------------------------------------------------------------
add_entity({
    name = "arc-furnace",
    icon = "__finely-crafted-graphics__/graphics/arc-furnace/arc-furnace-hr-structure.png",
    icon_size = 320,
    selection_box = box5,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/arc-furnace/arc-furnace-hr-shadow.png",
                    priority = "high",
                    size = { 600, 400 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    frame_count = 1,
                    repeat_count = 40,
                    draw_as_shadow = true,
                    animation_speed = 0.25,
                },
                {
                    filename = "__finely-crafted-graphics__/graphics/arc-furnace/arc-furnace-hr-structure.png",
                    size = { 320, 320 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    frame_count = 1,
                    repeat_count = 40,
                    animation_speed = 0.25,
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    layers = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/arc-furnace/arc-furnace-hr-animation-emission-1.png",
                            size = { 320, 320 },
                            shift = { 0, 0 },
                            scale = 0.5,
                            line_length = 8,
                            lines_per_file = 8,
                            frame_count = 40,
                            draw_as_glow = true,
                            blend_mode = "additive",
                            animation_speed = 0.25,
                        },
                    }
                },
            },
        },

        reset_animation_when_frozen = true
    }
})

------------------------------------------------------------------------------------------------------------

add_entity({
    name = "core-extractor",
    icon = "__finely-crafted-graphics__/graphics/core-extractor/core-extractor-hr-animation-1.png",
    icon_size = 704,
    selection_box = box11,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/core-extractor/core-extractor-hr-shadow.png",
                    priority = "high",
                    width = 1400,
                    height = 1400,
                    frame_count = 1,
                    repeat_count = 120,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    scale = 0.5,
                },
                {
                    priority = "high",
                    width = 704,
                    height = 704,
                    frame_count = 120,
                    animation_speed = 0.5,
                    scale = 0.5,
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/core-extractor/core-extractor-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/core-extractor/core-extractor-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                animation = {
                    priority = "high",
                    width = 704,
                    height = 400,
                    shift = util.by_pixel_hr(0, 92),
                    frame_count = 120,
                    animation_speed = 0.5,
                    scale = 0.5,
                    draw_as_light = true,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/core-extractor/core-extractor-hr-animation-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/core-extractor/core-extractor-hr-animation-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            }
        },

        reset_animation_when_frozen = true
    }
})

------------------------------------------------------------------------------------------------------------
add_entity({
    name = "gravity-assembler",
    icon = "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-icon.png",
    icon_size = 64,
    selection_box = box5,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-shadow.png",
                    priority = "high",
                    width = 520,
                    height = 500,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 99,
                    animation_speed = 0.3,
                    shift = util.by_pixel_hr(0, -16),
                    draw_as_shadow = true,
                    scale = 0.5,
                },
                {
                    priority = "high",
                    width = 320,
                    height = 320,
                    frame_count = 99,
                    shift = util.by_pixel_hr(0, -16),
                    animation_speed = 0.3,
                    scale = 0.5,
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    priority = "high",
                    size = { 320, 320 },
                    shift = util.by_pixel_hr(0, -16),
                    frame_count = 99,
                    draw_as_glow = true,
                    scale = 0.5,
                    animation_speed = 0.3,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-animation-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-animation-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            }
        },
        reset_animation_when_frozen = true
    }
})

-------------------------------------------------------------------------------------------------------------
add_entity({
    name = "thermal-plant",
    icon = "__finely-crafted-graphics__/graphics/thermal-plant/thermal-plant-icon.png",
    icon_size = 64,
    selection_box = box5,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/thermal-plant/thermal-plant-hr-shadow.png",
                    priority = "high",
                    width = 900,
                    height = 500,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 80,
                    animation_speed = 0.3,
                    draw_as_shadow = true,
                    scale = 0.5,
                },
                {
                    priority = "high",
                    width = 410,
                    height = 410,
                    frame_count = 80,
                    animation_speed = 0.3,
                    scale = 0.5,
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/thermal-plant/thermal-plant-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/thermal-plant/thermal-plant-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    priority = "high",
                    size = { 410, 410 },
                    frame_count = 80,
                    draw_as_glow = true,
                    scale = 0.5,
                    animation_speed = 0.3,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/thermal-plant/thermal-plant-hr-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/thermal-plant/thermal-plant-hr-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            }
        },
        reset_animation_when_frozen = true
    }
})

-------------------------------------------------------------------------------------------------------------
add_entity({
    name = "quantum-stabilizer",
    icon = "__finely-crafted-graphics__/graphics/quantum-stabilizer/quantum-stabilizer-hr-animation-1.png",
    icon_size = 410,
    selection_box = box6,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/quantum-stabilizer/quantum-stabilizer-hr-shadow.png",
                    priority = "high",
                    width = 900,
                    height = 420,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 100,
                    animation_speed = 0.3,
                    shift = util.by_pixel_hr(0, -16),
                    draw_as_shadow = true,
                    scale = 0.25,
                },
                {
                    priority = "high",
                    width = 410,
                    height = 410,
                    frame_count = 100,
                    shift = util.by_pixel_hr(0, -16),
                    animation_speed = 0.3,
                    scale = 0.5,
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/quantum-stabilizer/quantum-stabilizer-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/quantum-stabilizer/quantum-stabilizer-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    priority = "high",
                    size = { 410, 410 },
                    shift = util.by_pixel_hr(0, -16),
                    frame_count = 100,
                    draw_as_glow = true,
                    scale = 0.5,
                    animation_speed = 0.3,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/quantum-stabilizer/quantum-stabilizer-hr-animation-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/quantum-stabilizer/quantum-stabilizer-hr-animation-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            }
        },
        reset_animation_when_frozen = true
    }
})

------------------------------------------------------------------------------------------------------------
add_entity({
    name = "fusion-reactor-new",
    icon = "__finely-crafted-graphics__/graphics/fusion-reactor/fusion-reactor-icon.png",
    icon_size = 64,
    selection_box = box6,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/fusion-reactor/fusion-reactor-hr-shadow.png",
                    priority = "high",
                    size = { 700, 600 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    frame_count = 1,
                    repeat_count = 60,
                    draw_as_shadow = true,
                    animation_speed = 0.25,
                },
                {
                    filename = "__finely-crafted-graphics__/graphics/fusion-reactor/fusion-reactor-hr-animation.png",
                    size = { 400, 400 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 60,
                    animation_speed = 0.25,
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    layers = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/fusion-reactor/fusion-reactor-hr-animation-emission.png",
                            size = { 400, 400 },
                            shift = { 0, 0 },
                            scale = 0.5,
                            line_length = 8,
                            lines_per_file = 8,
                            frame_count = 60,
                            draw_as_glow = true,
                            blend_mode = "additive",
                            animation_speed = 0.25,
                        },
                    }
                },
            },
        },

        reset_animation_when_frozen = true
    }
})

------------------------------------------------------------------------------------------------------------
add_entity({
    name = "chemical-stager",
    icon = "__finely-crafted-graphics__/graphics/chemical-stager/chemical-stager-hr.png",
    icon_size = 320,
    selection_box = box6,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/chemical-stager/chemical-stager-hr-shadow.png",
                    priority = "high",
                    size = { 600, 340 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    frame_count = 1,
                    repeat_count = 1,
                    draw_as_shadow = true,
                    animation_speed = 0.25,
                },
                {
                    filename = "__finely-crafted-graphics__/graphics/chemical-stager/chemical-stager-hr.png",
                    size = { 320, 320 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    frame_count = 1,
                    animation_speed = 0.25,
                },
            },
        },
        reset_animation_when_frozen = true
    }
})

------------------------------------------------------------------------------------------------------------
add_entity({
    name = "conduit",
    icon = "__finely-crafted-graphics__/graphics/conduit/conduit-hr-animation.png",
    icon_size = 200,
    selection_box = box3,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/conduit/conduit-hr-shadow.png",
                    priority = "high",
                    size = { 200, 290 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    repeat_count = 60,
                    draw_as_shadow = true,
                    animation_speed = 0.3,
                },
                {
                    filename = "__finely-crafted-graphics__/graphics/conduit/conduit-hr-animation.png",
                    size = { 200, 290 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 60,
                    animation_speed = 0.3,
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    layers = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/conduit/conduit-hr-emission.png",
                            size = { 200, 290 },
                            shift = { 0, 0 },
                            scale = 0.5,
                            line_length = 8,
                            lines_per_file = 8,
                            frame_count = 60,
                            draw_as_light = true,
                            blend_mode = "additive",
                            animation_speed = 0.3,
                        },
                    }
                },
            },
        },

        reset_animation_when_frozen = true
    }
})
------------------------------------------------------------------------------------------------------------
add_entity({
    name = "oxidizer",
    icon = "__finely-crafted-graphics__/graphics/oxidizer/oxidizer-icon.png",
    icon_size = 64,
    selection_box = box4,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/oxidizer/oxidizer-hr-shadow.png",
                    priority = "high",
                    size = { 600, 400 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    repeat_count = 60,
                    draw_as_shadow = true,
                    animation_speed = 0.3,
                },
                {
                    filename = "__finely-crafted-graphics__/graphics/oxidizer/oxidizer-hr-animation.png",
                    size = { 320, 370 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 60,
                    animation_speed = 0.3,
                },
            },
        },

        reset_animation_when_frozen = true
    }
})
----------------------------------------------------------------------------------------------------------------
add_entity({
    name = "pathogen-lab",
    icon = "__finely-crafted-graphics__/graphics/pathogen-lab/pathogen-lab-hr-animation.png",
    icon_size = 500,
    selection_box = box7,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/pathogen-lab/pathogen-lab-hr-shadow.png",
                    priority = "high",
                    size = { 800, 700 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    repeat_count = 60,
                    draw_as_shadow = true,
                    animation_speed = 0.3,
                },
                {
                    filename = "__finely-crafted-graphics__/graphics/pathogen-lab/pathogen-lab-hr-animation.png",
                    size = { 500, 500 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 60,
                    animation_speed = 0.3,
                },
            },
        },

        reset_animation_when_frozen = true
    }
})
----------------------------------------------------------------------------------------------------------------
add_entity({
    name = "scrubber",
    icon = "__finely-crafted-graphics__/graphics/scrubber/scrubber-hr-animation.png",
    icon_size = 210,
    selection_box = box3,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/scrubber/scrubber-hr-shadow.png",
                    priority = "high",
                    size = { 400, 350 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    repeat_count = 60,
                    draw_as_shadow = true,
                    animation_speed = 0.3,
                },
                {
                    filename = "__finely-crafted-graphics__/graphics/scrubber/scrubber-hr-animation.png",
                    size = { 210, 290 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 60,
                    animation_speed = 0.3,
                },
            },
        },

        reset_animation_when_frozen = true
    }
})
----------------------------------------------------------------------------------------------------------------
add_entity({
    name = "lumber-mill",
    icon = "__finely-crafted-graphics__/graphics/lumber-mill/lumber-mill-hr-animation-1.png",
    icon_size = 460,
    selection_box = box7,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/lumber-mill/lumber-mill-hr-shadow.png",
                    priority = "high",
                    size = { 700, 700 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    repeat_count = 80,
                    draw_as_shadow = true,
                    animation_speed = 0.3,
                },
                {
                    priority = "high",
                    size = { 460, 500 },
                    frame_count = 80,
                    animation_speed = 0.3,
                    scale = 0.5,
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/lumber-mill/lumber-mill-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/lumber-mill/lumber-mill-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 2,
                        },
                    },
                },
            },
        },

        reset_animation_when_frozen = true
    }
})

------------------------------------------------------------------------------------------------------------
add_entity({
    name = "convector",
    icon = "__finely-crafted-graphics__/graphics/convector/convector-hr-animation-1.png",
    icon_size = 410,
    selection_box = box5,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__finely-crafted-graphics__/graphics/convector/convector-hr-shadow.png",
                    priority = "high",
                    width = 600,
                    height = 500,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 80,
                    animation_speed = 0.3,
                    draw_as_shadow = true,
                    scale = 0.5,
                },
                {
                    priority = "high",
                    width = 360,
                    height = 350,
                    frame_count = 80,
                    animation_speed = 0.3,
                    scale = 0.5,
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/convector/convector-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/convector/convector-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 2,
                        },
                    },
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    priority = "high",
                    size = { 360, 350 },
                    frame_count = 80,
                    draw_as_glow = true,
                    scale = 0.5,
                    animation_speed = 0.3,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__finely-crafted-graphics__/graphics/convector/convector-hr-animation-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__finely-crafted-graphics__/graphics/convector/convector-hr-animation-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            }
        },
        reset_animation_when_frozen = true
    }
})

------------------------------------------------------------------------------------------------------------




