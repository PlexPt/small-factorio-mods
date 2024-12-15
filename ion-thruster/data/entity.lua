--https://lua-api.factorio.com/latest/prototypes/ThrusterPrototype.html

require("lib.version_util")

--min_performance:
--类型: ThrusterPerformancePoint
--含义: 定义了推进器在最低性能点的特性，包括所需的燃料量和提供的推力。
--max_performance:
--类型: ThrusterPerformancePoint
--含义: 定义了推进器在最高性能点的特性，包括所需的燃料量和提供的推力。
--备注: max_performance.fluid_volume 必须不小于 min_performance.fluid_volume，以确保推进器在所有性能点上都需要至少最低量的燃料。
--fuel_fluid_box:
--类型: FluidBox
--含义: 定义了推进器用于存储燃料的流体箱。流体箱指定了实体可以容纳的流体量，以及与管道的连接点。
--oxidizer_fluid_box:
--类型: FluidBox
--含义: 定义了推进器用于存储氧化剂的流体箱。与燃料流体箱类似，它指定了实体可以容纳的流体量和连接点。
--graphics_set (可选):
--类型: ThrusterGraphicsSet
--含义: 定义了推进器的图形设置，包括动画、空
--plumes （可选）
--类型: PlumesSpecification
--描述: 定义推进器排放的羽流效果，包括无状态可视化（stateless visualisations）。
--PlumesSpecification 详细解释
--stateless_visualisations:
--类型: PlumeEffect 或 array[PlumeEffect]（可选）
--描述: 定义无状态的羽流效果。数组不能为空，最多可以有 255 个元素。需要提供非零的周期（period）。不能有位置（positions）或粒子偏移（particle_tick_offset）。

local thruster_entity = table.deepcopy(data.raw["thruster"]["thruster"])
thruster_entity.name = "ion-thruster"
thruster_entity.icon = "__ion-thruster__/graphics/icon.png"
thruster_entity.icon_size = 512
thruster_entity.flags = { "placeable-neutral", "placeable-player", "player-creation", "get-by-unit-number" }
thruster_entity.working_sound = nil

if compare_versions(mods["space-age"], "2.0.24") >= 0 then
    log("ion-thruster in 2.0.24, remove plumes")
  thruster_entity.plumes = nil
end

thruster_entity.minable = { mining_time = 0.5, result = "ion-thruster" }
thruster_entity.selection_box = { { -2, -2 }, { 2, 2 } }
thruster_entity.tile_buildability_rules = {
    { area = { { -1.8, -1 }, { 1.8, 1.2 } }, required_tiles = { layers = { ground_tile = true } }, colliding_tiles = { layers = { empty_space = true } }, remove_on_collision = true },
    { area = { { -1.3, 2.7 }, { 1.3, 50 } }, required_tiles = { layers = { empty_space = true } }, remove_on_collision = true },
}

thruster_entity.min_performance = { fluid_volume = 0.001, fluid_usage = 0.001, effectivity = 200 }
thruster_entity.max_performance = { fluid_volume = 0.1, fluid_usage = 0.002, effectivity = 300 }

thruster_entity.fuel_fluid_box = {
    filter = "xenon",
    production_type = "input",
    draw_only_when_connected = true,
    hide_connection_info = true,
    volume = 10,
    pipe_connections = {
        { flow_direction = "input", direction = defines.direction.west, position = { -1, 0 } },
    }
}
thruster_entity.oxidizer_fluid_box = {
    filter = "xenon",
    production_type = "input",
    draw_only_when_connected = true,
    hide_connection_info = true,
    volume = 10,
    pipe_connections = {
        { flow_direction = "input", direction = defines.direction.east, position = { 0, 0 } },
    }
}

