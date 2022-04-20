data:extend({

    {
        type = "assembling-machine",
        name = "universal-machine",
        icon = "__universal-machine__/graphics/icon.png",
        icon_size = 144,
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { hardness = 0.2, mining_time = 0.5, result = "universal-machine" },
        max_health = 2000,
        inventory_size = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        resistances = { { type = "fire", percent = 90 } },
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { type = "input", position = { -4, -5 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { type = "input", position = { -2, -5 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { type = "input", position = { 0, -5 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { type = "input", position = { 2, -5 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = { { type = "input", position = { 4, -5 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = { { type = "output", position = { -2, 5 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = { { type = "output", position = { 0, 5 } } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = { { type = "output", position = { 2, 5 } } },
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = true
        },
        collision_box = { { -4.1, -4.1 }, { 4.1, 4.1 } },
        selection_box = { { -4.8, -5 }, { 4.8, 5 } },
        drawing_box = { { -4.8, -4.8 }, { 4.8, 4.8 } },
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
                    width = 130,
                    height = 82,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(28, 4),
                    scale = 1.25,
                    hr_version = {
                        filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3-shadow.png",
                        priority = "high",
                        width = 260,
                        height = 162,
                        frame_count = 32,
                        line_length = 8,
                        draw_as_shadow = true,
                        shift = util.by_pixel(28, 4),
                        scale = 1.75
                    }
                },
            },
        },
        crafting_categories = { "advanced-crafting", "basic-crafting", "centrifuging", "chemistry", "crafting", "crafting-with-fluid", "oil-processing", "rocket-building", "smelting" },
        crafting_speed = 100,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = 96
        },
        energy_usage = "100MW",
        ingredient_count = 6,
        module_specification = { module_slots = 20 },
        allowed_effects = { "consumption", "speed", "productivity", "pollution" },

        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound = {
            sound = {
                {
                    filename = "__base__/sound/assembling-machine-t1-1.ogg",
                    volume = 0.8
                },
                {
                    filename = "__base__/sound/assembling-machine-t1-2.ogg",
                    volume = 0.8
                },
            },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 1.5,
        }
    },

})
