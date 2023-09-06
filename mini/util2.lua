-- 深度缩放嵌套表的函数
local function deep_scale(tbl, scale)
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            deep_scale(value, scale)
        elseif type(value) == "number" then
            tbl[key] = value * scale
        end
    end
end

-- 缩放表中特定键值的函数
local function scale_keys(tbl, keys, scale)
    for _, key in ipairs(keys) do
        if tbl[key] then
            deep_scale(tbl[key], scale)
        end
    end
end

--- 用于缩放MiningDrillPrototype实体的函数
---@param entity MiningDrillPrototype
local function scale_mining_drill_prototype(entity, scale)
    -- 缩放基础属性
    deep_scale(entity.collision_box, scale)
    deep_scale(entity.selection_box, scale)
    deep_scale(entity.input_fluid_box.pipe_connections, scale)
    entity.resource_searching_radius = entity.resource_searching_radius * scale
    entity.vector_to_place_result = { entity.vector_to_place_result[1] * scale, entity.vector_to_place_result[2] * scale }

    -- 缩放图形设置
    for _, graphics_set in pairs({ entity.graphics_set, entity.wet_mining_graphics_set }) do
        scale_keys(graphics_set, { "animation", "shift_animation_waypoints", "working_visualisations" }, scale)
    end

    -- 缩放集成补丁
    scale_keys(entity.integration_patch, { "animation" }, scale)

    -- 缩放电路和电线属性
    scale_keys(entity, { "circuit_connector_sprites", "circuit_wire_connection_points" }, scale)
end

-- 使用示例
local entity = data.raw["mining-drill"]["electric-mining-drill"]
scale_mining_drill_prototype(entity, 1 / 3)

