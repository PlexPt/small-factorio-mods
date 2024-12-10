--https://lua-api.factorio.com/latest/prototypes/ThrusterPrototype.html


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
--thruster_entity.plumes = nil

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

--local unpowered = table.deepcopy(thruster_entity)
----todo del
--unpowered.name = "unpowered-" .. thruster_entity.name

data:extend { thruster_entity }


-- 功率
local power = 360

data:extend(
        {
            {
                type = "recipe-category",
                name = "ion-thruster"
            }
        }
)

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
    --graphics_set = {
    --    animation = {
    --        east = {
    --            animation_speed = 0.5,
    --            filename = "__ion-thruster__/graphics/entity/fluid-source-right.png",
    --            frame_count = 8,
    --            height = 56,
    --            shift = {
    --                0.171875,
    --                -0.21875
    --            },
    --            width = 57
    --        },
    --        north = {
    --            animation_speed = 0.5,
    --            filename = "__ion-thruster__/graphics/entity/fluid-source-up.png",
    --            frame_count = 8,
    --            height = 56,
    --            shift = {
    --                0.09375,
    --                0.03125
    --            },
    --            width = 46
    --        },
    --        south = {
    --            animation_speed = 0.5,
    --            filename = "__ion-thruster__/graphics/entity/fluid-source-down.png",
    --            frame_count = 8,
    --            height = 58,
    --            shift = {
    --                0.421875,
    --                -0.125
    --            },
    --            width = 61
    --        },
    --        west = {
    --            animation_speed = 0.5,
    --            filename = "__ion-thruster__/graphics/entity/fluid-source-left.png",
    --            frame_count = 8,
    --            height = 44,
    --            shift = {
    --                0.3125,
    --                0.0625
    --            },
    --            width = 56
    --        }
    --    }
    --},

}

data:extend { ion_gen }
