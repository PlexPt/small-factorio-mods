data:extend({

    {
        type = "assembling-machine",
        name = "universal-machine",
        icon = "__universal-machine__/graphics/icon.png",
        icon_size = 144,
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { hardness = 0.2, mining_time = 2, result = "universal-machine" },
        max_health = 2000,
        inventory_size = 300,
        corpse = "big-remnants",
        dying_explosion = "big-explosion",
        resistances = { { type = "fire", percent = 90 } },
        fluid_boxes = {
            {
                production_type = "input",
                volume = 1000,
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { -4, -4 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                volume = 1000,
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { -2, -4 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                volume = 1000,
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 0, -4 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                volume = 1000,
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 2, -4 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                volume = 1000,
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 4, -4 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                volume = 1000,
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { -2, 4 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                volume = 1000,
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 0, 4 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                volume = 1000,
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 2, 4 } } },
                secondary_draw_orders = { north = -1 }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        collision_box = { { -4.1, -4.1 }, { 4.1, 4.1 } },
        selection_box = { { -4.8, -5 }, { 4.8, 5 } },
        drawing_box = { { -4.8, -4.8 }, { 4.8, 4.8 } },
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__universal-machine__/graphics/hr-assembling-machine-3.png",
                        priority = "high",
                        animation_speed = 0.02,
                        width = 214,
                        height = 237,
                        frame_count = 32,
                        line_length = 8,
                        shift = util.by_pixel(0, -0.75),
                        scale = 1.75,

                    },
                    {
                        filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
                        priority = "high",
                        width = 260,
                        height = 162,
                        frame_count = 32,
                        line_length = 8,
                        draw_as_shadow = true,
                        shift = util.by_pixel(28, 4),
                        scale = 1.75
                    },
                },
            },
            animation_progress = 0.5,
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

        crafting_speed = 100,
        impact_category = "metal",
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 96
            }
        },
        energy_usage = "100MW",
        ingredient_count = 6,
        module_specification = { module_slots = 20 },
        allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
        heating_energy = "100kW",
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

        working_sound = {
            audible_distance_modifier = 0.5,
            fade_in_ticks = 4,
            fade_out_ticks = 20,
            sound = {
                filename = "__base__/sound/assembling-machine-t3-1.ogg",
                volume = 0.45
            }
        }
    },

})
