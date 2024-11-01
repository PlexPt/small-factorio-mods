local scale = 1 / 3

---@param v vector
local function scale_vector(v)
    if not v then
        return
    end
    v[1] = v[1] * scale
    v[2] = v[2] * scale
end

---@param layer Sprite|Animation
local function scale_layer(layer)
    if not layer then
        return
    end
    layer.scale = (layer.scale or 1) * scale
    scale_vector(layer.shift)
    if layer.hr_version then
        scale_layer(layer.hr_version)
    end
end

---@param animation Animation
local function scale_animation(animation)
    if not animation then
        return
    end
    if not animation.layers then
        scale_layer(animation)
        return
    end
    for _, layer in pairs(animation.layers) do
        scale_layer(layer)
    end
end

---@param graphics_set MiningDrillGraphicsSet
local function scale_graphics_set(graphics_set)
    for _, animation in pairs(graphics_set.animation) do
        scale_animation(animation)
    end
    for _, points in pairs(graphics_set.shift_animation_waypoints) do
        for _, point in pairs(points) do
            scale_vector(point)
        end
    end
    for _, v in pairs(graphics_set.working_visualisations) do
        scale_animation(v.animation)
        scale_animation(v.north_animation)
        scale_animation(v.west_animation)
        scale_animation(v.south_animation)
        scale_animation(v.east_animation)
        scale_vector(v.north_position)
        scale_vector(v.west_position)
        scale_vector(v.south_position)
        scale_vector(v.east_position)
    end
end

---@param light LightDefinition
local function scale_light_definition(light)
    light.size = light.size * scale
    scale_vector(light.shift)
    scale_layer(light.picture)
end

---@param sprites CircuitConnectorSprites[]
local function scale_circuit_connector_sprites(sprites)
    for _, layer in pairs(sprites) do
        scale_layer(layer.led_red)
        scale_layer(layer.led_green)
        scale_layer(layer.led_blue)
        scale_layer(layer.connector_main)
        scale_layer(layer.connector_shadow)
        scale_layer(layer.wire_pins)
        scale_layer(layer.wire_pins_shadow)
        scale_layer(layer.led_blue_off)
        scale_vector(layer.blue_led_light_offset)
        scale_vector(layer.red_green_led_light_offset)
        scale_light_definition(layer.led_light)
    end
end

---@param wire WirePosition
local function scale_wire_position(wire)
    for _, vector in pairs(wire) do
        scale_vector(vector)
    end
end

---@param points WireConnectionPoint[]
local function scale_circuit_wire_connection_points(points)
    for _, vectors in pairs(points) do
        scale_wire_position(vectors.wire)
        scale_wire_position(vectors.shadow)
    end
end

---@type MiningDrillPrototype
local entity = data.raw["mining-drill"]["electric-mining-drill"]
entity.collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } }
entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }

entity.input_fluid_box.pipe_connections[1].position = { -0.4, 0 }
entity.input_fluid_box.pipe_connections[2].position = { 0.4, 0 }
entity.input_fluid_box.pipe_connections[3].position = { 0, 0.4 }

entity.resource_searching_radius = 1.49
entity.vector_to_place_result = { 0, -0.85 }

scale_graphics_set(entity.graphics_set)
scale_graphics_set(entity.wet_mining_graphics_set)

for _, layer in pairs(entity.integration_patch) do
    scale_animation(layer)
end

scale_circuit_connector_sprites(entity.circuit_connector_sprites)
scale_circuit_wire_connection_points(entity.circuit_wire_connection_points)