thruster_entity.graphics_set = {
    -- 全是可选的
    animation = {
        layers = {
            {
                filename = "__ion-thruster__/graphics/ion.png",
                priority = "high",
                width = 1024,
                height = 1024,
                frame_count = 1,
                line_length = 1,
                repeat_count = 64,
                animation_speed = 0.5,
                shift = util.by_pixel_hr(0, 150),
                --shift = {0, 3},
                scale = 0.5,
            },
        },
    },

    working_visualisations = {
        {
            -- effect = "flicker",
            fadeout = true,
            animation = {
                filename = "__ion-thruster__/graphics/entity.png",
                priority = "high",
                width = 1024,
                height = 1024,
                frame_count = 1,
                line_length = 1,
                repeat_count = 64,
                --draw_as_shadow = true,
                --draw_as_light = true,
                draw_as_glow = true,
                blend_mode = "additive",
                animation_speed = 0.5,
                shift = util.by_pixel_hr(0, 150),
                --shift = {0, 3},
                scale = 0.5,
            },
        },
    },
    flame_effect = {
        filename = "__space-age__/graphics/entity/thruster/thruster-flame.png",
        width = 384,
        height = 832
    },
    flame_position = { 0, 5.5 },
    flame_half_height = 0,
    flame_effect_height = 1000 / 32,
    flame_effect_width = 384 / 64,
    flame_effect_offset = 50 / 32,
}
--local unpowered = table.deepcopy(thruster_entity)
----todo del
--unpowered.name = "unpowered-" .. thruster_entity.name

data:extend { thruster_entity }


-- 功率
local power = 360

local ion_gen = {
    type = "assembling-machine",
    name = "ion-thruster-xenon-generator",
    icon = "__ion-thruster__/graphics/icon.png",
    icon_size = 512,
    fixed_recipe = "xenon",
    allowed_effects = {
        "pollution"
    },
    collision_box = {
        {
            -0.29,
            -0.29
        },
        {
            0.29,
            0.29
        }
    },
    ingredient_count = 0,
    max_health = 1000,
    module_slots = 0,
    se_allow_in_space = true,
    selection_box = {
        {
            -0.5,
            -0.5
        },
        {
            0.5,
            0.5
        }
    },
    selectable_in_game = false,
    crafting_categories = { "ion-thruster" },
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        input_flow_limit = (power + 1) .. "kW",
        buffer_capacity = (17 * power) .. "J"
    },
    energy_usage = "360kW",
    flags = { "placeable-neutral", "placeable-player", "player-creation", "get-by-unit-number", "not-on-map", "hide-alt-info", "not-in-made-in", "placeable-off-grid" },
    fluid_boxes = {
        { pipe_connections = { { direction = defines.direction.east, flow_direction = "output", position = { 0.28, 0 } } }, production_type = "output", volume = 10, hide_connection_info = true },
        { pipe_connections = { { direction = defines.direction.west, flow_direction = "output", position = { -0.28, 0 } } }, production_type = "output", volume = 10, hide_connection_info = true },
        { pipe_connections = { { direction = defines.direction.north, flow_direction = "output", position = { 0, -0.28 } } }, production_type = "output", volume = 10, hide_connection_info = true },
        { pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 0, 0.28 } } }, production_type = "output", volume = 10, hide_connection_info = true },
    },
}

data:extend { ion_gen }


-- new

local test = {
    {
        type = "item",
        name = "io2",
        icon = "__ion-thruster__/graphics/entity.png",
        icon_size = 1024,
        stack_size = 100,
        place_result = "io2"
    },
    {
        type = "assembling-machine",
        name = "io2",
        icon = "__ion-thruster__/graphics/entity.png",
        icon_size = 1024,
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { hardness = 0.2, mining_time = 1, result = "io2" },
        max_health = 2000,
        inventory_size = 300,
        --collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
        --selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },

        collision_box = { { -1.7, -2.2 }, { 1.7, 2.2 } },
        selection_box = { { -2, -2 }, { 2, 2 } },
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__ion-thruster__/graphics/entity.png",
                        priority = "high",
                        width = 1024,
                        height = 1024,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 2,
                        --draw_as_shadow = true,
                        --draw_as_light = true,
                        draw_as_glow = true,
                        blend_mode = "additive",
                        animation_speed = 0.3,
                        shift = util.by_pixel_hr(0, 150),
                        --shift = {0, 3},
                        scale = 0.5,
                    },
                    {
                        filename = "__ion-thruster__/graphics/ion.png",
                        priority = "high",
                        width = 1024,
                        height = 1024,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 2,
                        animation_speed = 0.3,
                        shift = util.by_pixel_hr(0, 150),
                        --shift = {0, 3},
                        scale = 0.5,
                    },
                },
            },

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
        energy_usage = "300kW",
        ingredient_count = 6,
        module_slots = 20,
        allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
    }
}
