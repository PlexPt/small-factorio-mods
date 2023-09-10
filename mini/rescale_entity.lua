local fields = {
    "shift",
    "scale",
    "base_shift",
    "collision_box",
    "selection_box",
    "drawing_box",
    "north_position",
    "south_position",
    "east_position",
    "west_position",
    "window_bounding_box",
    "circuit_wire_connection_points",
}

local ignored_fields = {
    "fluid_boxes",
    "fluid_box",
    "energy_source",
    "input_fluid_box",
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
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 1,
        shift = util.by_pixel(0, -32),
        hr_version = {
            filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-north.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            frame_count = 1,
            shift = util.by_pixel(0, -32),
            scale = 0.5
        }
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
        for n = 1, #fields do
            if fields[n] == key then
                entity[key] = scale(value, scalar)
                -- Move to the next key rather than digging down further
                goto continue
            end
        end

        -- Check to see if we need to ignore this key
        for n = 1, #ignored_fields do
            if ignored_fields[n] == key then
                -- Move to the next key rather than digging down further
                goto continue
            end
        end

        if (type(value) == "table") then
            rescale(value, scalar)
        end

        -- Label to skip to next iteration
        :: continue ::
    end
end

function rescale_entity(entity, scalar)
    rescale(entity, scalar)

    scale_circuit_connector_sprites(entity.circuit_connector_sprites, scalar)
    scale_circuit_wire_connection_points(entity.circuit_wire_connection_points, scalar)
    scale_wire_positions(entity.connection_points, scalar)
    entity.scale_entity_info_icon = true
end

function fixPipeConnections(self)
    if self.fluid_boxes then
        if string.match(self.name, "assembling") then
            self.fluid_boxes[1].pipe_connections = { { type = "input", position = { 0, -1 } } }
            self.fluid_boxes[2].pipe_connections = { { type = "output", position = { 0, 1 } } }
        end
        --if string.match(self.name, "boiler") then
        --    self.fluid_boxes[1].pipe_connections = { { type = "input", position = { 0, -1 } } }
        --    self.fluid_boxes[2].pipe_connections = { { type = "output", position = { 0, 1 } } }
        --end
        if string.match(self.name, "refinery") then

            self.fluid_boxes[1].pipe_connections = { { type = "input", position = { -1, 0 } } }
            self.fluid_boxes[1].pipe_covers =nil
            --self.fluid_boxes[2].pipe_connections = { { type = "output", position = { 1, 0 } } }
            self.fluid_boxes[2] = {
                production_type = "output",
                pipe_covers = pipecoverspictures(),
                base_level = 1,
                pipe_connections = {
                    {
                        type = "output",
                        position = { 1, 0 }
                    }
                }
            }
            self.fluid_boxes[3].pipe_connections = { { type = "output", position = { 0, 1 } } }
            self.fluid_boxes[3].pipe_covers =nil
            self.fluid_boxes[4].pipe_connections = { { type = "output", position = { 0, -1 } } }
            self.fluid_boxes[4].pipe_covers =nil
            self.fluid_boxes[5] = nil
        end
        if string.match(self.name, "chemical") then
            self.fluid_boxes[1].pipe_connections = { { type = "input", position = { 0, -1 } } }
            self.fluid_boxes[2].pipe_connections = { { type = "input", position = { 0, 1 } } }
            self.fluid_boxes[3].pipe_connections = { { type = "output", position = { 1, 0 } } }
            self.fluid_boxes[4].pipe_connections = { { type = "output", position = { -1, 0 } } }
        end
        if string.match(self.name, "electro") then
            self.fluid_boxes[1].pipe_connections = { { type = "input", position = { -0.5, -1.5 } } }
            self.fluid_boxes[2].pipe_connections = { { type = "input", position = { 0.5, -1.5 } } }
            self.fluid_boxes[3].pipe_connections = { { type = "output", position = { -0.5, 1.5 } } }
            self.fluid_boxes[4].pipe_connections = { { type = "output", position = { 0.5, 1.5 } } }
        end
        if string.match(self.name, "bobmetal") then
            self.fluid_boxes[1].pipe_connections = { { type = "input", position = { 0.5, -1.5 } } }
            self.fluid_boxes[2].pipe_connections = { { type = "output", position = { 0.5, 1.5 } } }
        end
        if string.match(self.name, "bobchem") then
            self.fluid_boxes[1].pipe_connections = { { type = "input-output", position = { 0.5, -1.5 } } }
        end
        if string.match(self.name, "bobmulti") then
            self.fluid_boxes[1].pipe_connections = { { type = "input-output", position = { 0.5, -1.5 } } }
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
                { direction = 2, position = { 0, 0 } },
                { direction = 6, position = { 0, 0 } },
                { direction = 0, position = { 0, 0 } },
                { direction = 4, position = { 0, 0 } }
            }
        end
    end
end




