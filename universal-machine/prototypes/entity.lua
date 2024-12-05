local pipe_pic = assembler3pipepictures()
local pipecoverpic = pipecoverspictures()


data:extend({

    {
        type = "assembling-machine",
        name = "universal-machine",
        icon = "__universal-machine__/graphics/icon.png",
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
                    {
                        filename = "__universal-machine__/graphics/gravity-assembler-hr-shadow.png",
                        priority = "high",
                        width = 520,
                        height = 500,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 99,
                        animation_speed = 0.03,
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
                        animation_speed = 0.03,
                        scale = 0.5,
                        stripes = {
                            {
                                filename = "__universal-machine__/graphics/gravity-assembler-hr-animation-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename = "__universal-machine__/graphics/gravity-assembler-hr-animation-2.png",
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
                        animation_speed = 0.03,
                        blend_mode = "additive",
                        stripes = {
                            {
                                filename = "__universal-machine__/graphics/gravity-assembler-hr-animation-emission-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename = "__universal-machine__/graphics/gravity-assembler-hr-animation-emission-2.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                        },
                    },
                }
            },
            reset_animation_when_frozen = true
        }
    ,
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

        circuit_connector = circuit_connector_definitions["assembling-machine"],
        circuit_wire_max_distance = 20,
        energy_usage = "100MW",
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
    },

})
