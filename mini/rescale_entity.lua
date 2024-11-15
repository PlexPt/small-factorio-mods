local fields = {
    shift = true,
    scale = true,
    base_shift = true,
    collision_box = true,
    selection_box = true,
    drawing_box = true,
    north_position = true,
    south_position = true,
    east_position = true,
    west_position = true,
    window_bounding_box = true,
    circuit_wire_connection_points = true,
}

local ignored_fields = {
    fluid_boxes = true,
    fluid_box = true,
    energy_source = true,
    input_fluid_box = true,
}

pipe_pictures_hide = {
    north = {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1
    },
    east = {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1
    },
    south = {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1
    },
    west = {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1
    }
}

-- Scales values within object
local function scale(object, scale)
    -- Walk table and scale values contained within
    local function scale_subtable(object, scale)
        for key, value in pairs(object) do
            if type(value) == "table" then
                scale_subtable(value, scale)
            elseif type(value) == "number" then
                object[key] = value * scale
            end
        end
    end

    -- Check if we're a number
    if type(object) == "number" then
        return object * scale
        -- Object is a table
    elseif type(object) == "table" then
        -- Break reference, work on local copy
        object = table.deepcopy(object)
        -- Recursively call scale_subtable
        scale_subtable(object, scale)
        return object
    end
end

local function rescale(entity, scalar)
    if not entity then
        return
    end

    for key, value in pairs(entity) do
        -- This section checks to see where we are, and for the existence of scale.
        -- Scale is defined if it is missing where it should be present.

        -- This checks to see if we're within an hr_version table
        if key == "hr_version" then
            entity.scale = entity.scale or 0.5
            -- If we're not, see if there's a filename, which means we're in a low-res table
        elseif entity.filename then
            entity.scale = entity.scale or 1
        elseif entity.filenames then
            entity.scale = entity.scale or 1
        end

        -- Check to see if we need to scale this key's value
        if fields[key] then
            entity[key] = scale(value, scalar)
            goto continue
        end

        -- Check to see if we need to ignore this key
        if ignored_fields[key] then
            -- Move to the next key rather than digging down further
            goto continue
        end

        if (type(value) == "table") then
            rescale(value, scalar)
        end

        -- Label to skip to next iteration
        :: continue ::
    end
end

function rescale_entity(entity, scalar)
    if not entity then
        return
    end
    rescale(entity, scalar)

    scale_circuit_connector_sprites(entity.circuit_connector_sprites, scalar)
    scale_circuit_wire_connection_points(entity.circuit_wire_connection_points, scalar)
    scale_wire_positions(entity.connection_points, scalar)
    entity.scale_entity_info_icon = true
    return entity
end

function removePipeCovers(boxs)
    for _, box in ipairs(boxs) do
        box.pipe_covers = nil
        box.pipe_covers_frozen = nil
    end
end


