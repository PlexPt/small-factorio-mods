local upgrade_miku = function(entity, isghost)
    local s = entity.surface
    local p = entity.position
    local f = entity.force
    local h = entity.health
    local mh = entity.prototype.get_max_health()
    local next_upgrade = entity.prototype.next_upgrade
    local d = entity.direction
    local o = entity.orientation

    if isghost then
        if entity.can_be_destroyed() ~= true or
                entity.destroy({ raise_destroy = true }) ~= true then
            return
        end

        s.create_entity { name = "entity-ghost",
                          inner_name = "miku-1",
                          position = p,
                          force = f,
                          direction = d,
                          orientation = o,
                          move_stuck_players = true,
                          create_build_effect_smoke = false,
                          raise_built = true }
    end
    --defines.inventory.roboport_robot
    --defines.inventory.roboport_material
    local robot = entity.get_inventory(defines.inventory.roboport_robot)
    local c = nil
    if robot then
        c = robot.get_contents()
    end

    local roboport_material = entity.get_inventory(defines.inventory.roboport_material)
    local c2 = nil
    if roboport_material then
        c2 = roboport_material.get_contents()
    end

    if not next_upgrade then
        return
    end

    if entity.can_be_destroyed() ~= true or
            entity.destroy({ raise_destroy = true }) ~= true then
        return
    end

    local new_entity = s.create_entity { name = next_upgrade.name,
                                         position = p,
                                         force = f,
                                         direction = d,
                                         orientation = o,
                                         fast_replace = true,
                                         spill = false,
                                         move_stuck_players = true,
                                         create_build_effect_smoke = false,
                                         raise_built = true }
    -- error shouldn't happen
    if new_entity == nil then
        return
    end

    if h ~= mh then
        new_entity.health = h
    end

    --处理库存
    local inv = new_entity.get_inventory(defines.inventory.roboport_robot)
    if inv and c then
        for name, count in pairs(c) do
            inv.insert { name = name, count = count }
        end
    end

    local inv2 = new_entity.get_inventory(defines.inventory.roboport_material)
    if inv2 and c2 then
        for name, count in pairs(c2) do
            inv2.insert { name = name, count = count }
        end
    end
    --处理库存 end


end

function start_with(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

--加入队列
local function init_queue()
    storage.miku = storage.miku or {}
end

--加入队列
local function put_miku(entity, tick)
    local obj = {
        entity = entity,
        tick = tick,
        next_tick = tick + 398
    }

    init_queue()
    table.insert(storage.miku, obj)
end

local function on_entity_created(event)
    local entity = event.created_entity or event.entity
    local tick = event.tick
    if entity and entity.valid and start_with(entity.prototype.name, "miku-") then

        put_miku(entity, tick)
    end

    if entity and entity.valid and entity.name == "entity-ghost"
            and start_with(entity.ghost_name, "miku-") then

    end
end

local function on_entity_removed(event)
    if event.entity and event.entity.valid then
        local entity = event.entity

    end
end

local local_on_post_entity_died = function(event)
    local entity = event.ghost

    if event.ghost then
        local fstr = start_with(entity.ghost_prototype.name, "miku-")
        if fstr then
            local base_entity = "miku-1"
            local force = event.ghost.force
            local direction = event.ghost.direction
            local position = event.ghost.position
            local surface = event.ghost.surface
            event.ghost.destroy()
            surface.create_entity { name = "entity-ghost",
                                    inner_name = base_entity,
                                    force = force,
                                    position = position,
                                    direction = direction }
        end
    end
end

local function on_player_cursor_stack_changed (event)
    local player = game.players[event.player_index]

    if player and player.cursor_ghost and player.cursor_ghost.name then

        if start_with(player.cursor_ghost.name, "miku-") then
            player.cursor_ghost = "miku-1"
        end

    end
end

local function on_tick(event)
    init_queue()

    for k, task in pairs(storage.miku) do

        if task and task.entity and task.entity.valid then
            if game.tick == task.next_tick then
                upgrade_miku(task.entity)
                storage.miku[k] = nil
            end
        else
            storage.miku[k] = nil
        end

    end
end

script.on_event(defines.events.on_built_entity, on_entity_created)
script.on_event(defines.events.on_robot_built_entity, on_entity_created)
script.on_event(defines.events.script_raised_built, on_entity_created)
script.on_event(defines.events.script_raised_revive, on_entity_created)

script.on_event(defines.events.on_entity_died, on_entity_removed)
script.on_event(defines.events.on_pre_player_mined_item, on_entity_removed)
script.on_event(defines.events.on_robot_pre_mined, on_entity_removed)
script.on_event(defines.events.script_raised_destroy, on_entity_removed)

script.on_event(defines.events.on_post_entity_died, local_on_post_entity_died)

script.on_event(defines.events.on_tick, on_tick)
script.on_event(defines.events.on_player_cursor_stack_changed, on_player_cursor_stack_changed)
