-- work with directions
local opposite = {
    [defines.direction.north] = defines.direction.south,
    [defines.direction.south] = defines.direction.north,
    [defines.direction.east] = defines.direction.west,
    [defines.direction.west] = defines.direction.east,
}
local dir2vector = {
    [defines.direction.north] = { x = 0, y = -1 },
    [defines.direction.south] = { x = 0, y = 1 },
    [defines.direction.east] = { x = 1, y = 0 },
    [defines.direction.west] = { x = -1, y = 0 },
}

-- add vectors
local function add_vectors(v1, v2)
    return { v1.x + v2.x, v1.y + v2.y }
end

-- return all entities 1 tile away in specified direction
local function get_neighbour_entities(entity, direction)
    return entity.surface.find_entities_filtered { position = add_vectors(entity.position, dir2vector[direction]) }
end

-- does any entity in list have an inventory we can work with
local function are_loadable(entities)
    for _, entity in pairs(entities) do
        if entity.get_inventory(defines.inventory.chest) or
                entity.get_inventory(defines.inventory.furnace_source) or
                entity.get_inventory(defines.inventory.assembling_machine_input) or
                entity.get_inventory(defines.inventory.lab_input) or
                entity.get_inventory(defines.inventory.rocket_silo_rocket)
        then
            return true
        end
    end
    return false
end

-- belt facing detection
local function are_belt_facing(entities, direction)
    for _, entity in pairs(entities) do
        if (entity.type == "transport-belt" or
                entity.type == "underground-belt" or
                entity.type == "splitter" or
                entity.type == "loader-1x1") and
                entity.direction == direction
        then
            return true
        end
    end
    return false
end

-- if there's a belt behind, mode follows the direction of the belt
-- else if there's a belt ahead, stop
-- else if there's an inventory behind but not ahead, turn around
-- else if there's an inventory ahead but not behind, turn around and switch mode
-- else if no inventories and a belt ahead, turn around; also switch mode if belt is facing towards
local function on_built_entity(event)
    local built = event.entity
    -- invalid build? don't bother with faked "revived" property from pre-1.0 Nanobots/Bluebuild, those shenanigans can only be passed in script_raised_* events now
    -- also no need to check entity type since we can filter for it on the event handler
    if not built or not built.valid then
        return
    end
    local snap2inv = settings.get_player_settings(game.players[event.player_index])["comfortable-loader-snap-to-inventories"].value
    local snap2belt = settings.get_player_settings(game.players[event.player_index])["comfortable-loader-snap-to-belts"].value
    -- no need to check anything if configs are off
    if not snap2inv and not snap2belt then
        return
    end
    -- get the entities from both ends
    local belt_end = get_neighbour_entities(built, built.direction)
    local loading_end = get_neighbour_entities(built, opposite[built.direction])

    if snap2belt and are_belt_facing(belt_end, opposite[built.direction]) then
        -- there's a belt facing toward the belt-side of the loader, so we want to be in input mode
        built.rotate({ by_player = event.player_index })
    elseif snap2belt and are_belt_facing(belt_end, built.direction) then
        -- there's a belt facing away from the belt-side of the loader, so we want to be certain to stay in output mode, stop further checks
        return
    elseif snap2inv and are_loadable(loading_end) then
        -- there's a loadable entity on the loader end
        -- as long as there's no belt facing away from the belt end, flip into input mode to load it up
        if not are_belt_facing(belt_end, built.direction) then
            built.rotate({ by_player = event.player_index })
        end
    elseif are_loadable(belt_end) then
        -- there's a loadable entity on the belt end but not on the loader end, flip around and go into input mode to load it up
        built.direction = opposite[built.direction]
        -- unless there's a belt facing away, then stay in output mode
        if not are_belt_facing(loading_end, built.direction) then
            -- that wasn't the case so we're safe to go into input mode
            built.rotate({ by_player = event.player_index })
        end
    elseif snap2belt and are_belt_facing(loading_end, built.direction) then
        -- there's a belt facing into the loader end, switch into input mode and flip
        built.direction = opposite[built.direction]
        built.rotate({ by_player = event.player_index })
    elseif snap2belt and are_belt_facing(loading_end, opposite[built.direction]) then
        -- there's a belt facing away from the loader end, flip
        built.direction = opposite[built.direction]
    end
end
-- add filter to save another millisecond
script.on_event(defines.events.on_built_entity, on_built_entity, { { filter = "type", type = "loader-1x1" } })

--local function on_configuration_changed(config)
--    -- scan the forces' technologies for any of our loaders or beltboxes that should be
--    -- unlocked but aren't, likely due to the mod adding them just being added to the save
--    for _, force in pairs(game.forces) do
--        for tech_name, tech_table in pairs(force.technologies) do
--            if tech_table.researched then
--                -- find any beltboxes or loaders or stacks in effects and unlock
--                if tech_table["effects"] then
--                    for _, effect_table in ipairs(tech_table.effects) do
--                        if effect_table.type == "unlock-recipe" and (string.find(game.recipe_prototypes[effect_table.recipe].order, "%-comfortable%-") or string.find(game.recipe_prototypes[effect_table.recipe].name, "comfortable%-")) then
--                            force.recipes[effect_table.recipe].enabled = true
--                        end
--                    end
--                end
--            end
--        end
--    end
--end
--script.on_configuration_changed(on_configuration_changed)
