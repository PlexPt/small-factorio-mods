-- surfaces settings



function is_this_area_empty(chunk, surface, area_size)
    local valid = true
    for y = (chunk.y * 32) + (32 / 2) - area_size, (chunk.y * 32) + (32 / 2) + area_size do
        for x = (chunk.x * 32) + (32 / 2) - area_size, (chunk.x * 32) + (32 / 2) + area_size do
            local p = { x = x, y = y }
            if surface.get_tile(p) and surface.get_tile(p).name ~= 'out-of-map' then
                valid = false
                break
            end
        end
    end
    return valid
end

function FindEmptyPlace(surface, area_size, initial_position, min_chunks, max_tries)

    local directionVec = GetRandomVector(var)
    local position = initial_position
    local chunkPos = Chunk.from_position(initial_position)  --{x=0,y=0}  initial_position

    if min_chunks then
        while (true) do
            chunkPos.x = chunkPos.x + directionVec.x
            chunkPos.y = chunkPos.y + directionVec.y
            if distance(chunkPos, Chunk.from_position(initial_position)) >= min_chunks then
                break
            end
        end
    end

    --[[
        end]]

    local tries = 0
    -- Keep checking chunks in the direction of the vector
    while (true) do
        tries = tries + 1
        -- Set some absolute limits.
        if tries > 500 then
            break

        elseif max_chunks and tries > max_tries then
            position.x = (chunkPos.x * 32) + (32 / 2)
            position.y = (chunkPos.y * 32) + (32 / 2)
            break

            -- If chunk is already generated, keep looking
        elseif (not surface.is_chunk_generated(chunkPos)) then
            surface.request_to_generate_chunks(chunkPos, 1)
            surface.force_generate_chunk_requests()

            -- Found a possible generated area
        elseif not is_this_area_empty(chunkPos, surface, area_size) then
            chunkPos.x = chunkPos.x + directionVec.x
            chunkPos.y = chunkPos.y + directionVec.y

        else
            position.x = (chunkPos.x * 32) + (32 / 2)
            position.y = (chunkPos.y * 32) + (32 / 2)
            break
        end
    end

    return position
end





