local function init_surface_settings(surface)
    local map_gen_settings = {
        width = 9,
        height = 4294967295, -- Max supported height
        starting_area = 2, -- Enlarged starting area for resources
    }
    local mgs = surface.map_gen_settings
    mgs.width = 9

    if surface.name and string.find(surface.name, "^platform-") then
        mgs.width = 18
    end

    surface.map_gen_settings = mgs

    -- Apply to all surfaces
    --surface.map_gen_settings.width = 9
    --surface.map_gen_settings.height = 9

    -- Resource generation settings
    local resource_generation = {
        -- Increased frequency to compensate for narrow width
        autoplace_controls = {
            ["iron-ore"] = {
                frequency = 3,
                size = 2,
                richness = 1.5
            },
            ["copper-ore"] = {
                frequency = 3,
                size = 2,
                richness = 1.5
            },
            ["coal"] = {
                frequency = 2.5,
                size = 2,
                richness = 1.5
            },
            ["stone"] = {
                frequency = 2.5,
                size = 2,
                richness = 1.5
            },
            ["crude-oil"] = {
                frequency = 3,
                size = 2,
                richness = 1.5
            },
            ["enemy-base"] = {
                frequency = 1.5, -- Slightly increased frequency
                size = 1, -- Normal size
                richness = 1     -- Normal richness
            }
        }
    }

end

-- Starting area configuration
local function configure_starting_area(surface)
    --local area = { { -4, -20 }, { 4, 20 } }  -- 9x40 starting area
    --surface.request_to_generate_chunks({ 0, 0 }, 2)
    --surface.force_generate_chunk_requests()
    --
    ---- Clear any water/cliffs in starting area
    --for x = -4, 4 do
    --    for y = -20, 20 do
    --        local tile = surface.get_tile(x, y)
    --        if tile.name == "water" or tile.name == "deepwater" then
    --            surface.set_tiles({ { name = "grass-1", position = { x, y } } })
    --        end
    --    end
    --end
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

-- Handle entity placement
--script.on_event(defines.events.on_built_entity, validate_entity_placement)
--script.on_event(defines.events.on_robot_built_entity, validate_entity_placement)

-- Handle configuration changes
script.on_configuration_changed(function(data)
    -- Reapply settings to all surfaces when mod config changes
    if game.surfaces then
        for _, surface in pairs(game.surfaces) do
            init_surface_settings(surface)
        end
    end
end)
