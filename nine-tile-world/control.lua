local chunksize = 32

local function chunk_to_area(chunk, for_tiles)
    if for_tiles then
        return { { chunk.x * chunksize, chunk.y * chunksize }, { chunk.x * chunksize + chunksize - 1, chunk.y * chunksize + chunksize - 1 } }
    else
        return { { chunk.x * chunksize, chunk.y * chunksize }, { chunk.x * chunksize + chunksize - 0.0001, chunk.y * chunksize + chunksize - 0.0001 } }
    end
end

local function init_surface_settings(surface)
    log("初始化 surface 设置: " .. surface.name)

    local map_gen_setting = surface.map_gen_settings
    map_gen_setting.width = 9

    if surface.name and string.find(surface.name, "^platform-") then
        map_gen_setting.width = 18
    end

    surface.map_gen_settings = map_gen_setting
end

local function generate_liquid_resources_and_tiles(surface)

    log("生成液体资源和瓷砖: " .. surface.name)
    -- Default settings
    local liquid_tile = "water"
    local fluid_resources = { "crude-oil" }

    if surface.name and string.find(surface.name, "^platform-") then
        return
    end


    -- Adjust settings based on surface name
    if string.find(surface.name, "aquilo") then
        liquid_tile = "ammoniacal-ocean-2"
        fluid_resources = { "crude-oil", "lithium-brine", "fluorine-vent" }
    elseif string.find(surface.name, "fulgora") then
        liquid_tile = "oil-ocean-deep"
        fluid_resources = {}
    elseif string.find(surface.name, "gleba") then
        liquid_tile = "gleba-deep-lake"
        fluid_resources = {}
    elseif string.find(surface.name, "vulcanus") then
        liquid_tile = "lava"
        fluid_resources = { "sulfuric-acid-geyser" }
    end

    -- Place liquid tile at least 6 times
    local liquid_positions = { { 0, 8 }, { 1, 8 }, { -1, 8 }, { 0, 9 }, { 1, 9 }, { -1, 9 } }
    for _, pos in pairs(liquid_positions) do
        surface.set_tiles({ { name = liquid_tile, position = pos } })
    end

    log("放置液体瓷砖: " .. liquid_tile .. " 在位置 {0, 8}")


    -- Place fluid resources
    local y_offset = 20
    for _, fluid in pairs(fluid_resources) do
        for x = -5, 5 do
            surface.create_entity({
                name = fluid,
                position = { x, y_offset },
                amount = 625000
            })
        end
        y_offset = y_offset + 4  -- Move to next row

    end
    log("放置液体资源: " .. table.concat(fluid_resources, ", ") .. " 在位置 {-5, " .. y_offset .. "} 到 {5, " .. y_offset .. "}")
end

local function generate_starting_resources(surface)
    log("生成起始资源: " .. surface.name)

    -- Define resource types and their probabilities
    local resource_types = {
        "iron-ore",
        "copper-ore",
        "coal",
        "stone"
    }

    if surface.name and string.find(surface.name, "^platform-") then
        return
    end

    -- Adjust resource types based on surface name
    if string.find(surface.name, "aquilo") then
        resource_types = {}
    elseif string.find(surface.name, "gleba") then
        resource_types = { "stone" }
    elseif string.find(surface.name, "fulgora") then
        resource_types = { "scrap" }
    elseif string.find(surface.name, "vulcanus") then
        resource_types = { "coal", "calcite", "tungsten-ore" }
    end


    -- Place resources in a 10x10 grid
    for y = -5, 5 do
        for x = -5, 5 do
            for _, resource_type in pairs(resource_types) do
                surface.create_entity({
                    name = resource_type,
                    position = { x, y },
                    amount = 10000
                })
            end
        end
    end


end


-- Starting area configuration
local function configure_starting_area(surface)
    log("配置起始区域: " .. surface.name)
    -- Define the starting area
    local area = { { -5, -5 }, { 5, 5 } }  -- 10x10 starting area

    if string.find(surface.name, "nauvis") then
        local tile = surface.get_tile(100, 100)
        if tile and tile.name ~= "out-of-map" then
            log("删除多余区块: " .. surface.name)

            -- Clear all chunks
            -- Delete chunks from -10,-10 to 10,10
            for x = -10, 10 do
                for y = -10, 10 do
                    if x > 0 or x < -1 or y < -1 or y > 0 then
                        surface.delete_chunk({ x, y })
                    end
                end
            end

            -- Create a table to store tile changes
            local tile_changes = {}

            -- Fill tiles from -32,-32 to 4,4 with "out"
            for x = -33, -5 do
                for y = -33, 33 do
                    table.insert(tile_changes, { name = "out-of-map", position = { x, y } })
                end
            end

            -- Fill tiles from -32,-32 to 4,4 with "out"
            for x = 5, 33 do
                for y = -33, 33 do
                    table.insert(tile_changes, { name = "out-of-map", position = { x, y } })
                end
            end

            -- Apply all tile changes at once
            surface.set_tiles(tile_changes)


        end
    end

    surface.request_to_generate_chunks({ 0, 0 }, 1)
    surface.force_generate_chunk_requests()

    -- Clear any water/cliffs in starting area
    --for x = -5, 5 do
    --    for y = -5, 5 do
    --        local tile = surface.get_tile(x, y)
    --        if tile and tile.name == "water" or tile.name == "deepwater" then
    --            surface.set_tiles({ { name = "grass-1", position = { x, y } } })
    --        end
    --    end
    --end


    -- Generate starting resources
    generate_starting_resources(surface)
    generate_liquid_resources_and_tiles(surface)

end

-- Entity placement validation
local function validate_entity_placement(event)
    local entity = event.created_entity
    if not entity then
        return
    end

    -- Special handling for underground belts
    if entity.type == "underground-belt" then
        local partner = entity.neighbours
        if partner and math.abs(partner.position.x - entity.position.x) > 8 then
            entity.destroy()
            game.players[event.player_index].print("Underground belt connection too wide!")
            return
        end
    end

    -- Prevent entities from crossing world boundary
    local bbox = entity.bounding_box
    if bbox.left_top.x < -4 or bbox.right_bottom.x > 4 then
        entity.destroy()
        game.players[event.player_index].print("Entity placement outside world bounds!")
        return
    end
end

-- Event handlers
script.on_init(function()


    local freeplay = remote.interfaces["freeplay"]
    if freeplay then
        if freeplay["set_skip_intro"] then
            remote.call("freeplay", "set_skip_intro", true)
        end

        if freeplay["set_disable_crashsite"] then
            remote.call("freeplay", "set_disable_crashsite", true)
        end
    end


    -- Apply settings to all existing surfaces
    if game.surfaces then

        for _, surface in pairs(game.surfaces) do
            init_surface_settings(surface)
            configure_starting_area(surface)
        end

    end
end)

-- Handle new surface creation
script.on_event(defines.events.on_surface_created, function(event)
    local surface = game.get_surface(event.surface_index)
    if surface then
        log("检测到新surface: " .. surface.name)
        init_surface_settings(surface)
        configure_starting_area(surface)
    end
end)

-- Handle configuration changes
script.on_configuration_changed(function(data)
    -- Reapply settings to all surfaces when mod config changes
    if game.surfaces then
        for _, surface in pairs(game.surfaces) do
            init_surface_settings(surface)
            configure_starting_area(surface)
        end
    end
end)