--maybe a circle of tiles
function CreateRoundRoom(surface, entrance, centerPos, radius, tiles, border_entity, force, clear_entity)

    local area = GetAreaAroundPos(centerPos, radius)
    local tileRadSqr = radius ^ 2

    local place_tiles = {}
    for i = area.left_top.x, area.right_bottom.x, 1 do
        for j = area.left_top.y, area.right_bottom.y, 1 do

            -- This ( X^2 + Y^2 ) is used to calculate if something
            -- is inside a circle area.
            local distVar = math.floor((centerPos.x - i) ^ 2 + (centerPos.y - j) ^ 2)

            local p = { x = i, y = j }

            if (distVar < tileRadSqr) then
                table.insert(place_tiles, { name = tiles[math.random(#tiles)], position = p })
                if clear_entity then
                    local e = surface.find_entities_filtered { position = p, name = clear_entity, limit = 1 }
                    if #e > 0 then
                        e[1].destroy()
                    end
                end
            end

            -- Create a circle of entities on borders.
            if border_entity then
                local d = distance(p, centerPos)
                if d >= radius - 1 and d <= radius + 1 then
                    if distance(p, entrance) > 3 then
                        surface.create_entity({ name = border_entity[math.random(#border_entity)], position = p, force = force or 'neutral' })
                    end
                end
            end
        end
    end

    surface.set_tiles(place_tiles)
    return { center = centerPos, size = radius - 2 }
end

function CreateRectRoom(surface, entrance, direction, size, tiles, border_entity, force, clear_entity)

    local dx = direction.x
    local dy = direction.y
    local xx = entrance.x
    local yy = entrance.y
    local width = math.max(size, 9)
    local length = math.random(width - 4, width + 20)
    local LE = 0
    local place_tiles = {}
    local last_rock_cap = {}
    local previous = 0

    for L = 1, length do
        LE = L
        if L % 3 == 0 then
            if dx ~= 0 then
                yy = yy + math.random(-1, 1)
            else
                xx = xx + math.random(-1, 1)
            end
        end
        last_rock_cap = {}
        if dx ~= 0 then
            xx = xx + dx
            for y = -width, width do
                local p = { x = xx, y = yy + y }
                if surface.get_tile(p).name == 'out-of-map' then
                    table.insert(place_tiles, { name = tiles[math.random(#tiles)], position = p })
                    --local r = surface.find_entities_filtered{position=p,name=rock_list, limit=1}
                    if y == -width or y == width or L == length then
                        create_a_rock_here(surface, p)
                    else
                        table.insert(last_rock_cap, p)
                    end
                    if L == 1 then
                        if distance(p, entrance) > 3 then
                            create_a_rock_here(surface, p)
                        end
                    end
                else
                    previous = previous + 1
                    if previous > 10 then
                        break
                    end
                end
            end
        else
            yy = yy + dy
            for x = -width, width do
                local p = { x = xx + x, y = yy }
                if surface.get_tile(p).name == 'out-of-map' then
                    table.insert(place_tiles, { name = tiles[math.random(#tiles)], position = p })
                    --local r = surface.find_entities_filtered{position=p,name=rock_list, limit=1}
                    if x == -width or x == width or L == length then
                        create_a_rock_here(surface, p)
                    else
                        table.insert(last_rock_cap, p)
                    end

                    if L == 1 then
                        if distance(p, entrance) > 3 then
                            create_a_rock_here(surface, p)
                        end
                    end
                else
                    previous = previous + 1
                    if previous > 10 then
                        break
                    end
                end
            end
        end

        if previous > 10 then
            for c = 1, #last_rock_cap do
                create_a_rock_here(surface, last_rock_cap[c])
            end
            break
        end
    end

    surface.set_tiles(place_tiles)
    local center = { x = math.ceil((xx + entrance.x) / 2), y = math.ceil((yy + entrance.y) / 2) }
    return { center = center, size = math.floor(LE / 2) }
end

function AddTile(name, area, surface, entity_in_border, irregular)
    local land = {}

    local x1, x2, y1, y2
    if area[1] then
        x1, x2 = area[1].x, area[2].x
        y1, y2 = area[1].y, area[2].y
    else
        x1, x2 = area.left_top.x, area.right_bottom.x
        y1, y2 = area.left_top.y, area.right_bottom.y
    end

    local dx = 0
    for y = y1, y2 do
        if irregular then
            dx = dx + math.random(-1, 1)
        end
        for x = x1, x2 do
            if irregular then
                if y == y1 and math.random(2) == 1 then
                    table.insert(land, { name = name, position = { x = x + dx, y = y - 1 } })
                end
                if y == y2 and math.random(2) == 1 then
                    table.insert(land, { name = name, position = { x = x + dx, y = y + 1 } })
                end
            end
            table.insert(land, { name = name, position = { x = x + dx, y = y } })
        end
    end
    surface.set_tiles(land)

    if entity_in_border then
        local force = entity_in_border.force
        for y = y1, y2 do
            for x = x1, x2 do
                if y == y1 or y == y2 or x == x1 or x == x2 then

                    local en = entity_in_border.names[math.random(#entity_in_border.names)]
                    surface.create_entity({ name = en, position = { x = x, y = y }, force = force })
                end
            end
        end
    end
end

function AddRiver(river, surface)
    local waterTiles = {}
    local water = {}
    local x1, x2 = river[1].x, river[2].x
    local y1, y2 = river[1].y, river[2].y

    surface.destroy_decoratives { area = river }
    for y = y1, y2 do
        for x = x1, x2 do
            if y == y1 or y == y2 or x == x1 or x == x2 or y == y1 + 1 or y == y2 - 1 or x == x1 + 1 or x == x2 - 1 then
                --if (x==x1 or x==x2 or math.random(0,3)>0) then
                table.insert(water, { name = "water", position = { x = x, y = y } })
                --if (y==y1 or y==y2 or x==x1 or x==x2 or math.random(0,3)>0) then table.insert(water, {name="water", position={x=-x, y=-y}}) end
            else
                table.insert(waterTiles, { name = "deepwater", position = { x = x, y = y } })
            end
        end
    end
    surface.set_tiles(waterTiles)
    surface.set_tiles(water)
end

function setup_nauvis_init()
    local surface = game.surfaces[1]

    local map_gen_settings = surface.map_gen_settings
    if not game.active_mods['space-exploration'] then
        map_gen_settings.width = 100
        map_gen_settings.height = 100
        map_gen_settings.water = map_gen_settings.water / 2
    end
    surface.map_gen_settings = map_gen_settings

    global.waterTiles = {}
    local ws = 150
    local river = { { x = -ws, y = -ws }, { x = ws, y = ws } }
    AddRiver(river, surface)
    global.waterTiles = {}

    setup_nauvis_init_coyote()
    --[[
    local ws = 15
    local area ={{x=-ws,y=-ws},{x=ws,y=ws}}
    AddTile('grass-1',area,surface)

    local area ={{x=-ws,y=-ws},{x=ws,y=ws}}
    AddTile('refined-concrete',area,surface)

    local ws = 3
    local area ={{x=-ws,y=-ws},{x=ws,y=ws}}
    AddTile('grass-1',area,surface) --stone-path

    local t = surface.create_entity{name="tree-01", amount=1, position={-1, -1}}
    t.minable=false
    t.destructible=false
    local t = surface.create_entity{name="tree-02", position={2, 2}}
    t.minable=false
    t.destructible=false
    ]]


    for k, entity in pairs(surface.find_entities_filtered({ force = "enemy" })) do
        entity.destroy()
    end

    local p = { x = -90, y = -99 }
    for T = 1, 8 do
        local force = game.forces['player_force_' .. T]
        local hidden_chest = surface.create_entity({ name = 'tc_big_chest', position = p, force = force })
        hidden_chest.minable = false
        hidden_chest.destructible = false
        global.forces_info[force.name].hidden_chest = hidden_chest
    end
end

function setup_nauvis_init_coyote()
    local s = game.surfaces[1]
    FillCircle(s, { x = 0, y = 0 }, 22, { 'yellow-refined-concrete' })
    FillCircle(s, { x = -12, y = -8 }, 6, { 'refined-concrete' })
    FillCircle(s, { x = 2, y = -8 }, 6, { 'refined-concrete' })
    s.set_tiles({ { name = 'black-refined-concrete', position = { x = -12, y = -8 } } })
    s.set_tiles({ { name = 'black-refined-concrete', position = { x = 2, y = -8 } } })
    local a = { left_top = { x = -20, y = 1 }, right_bottom = { x = 8, y = 3 } }
    FillWith(s, a, nil, 'black-refined-concrete')
end

local internal_base_size = 64
function create_internal_base(force)
    local map_gen_settings = get_empty_mapgen('out-of-map')
    local surface = game.create_surface("TC_IB_" .. force.name, map_gen_settings)
    surface.request_to_generate_chunks({ 0, 0 }, 7)
    surface.force_generate_chunk_requests()
    surface.always_day = true
    surface.show_clouds = false
    surface.wind_speed = 0
    surface.solar_power_multiplier = 0
    return surface
end

local tank_corridor_size = 45
function BuildInternalBase(surface, force)

    --water on the left
    local tunel_size = 1
    local water = { { x = -internal_base_size, y = -tunel_size }, { x = -internal_base_size + 1, y = tunel_size } }
    AddRiver(water, surface)

    --horizontal tunel
    local tunel_size = 5
    local wide = tank_corridor_size
    local tunel = { { x = -internal_base_size + 2, y = -tunel_size }, { x = -internal_base_size + wide, y = tunel_size } }
    FillWith(surface, tunel, nil, 'tutorial-grid')

    --vertical (idea for boilers
    local hight = 9
    local b_wide = 12
    local b_tunel = { { x = -internal_base_size + 11, y = -hight }, { x = -internal_base_size + 11 + b_wide, y = hight } }
    FillWith(surface, b_tunel, nil, 'tutorial-grid')

    --[[
    local fuel_chest = surface.create_entity{name='compilatron-chest',position={x=-internal_base_size+2,y=-4}, force=force}
    fuel_chest.minable=false
    fuel_chest.destructible=false
    global.forces_info[force.name].fortress.fuel_chest = fuel_chest]]

    -- exit portal
    local ppx = -internal_base_size + 35
    local for_portal = { { x = ppx - 1, y = -tunel_size - 3 }, { x = ppx + 1, y = -tunel_size } }
    FillWith(surface, for_portal, nil, 'tutorial-grid')
    local fortress_exit = surface.create_entity { name = 'tc_fortress_portal', position = { x = ppx, y = -tunel_size - 2 }, force = force }
    fortress_exit.minable = false
    fortress_exit.destructible = false
    global.forces_info[force.name].fortress.exit = fortress_exit
    force.set_spawn_position({ x = ppx + 1, y = 0 }, surface)


    --loaders
    local for_coal = { { x = water[1].x + 2, y = -tunel_size - 3 }, { x = water[1].x + 2, y = -tunel_size } }
    FillWith(surface, for_coal, nil, 'tutorial-grid')
    local x = b_tunel[2].x + 2
    local to_inside = { { x = x, y = -tunel_size - 3 }, { x = x, y = -tunel_size } }
    FillWith(surface, to_inside, nil, 'tutorial-grid')
    --local to_outside = {{x=x,y=tunel_size},{x=x,y=tunel_size+3}}
    --FillWith(surface,to_outside,nil,'tutorial-grid')



    local chest_in = surface.create_entity { name = 'logistic-chest-passive-provider', position = { x = to_inside[1].x, y = to_inside[1].y }, force = force }
    chest_in.minable = false
    chest_in.destructible = false
    local chest_coalin = surface.create_entity { name = 'logistic-chest-passive-provider', position = { x = for_coal[1].x, y = for_coal[1].y }, force = force }
    chest_coalin.minable = false
    chest_coalin.destructible = false
    --[[local chest_out = surface.create_entity{name='logistic-chest-requester',position={x=to_outside[1].x ,y=to_outside[2].y}, force=force}
    chest_out.minable=false
    chest_out.destructible=false

    ]]

    local loader_in = surface.create_entity { name = 'express-loader', position = { x = to_inside[1].x, y = to_inside[1].y + 2 }, force = force, direction = defines.direction.south }
    local loader_coal_in = surface.create_entity { name = 'express-loader', position = { x = for_coal[1].x, y = for_coal[1].y + 2 }, force = force, direction = defines.direction.south }
    --local loader_out = surface.create_entity{name='express-loader',position={x=to_outside[1].x ,y=to_outside[1].y+2}, force=force, direction =defines.direction.south}
    loader_in.minable = false
    loader_in.destructible = false
    loader_in.rotatable = false
    loader_coal_in.minable = false
    loader_coal_in.destructible = false
    loader_coal_in.rotatable = false
    --[[loader_out.minable=false
    loader_out.destructible=false
    loader_out.rotatable=false
    loader_out.loader_type = 'input'
    ]]
    loader_in.loader_type = 'output'
    loader_coal_in.loader_type = 'output'

    loader_in.direction = defines.direction.south
    loader_coal_in.direction = defines.direction.south

    chest_in.update_connections()
    chest_coalin.update_connections()
    --chest_out.update_connections()

    global.forces_info[force.name].fortress.inside_chest_in = chest_in
    global.forces_info[force.name].fortress.inside_chest_coal_in = chest_coalin
    --global.forces_info[force.name].fortress.inside_chest_out =chest_out

end

function adjust_internal_tank_size(surface, lv)
    --Build internal tank size
    local init = tank_corridor_size + 1
    local size = lv * 12
    local square = { { x = -internal_base_size + init, y = -size / 2 }, { x = -internal_base_size + init + size, y = size / 2 } }
    FillWith(surface, square, nil, 'tutorial-grid')
end

function ClearArea(area, surface)
    --		surface.regenerate_decorative()
    --		surface.regenerate_entity({"tree-01", "tree-02","tree-03","tree-04","tree-05","tree-06","tree-07","tree-08","tree-09","dead-dry-hairy-tree","dead-grey-trunk","dead-tree-desert","dry-hairy-tree","dry-tree","rock-big","rock-huge"})

    if not surface then
        surface = game.surfaces.surface
    end
    local entities = surface.find_entities(area)
    for _, e in pairs(entities) do
        if e.type == "simple-entity" or e.type == "resource" or e.type == "tree" then
            e.destroy()
        end
    end

end

function AddFish(num)
    local surface = game.surfaces.surface
    for x = 1, num do
        local pos = global.waterTiles[math.random(1, #global.waterTiles)].position
        surface.create_entity({ name = "fish", position = pos })
    end
end

function AddFishArea(surface, area, ratio)
    local solo = {}
    local x1, x2, y1, y2
    if area[1] then
        x1, x2 = area[1].x, area[2].x
        y1, y2 = area[1].y, area[2].y
    else
        x1, x2 = area.left_top.x, area.right_bottom.x
        y1, y2 = area.left_top.y, area.right_bottom.y
    end
    for y = y1, y2, 1 do
        for x = x1, x2, 1 do
            local tile = surface.get_tile(x, y)
            if (tile.valid) and in_list({ "water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud" }, tile.name) then
                if math.random() <= ratio then
                    surface.create_entity({ name = "fish", position = { x = x, y = y } })
                end
            end
        end
    end
end

function FillWaterWith(surface, area, withwhat)
    FillWith(surface, area, { "water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud" }, withwhat)
end

function FillWith(surface, area, what, withwhat)
    local solo = {}
    local x1, x2, y1, y2
    if area[1] then
        x1, x2 = area[1].x, area[2].x
        y1, y2 = area[1].y, area[2].y
    else
        x1, x2 = area.left_top.x, area.right_bottom.x
        y1, y2 = area.left_top.y, area.right_bottom.y
    end
    for y = y1, y2, 1 do
        for x = x1, x2, 1 do
            local tile = surface.get_tile(x, y)
            if (tile.valid) and ((not what) or in_list(what, tile.name)) then
                local tn = withwhat
                if type(tn) == 'table' then
                    tn = withwhat[math.random(#withwhat)]
                end
                table.insert(solo, { name = tn, position = { x = x, y = y } })
            end
        end
    end

    if #solo > 0 then
        surface.set_tiles(solo)
    end
end

function FillBondariesWith(surface, area, withwhat, max_distance, min_distance)
    local solo = {}
    local x1, x2, y1, y2
    if area[1] then
        x1, x2 = area[1].x, area[2].x
        y1, y2 = area[1].y, area[2].y
    else
        x1, x2 = area.left_top.x, area.right_bottom.x
        y1, y2 = area.left_top.y, area.right_bottom.y
    end
    for y = y1, y2 do
        for x = x1, x2 do
            if max_distance then

                if math.abs(y) > max_distance or math.abs(x) > max_distance and surface.get_tile(x, y) and surface.get_tile(x, y).valid then
                    table.insert(solo, { name = withwhat, position = { x = x, y = y } })
                    --if withwhat=='deepwater' then if math.random(40)==1 then surface.create_entity{name='fish', position={x=x, y=y},force=game.forces.neutral} end end --desyncs
                end
            end
            if min_distance then
                if math.abs(y) < min_distance and math.abs(x) < min_distance and surface.get_tile(x, y) and surface.get_tile(x, y).valid then
                    table.insert(solo, { name = withwhat, position = { x = x, y = y } })
                end
            end
        end
    end

    if #solo > 0 then
        surface.set_tiles(solo)
    end
end

function position_adjust_distance_from_center(position, distance)
    local x = position.x
    local y = position.y
    if math.abs(x) > math.abs(distance) then
        if x > 0 then
            x = x + distance
        else
            x = x - distance
        end
    end
    if math.abs(y) > math.abs(distance) then
        if y > 0 then
            y = y + distance
        else
            y = y - distance
        end
    end
    return { x = x, y = y }
end


--a circle of tiles
function FillCircle(surface, centerPos, radius, tiles)
    local area = GetAreaAroundPos(centerPos, radius)
    local tileRadSqr = radius ^ 2
    local place_tiles = {}
    for i = area.left_top.x, area.right_bottom.x, 1 do
        for j = area.left_top.y, area.right_bottom.y, 1 do
            -- This ( X^2 + Y^2 ) is used to calculate if something is inside a circle area.
            local distVar = math.floor((centerPos.x - i) ^ 2 + (centerPos.y - j) ^ 2)
            local p = { x = i, y = j }
            if (distVar < tileRadSqr) then
                table.insert(place_tiles, { name = tiles[math.random(#tiles)], position = p })
            end
        end
    end
    surface.set_tiles(place_tiles)
end

function clear_and_fill_area(surface, position, area_size, fill)
    local area = GetAreaAroundPos(position, area_size)
    ClearArea(area, surface)
    RemoveAliensInArea(surface, area)
    RemoveCliff(surface, area)
    if fill then
        FillWaterWith(surface, area, 'grass-1')
    end
end

function create_concrete_site(surface, position, size)
    if not size then
        size = 32
    end
    clear_and_fill_area(surface, position, size)
    local area = GetAreaAroundPos(position, math.ceil(size * 2 / 3))
    AddTile('concrete', area, surface)
    area = GetAreaAroundPos(position, math.floor(size / 2))
    AddTile('refined-hazard-concrete-left', area, surface)
end

function get_empty_mapgen(tile)
    return {
        terrain_segmentation = "none",
        water = "none",
        autoplace_controls = { },
        default_enable_all_autoplace_controls = false,
        autoplace_settings = {
            ["entity"] = {
                treat_missing_as_default = false,
            },
            ["tile"] = {
                treat_missing_as_default = false,
                settings = {
                    [tile] = {
                        frequency = 1,
                        size = 1,
                        richness = 1,
                    },
                },
            },
            ["decorative"] = {
                treat_missing_as_default = false,
            },
        },
        cliff_settings = {
            cliff_elevation_0 = 1024,
        },
        starting_points = { },
    }
end
