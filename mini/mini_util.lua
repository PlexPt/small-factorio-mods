-- 缩放向量
-- @param v vector 向量
-- @param scale number 缩放因子
local function scale_vector(v, scale)
    if not v then
        return
    end
    if (type(v) == "table") then
        if v[1] then
            v[1] = v[1] * scale
            v[2] = v[2] * scale
        end
    end
end

-- 缩放图层（Sprite或Animation）
-- @param layer Sprite|Animation 图层
-- @param scale number 缩放因子
local function scale_layer(layer, scale)
    if not layer then
        return
    end

    layer.scale = (layer.scale or 1) * scale
    scale_vector(layer.shift, scale)
end

-- 缩放动画
-- @param animation Animation 动画
-- @param scale number 缩放因子
local function scale_animation(animation, scale)
    if not animation then
        return
    end

    if not animation.layers then
        scale_layer(animation, scale)
        return
    end

    for _, layer in  pairs(animation.layers) do
        scale_layer(layer, scale)  -- 调用 scale_layer 函数
    end
end

-- 缩放
-- @param graphics_set  图形集
-- @param scale number 缩放因子
local function scale_water_reflection(water_reflection, scale)
    if not water_reflection then
        return
    end
    if not water_reflection.pictures then
        return
    end
    if not water_reflection.pictures.filename then
        return
    end

    scale_layer(water_reflection.pictures, scale)

end

-- 缩放
-- @param graphics_set  图形集
-- @param scale number 缩放因子
local function scale_smokes(smokes, scale)
    if not smokes then
        return
    end

    for _, v in pairs(smokes) do
        scale_vector(v.north_position, scale)
        scale_vector(v.west_position, scale)
        scale_vector(v.south_position, scale)
        scale_vector(v.east_position, scale)
    end

end

-- 缩放图形集
-- @param graphics_set  图形集
-- @param scale number 缩放因子
local function scale_animations(animations, scale)
    if not animations then
        return
    end

    if not animations.north then
        return
    end
    for _, animation in pairs(animations) do
        scale_animation(animation, scale)
    end

end

-- 缩放图形集
-- @param graphics_set  图形集
-- @param scale number 缩放因子
local function scale_graphics_set(graphics_set, scale)
    if not graphics_set then
        return
    end

    for _, animation in pairs(graphics_set.animation) do
        scale_animation(animation, scale)
    end

    if graphics_set.shift_animation_waypoints then


        for _, points in pairs(graphics_set.shift_animation_waypoints) do
            for _, point in pairs(points) do
                scale_vector(point, scale)
            end
        end
    end

    --loge(graphics_set, "graphics_set")
    if graphics_set.working_visualisations then

        for _, v in pairs(graphics_set.working_visualisations) do
            scale_animation(v.animation, scale)
            scale_animation(v.north_animation, scale)
            scale_animation(v.west_animation, scale)
            scale_animation(v.south_animation, scale)
            scale_animation(v.east_animation, scale)
            scale_vector(v.north_position, scale)
            scale_vector(v.west_position, scale)
            scale_vector(v.south_position, scale)
            scale_vector(v.east_position, scale)
        end
    end
end

-- 缩放光源定义
-- @param light LightDefinition 光源定义
-- @param scale number 缩放因子
local function scale_light_definition(light, scale)
    if not light then
        return
    end
    light.size = light.size * scale
    scale_vector(light.shift, scale)
    scale_layer(light.picture, scale)
end

-- 缩放电路连接器精灵
-- @param sprites CircuitConnectorSprites[] 精灵集合
-- @param scale number 缩放因子
function scale_circuit_connector_sprites(sprites, scale)
    if not sprites then
        return
    end

    for _, layer in pairs(sprites) do
        if (type(layer) == "table") then
            scale_layer(layer.led_red, scale)
            scale_layer(layer.led_green, scale)
            scale_layer(layer.led_blue, scale)
            scale_layer(layer.connector_main, scale)
            scale_layer(layer.connector_shadow, scale)
            scale_layer(layer.wire_pins, scale)
            scale_layer(layer.wire_pins_shadow, scale)
            scale_layer(layer.led_blue_off, scale)
            scale_vector(layer.blue_led_light_offset, scale)
            scale_vector(layer.red_green_led_light_offset, scale)
            scale_light_definition(layer.led_light, scale)
        end
    end
end

-- 缩放电线位置
-- @param wire WirePosition 电线位置
-- @param scale number 缩放因子
function scale_wire_positions(wires, scale)
    if not wires then
        return
    end
    for _, wire in pairs(wires) do
        scale_wire_position(wire.wire, scale)
        scale_wire_position(wire.shadow, scale)
    end
end

-- 缩放电线位置
-- @param wire WirePosition 电线位置
-- @param scale number 缩放因子
function scale_wire_position(wire, scale)
    if not wire then
        return
    end

    for _, vector in pairs(wire) do
        scale_vector(vector, scale)
    end
end

-- 缩放电路连接点
-- @param points WireConnectionPoint[] 连接点集合
-- @param scale number 缩放因子
function scale_circuit_wire_connection_points(points, scale)
    if not points then
        return
    end

    for _, vectors in pairs(points) do
        scale_wire_position(vectors.wire, scale)
        scale_wire_position(vectors.shadow, scale)
    end
end

local function scale_other(entity)
    if entity.input_fluid_box then

        entity.input_fluid_box.pipe_connections[1].position = { -0.4, 0 }
        entity.input_fluid_box.pipe_connections[2].position = { 0.4, 0 }
        entity.input_fluid_box.pipe_connections[3].position = { 0, 0.4 }

    end

    if entity.output_fluid_box then

    end

    if entity.resource_searching_radius then
        entity.resource_searching_radius = 1.49
    end

    if entity.vector_to_place_result then
        entity.vector_to_place_result = { 0, -0.85 }
    end

    if entity.alert_icon_shift then
        entity.alert_icon_shift = nil
    end

    entity.scale_entity_info_icon = true
end

function scale_collision(entity)
    if not entity then
        return
    end

    entity.collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } }
    entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
    if entity.drawing_box then
        entity.drawing_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
    end

end

function minify(entity, scale)
    if not entity then
        return
    end

    scale_collision(entity)
    scale_other(entity)

    scale_graphics_set(entity.graphics_set, scale)
    scale_graphics_set(entity.wet_mining_graphics_set, scale)
    scale_animations(entity.animations, scale)
    scale_animation(entity.animation, scale)
    scale_animation(entity.horizontal_animation, scale)
    scale_animation(entity.vertical_animation, scale)
    scale_smokes(entity.smoke, scale)

    if entity.integration_patch then
        for _, layer in pairs(entity.integration_patch) do
            scale_animation(layer, scale)
        end
    end

    scale_circuit_connector_sprites(entity.circuit_connector_sprites, scale)
    scale_circuit_wire_connection_points(entity.circuit_wire_connection_points, scale)
end