function fixPipeConnections(self)
    if self.fluid_boxes then
        removePipeCovers(self.fluid_boxes)

        if string.match(self.name, "assembling") then
            self.fluid_boxes[1].pipe_connections[1].position = { 0, -0.4 }
            self.fluid_boxes[2].pipe_connections[1].position = { 0, 0.4 }
        end

        if string.match(self.name, "refinery") then

            self.fluid_boxes[1].pipe_connections[1].direction = defines.direction.north
            self.fluid_boxes[1].pipe_connections[1].position = { 0, -0.4 }
            --self.fluid_boxes[2].pipe_connections = { { type = "output", position = { 1, 0 } } }
            self.fluid_boxes[2] = {
                production_type = "output",
                volume = 1000,
                pipe_covers = nil,
                pipe_connections = {
                    {
                        direction = defines.direction.south,
                        flow_direction = "input-output",
                        position = { 0, 0.44 }
                    }
                }
            }
            self.fluid_boxes[3].pipe_connections[1].direction = defines.direction.east
            self.fluid_boxes[3].pipe_connections[1].position = { 0.4, 0 }

            self.fluid_boxes[4].pipe_connections[1].direction = defines.direction.west
            self.fluid_boxes[4].pipe_connections[1].position = { -0.4, 0 }
            self.fluid_boxes[5] = nil
        end
        if string.match(self.name, "chemical") then
            loge(self.fluid_boxes, "chemical")

            self.fluid_boxes[1].pipe_connections[1].direction = defines.direction.north
            self.fluid_boxes[1].pipe_connections[1].position = { 0, -0.4 }
            self.fluid_boxes[2].pipe_connections[1].direction = defines.direction.south
            self.fluid_boxes[2].pipe_connections[1].position = { 0, 0.4 }
            self.fluid_boxes[3].pipe_connections[1].direction = defines.direction.east
            self.fluid_boxes[3].pipe_connections[1].position = { 0.4, 0 }
            self.fluid_boxes[4].pipe_connections[1].direction = defines.direction.west
            self.fluid_boxes[4].pipe_connections[1].position = { -0.4, 0 }
        end
        if string.match(self.name, "electro") then

            self.fluid_boxes[1].pipe_connections[1].position = { -0.5, -1.5 }
            self.fluid_boxes[2].pipe_connections[1].position = { 0.5, -1.5 }
            self.fluid_boxes[3].pipe_connections[1].position = { -0.5, 1.5 }
            self.fluid_boxes[4].pipe_connections[1].position = { 0.5, 1.5 }
        end
        if string.match(self.name, "bobmetal") then

            self.fluid_boxes[1].pipe_connections[1].position = { 0.5, -1.5 }
            self.fluid_boxes[2].pipe_connections[1].position = { 0.5, 1.5 }
        end
        if string.match(self.name, "bobchem") then

            self.fluid_boxes[1].pipe_connections[1]. position = { 0.5, -1.5 }
        end
        if string.match(self.name, "bobmulti") then

            self.fluid_boxes[1].pipe_connections[1].position = { 0.5, -1.5 }
        end
    end
    if self.fluid_box then
        self.fluid_box.base_area = (self.fluid_box.base_area / 2)
        if self.fluid_box.pipe_connections[1] then
            self.fluid_box.pipe_connections[1].position = { -0.5, -1.5 }
            self.fluid_box.pipe_connections[2].position = { 1.5, 0.5 }
            if self.fluid_box.pipe_connections[3] then
                self.fluid_box.pipe_connections[3].position = { 0.5, 1.5 }
                self.fluid_box.pipe_connections[4].position = { -1.5, -0.5 }
            end
            if self.fluid_box.pipe_connections[5] then
                self.fluid_box.pipe_connections[5].position = { 0.5, -1.5 }
                self.fluid_box.pipe_connections[6].position = { 1.5, -0.5 }
                self.fluid_box.pipe_connections[7].position = { -1.5, 0.5 }
                self.fluid_box.pipe_connections[8].position = { -0.5, 1.5 }
            end
        end
    end
    if self.input_fluid_box then
        self.input_fluid_box.pipe_connections = {
            { position = { 0, 0.75 } }
        }
    end
    if self.output_fluid_box then
        self.output_fluid_box.pipe_connections = {
            { position = { 0, -0.75 } }
        }
    end
    if string.match(self.name, "miner") then
        self.vector_to_place_result = { 0, -0.75 }
    end
    if self.energy_source then
        if self.energy_source.connections then
            for _, data in pairs(self.energy_source.connections) do
                if data.direction == 0 then
                    data.position = { 0, -0.5 }
                end
                if data.direction == 2 then
                    data.position = { 0.5, 0 }
                end
                if data.direction == 4 then
                    data.position = { 0, 0.5 }
                end
                if data.direction == 6 then
                    data.position = { -0.5, 0 }
                end
            end
        end
    end
end

function fixHeatConnections(self)
    if self.energy_source then
        if self.energy_source.type == "heat" then
            self.energy_source.connections = {
                { direction = 0, position = { 0, 0 } },
                { direction = 2, position = { 0, 0 } },
                { direction = 4, position = { 0, 0 } },
                { direction = 6, position = { 0, 0 } },
            }
        end
    end
end




