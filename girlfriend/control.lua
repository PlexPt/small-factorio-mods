if script.active_mods["gvv"] then
    require("__gvv__.gvv")()
end

local debugtool = require("debugtool")
require("config")
require("script/gutil")

require("script/gui")

local function teleport_player_safely(player, surface, position)
    if player and surface then
        position = surface.find_non_colliding_position("character", position, 50, 0.5, false) or position
    end
    player.teleport(position, surface)
end

local function follow_player_safely(girl, player)
    if girl and player and player.surface then
        local surface = player.surface
        local surface2 = girl.surface
        local position = surface.find_non_colliding_position("character", player.position, 50, 0.5, false)
        --character.teleport(position, surface)

        if surface2 and surface.index == surface2.index then

            local girlfriend_trouble = get_runtime_setting("girlfriend_trouble")
            local girlfriend_trouble_user = get_runtime_user_setting(player, "girlfriend_trouble_user")

            if girlfriend_trouble and girlfriend_trouble_user then
                --捣蛋
                girl.set_command({
                    type = defines.command.build_base,
                    destination = position,
                    ignore_planner = true,
                    distraction = defines.distraction.none
                })

            else
                girl.set_command({
                    type = defines.command.go_to_location,
                    destination = position,
                    --destination_entity = player,
                    radius = 1,
                    distraction = defines.distraction.none
                })
            end

        else
            --跟不上了，毁灭吧
            girl.destroy()
        end
    end
end


-- Render some text on the ground. Visible to all players. Forever.
function drawName(player, girlfriend)
    if player and player.valid then
        local pink = { r = 1, g = 192 / 255, b = 203 / 255, a = 1 }
        local pink2 = { r = 1, g = 179 / 255, b = 230 / 255, a = 1 }
        local text = { "girlfriend.girlfriend-name", player.name }
        rendering.draw_text {
            text = text,
            surface = player.surface,
            target = girlfriend,
            target_offset = { 0, -2 },
            color = pink2,
            scale = 1,
            alignment = "center"
            -- Allowed fonts: default-dialog-button default-game compilatron-message-font default-large default-large-semibold default-large-bold heading-1 compi
            --font = "compi",
        }

    end
end

function drawDialog(player, girlfriend, text)
    if player and player.valid and girlfriend then

        destroyDialog(player, girlfriend)

        local text = text or GetRandomMsg()
        local position = girlfriend.position
        position.y = position.y - 20

        -- /c game.player.surface.create_entity({name="compi-speech-bubble",source = game.player, position=game.player.position, text="Hello, world!"})
        local dialog = girlfriend.surface.create_entity({ name = "compi-speech-bubble",
                                                          position = position,
                                                          source = girlfriend,
                                                          text = text })
        global.girlfriends_dialog[player.name] = dialog

    end
end
function drawDialog2(player, unit)
    if player and player.valid and unit then

        destroyDialog(player, unit)

        local text = GetRandomMsg()
        local position = unit.position
        position.y = position.y + 2000

        -- /c game.player.surface.create_entity({name="compi-speech-bubble",source = game.player, position=game.player.position, text="Hello, world!"})
        local dialog = player.surface.create_entity({ name = "compi-speech-bubble",
                                                      position = position,
                                                      source = unit,
                                                      text = text })
        global.girlfriends_dialog[player.name] = dialog

    end
end

function destroyDialog(player, girlfriend)
    if player and player.valid and girlfriend then
        local dialog = global.girlfriends_dialog[player.name]
        if dialog then
            dialog.destroy()
        end
    end
end

local function random_condom(player)
    if player and player.valid and player.character then
        local items = {
            "condom",
            "vibrator",
            "vibrator2",
            "vibrator3",
            "vibrator4",
        }
        for k, item in pairs(items) do

            if get_random_call(0.1) then
                --插入一些东西
                player.insert({ name = item, count = 1 })
            end
        end
    end
end

-- msg.die-
-- msg.player-die-
-- msg.msg-
-- msg.rocket-
function GetRandomMsg(prefix, max)
    prefix = prefix or "msg.msg-"
    max = max or maxMsg

    local seq = math.random(1, max)
    local text = { prefix .. seq }
    return text
end

-- 10 - 60 s
function GetNextTime(tick)
    local seq = math.random(1, 6)
    seq = seq * 10 * 60 + tick
    return seq
end



-- Simple function to get distance between two positions.
function getDistance(posA, posB)
    -- Get the length for each of the components x and y
    local xDist = posB.x - posA.x
    local yDist = posB.y - posA.y

    return math.sqrt((xDist ^ 2) + (yDist ^ 2))
end

script.on_nth_tick(60, function(event)

    for k, player in pairs(game.players) do
        if (player and player.valid and player.character) then
            tick = event.tick
            check_girl(player)

            local girl = global.girlfriends[player.name]

            local distance = getDistance(girl.position, player.position)

            local follow_player_distance = get_runtime_user_setting(player, "girlfriend_distance")
            follow_player_distance = tonumber(follow_player_distance)
            if distance > follow_player_distance then
                follow_player_safely(girl, player)
            end

        end
    end
end)

script.on_nth_tick(600, function(event)

    local tick = event.tick
    for k, player in pairs(game.players) do
        if (player and player.valid and player.character) then
            check_girl(player)
            random_condom(player)

            local girl = global.girlfriends[player.name]
            local nextTick = global.girl_next_dialog_time[player.name]
            if not nextTick then
                drawDialog(player, girl)
                global.girl_next_dialog_time[player.name] = GetNextTime(tick)
            elseif (nextTick <= tick) then
                drawDialog(player, girl)
                global.girl_next_dialog_time[player.name] = GetNextTime(tick)
            end
        end
    end
end)

local function on_player_joined_game (event)
    local player = game.players[event.player_index]
    if (player and player.valid and player.character) then

        local msg = { "welcome" }

        if msg then
            player.print(msg)
        end
        local msg2 = { "welcome2" }

        if msg then
            player.print(msg2)
        end

        check_girl(player)
    end

end

local function on_player_left_game (event)
    local player = game.players[event.player_index]
    if (player and player.valid) then
        local girl = global.girlfriends[player.name]
        if girl and girl.valid then
            girl.destroy()
            log("==玩家离开了：" .. player.name)
        end
    end

end

local function on_rocket_launched (event)
    log("=====================================火箭发射 on_rocket_launched==============================================")

    --debugtool.infoless((event.rocket))
    --debugtool.infoless((event.rocket.last_user))
    --debugtool.infoless((event.rocket_silo))
    --debugtool.infoless((event.rocket_silo.last_user))
    local player = event.rocket_silo.last_user

    if (player and player.valid and player.character) then
        local tick = event.tick
        check_girl(player)

        local girl = global.girlfriends[player.name]

        if global.rocket_launched[player.name] then
            if math.random(1, 10) == 5 then
                --  已经说过了  小概率触发
                drawDialog(player, girl, GetRandomMsg("msg.rocket-", 10))
                global.girl_next_dialog_time[player.name] = GetNextTime(tick)
            end
        else
            drawDialog(player, girl, GetRandomMsg("msg.rocket-", 10))
            global.girl_next_dialog_time[player.name] = GetNextTime(tick)

            global.rocket_launched[player.name] = true
        end


    end

end

local function on_player_died (event)
    log("=====================================玩家死亡 on_player_died==============================================")

    --debugtool.infoless(event.player_index)
    local player = game.players[event.player_index]
    if (player and player.valid) then
        local tick = event.tick
        check_girl(player)
        local girl = global.girlfriends[player.name]
        drawDialog(player, girl, GetRandomMsg("msg.player-die-", 10))
        global.girl_next_dialog_time[player.name] = GetNextTime(tick)
    end
    debugtool.infoless(event.cause)

end

local function on_entity_died(event)
    getAllGirl()
    local prototype = event.prototype.name
    local unit_number = event.unit_number
    local corpses = event.corpses
    local position = event.position
    local surface_index = event.surface_index

    --@see getAllGirl()
    if global.girl_list then
        for k, girl in pairs(global.girl_list) do
            if girl.entity == prototype then
                log("===================================== 女朋友亡语 ==============================================")
                local pink2 = { r = 1, g = 179 / 255, b = 230 / 255, a = 1 }

                if prototype == "girlfriend-compilatron" then

                    rendering.draw_text {
                        text = GetRandomMsg("msg.die-", 30),
                        surface = game.surfaces[surface_index],
                        target = position,
                        target_offset = { 0, -4 },
                        color = pink2,
                        scale = 1,
                        time_to_live = 60 * 60,
                        alignment = "center"
                        -- Allowed fonts: default-dialog-button default-game compilatron-message-font default-large default-large-semibold default-large-bold heading-1 compi
                        --font = "compi",
                    }
                else
                    -- 死亡气泡
                    if corpses[1] then
                        game.surfaces[surface_index].create_entity({ name = "compi-speech-bubble",
                                                                     position = position,
                                                                     source = corpses[1],
                                                                     text = GetRandomMsg("msg.die-", 30) })
                    end
                end

            end
        end
    end

    --if event.entity.name == girl_entity then
    --
    --    debugtool.infoless((event.entity))
    --    --debugtool.infoless((event.loot.index))
    --    --debugtool.infoless((event.loot.entity_owner))
    --    --debugtool.infoless((event.loot.player_owner))
    --
    --    debugtool.infoless(event.entity.position)
    --
    --
    --    --local dialog = event.entity.surface.create_entity({ name = "compi-speech-bubble",
    --    --                                                    position = event.entity.position,
    --    --                                                    source = text_obj,
    --    --                                                    text = GetRandomMsg("msg.die-", 10) })
    --end

end

local function on_research_finished (event)

    debugtool.infoless((event.research))
    log((event.by_script))

    if not event.by_script then
        log("===================================== on_research_finished ==============================================")
        if event.research.upgrade then
            --   this an upgrade-type research

        else
            --科技名称
            local name = event.research.name
            local force = event.research.force
            local players = force.players

            local tick = event.tick
            for k, player in pairs(players) do
                if (player and player.valid and player.character) then
                    check_girl(player)

                    local girl = global.girlfriends[player.name]
                    drawDialog(player, girl, GetRandomMsg("msg.research-", 10))
                    global.girl_next_dialog_time[player.name] = GetNextTime(tick)
                end
            end
        end
    end
end




-- 检查女朋友状态 如果死了就重新找一个
function check_girl(player)
    if not global.girlfriends[player.name] then
        local girl = create_girl(player)
        global.girlfriends[player.name] = girl
    elseif not global.girlfriends[player.name].valid then
        local girl = create_girl(player)
        global.girlfriends[player.name] = girl
    end

end

---create_girl 创建女朋友
---@param player
function create_girl(player)
    local position = player.position
    local surface = player.surface

    position = surface.find_non_colliding_position("character", position, 100, 0.5, false)

    if position then
        local girl_name = global.player_chosen_girlfriend[player.name]
        if not girl_name then
            global.player_chosen_girlfriend[player.name] = girl_entity
            girl_name = girl_entity
        end

        local girl = player.surface.create_entity({ name = girl_name, position = position, force = player.force })
        drawName(player, girl)

        --game.print(girl.unit_number)

        return girl
    else
        player.print("女朋友：你周围没有位置了，我挤不过来！")

    end

    return nil

end

function config_global()
    global.girlfriends = global.girlfriends or {}

    global.player_chosen_girlfriend = global.player_chosen_girlfriend or {}
    global.rocket_launched = global.rocket_launched or {}
    global.girlfriends_dialog = global.girlfriends_dialog or {}
    global.girl_next_dialog_time = global.girl_next_dialog_time or {}

end

script.on_init(function()
    config_global()

    for _, player in pairs(game.players) do
        if player and player.valid then
            show_gui(player)
        end
    end
end)

script.on_configuration_changed(function()
    config_global()
end)

local function on_built_entity(event)
    local entity = event.created_entity
    local tick = event.tick
    local player = game.players[event.player_index]
    if not (player and player.valid
            and entity
            and entity.valid
            and entity.rotatable) then
        return
    end
    local girlfriend_trouble = get_runtime_setting("girlfriend_trouble")
    local girlfriend_trouble_user = get_runtime_user_setting(player, "girlfriend_trouble_user")

    if not (girlfriend_trouble and girlfriend_trouble_user) then
        return
    end

    if not (get_random_call(0.1)) then
        return
    end

    local girl = global.girlfriends[player.name]
    if not (girl and girl.valid) then
        return
    end
    local distance = getDistance(girl.position, player.position)

    if distance > 20 then
        return
    end

    local rotatas = {
        "pipe-to-ground",
        "underground-belt",
        "inserter",
        "splitter",
        "storage-tank",
        "mining-drill",
        "loader",
        "loader-1x1",
        "transport-belt"
    }

    for k, type in pairs(rotatas) do

        if (entity.prototype.type == type) then
            if entity.rotatable then
                local pink2 = { r = 1, g = 179 / 255, b = 230 / 255, a = 1 }

                rendering.draw_line({
                    color = pink2,
                    width = 4,
                    gap_length = 0.2,
                    dash_length = 0.2,
                    from = girl,
                    to = entity,
                    surface = entity.surface,
                    time_to_live = 90,
                    draw_on_ground = false,
                })
                --light_small  light_medium  light_cone
                rendering.draw_light({ sprite = "utility/light_small",
                                       orientation = 0,
                                       scale = 1,
                                       intensity = 1,
                                       minimum_darkness = 0,
                                       oriented = true,
                                       color = pink2,
                                       target = entity,
                                       surface = entity.surface,
                                       time_to_live = 90 })
                -- 随机旋转
                for i = 1, math.random(1, 3) do
                    entity.rotate()
                end
            end

            break
        end

    end



    --if entity and entity.valid and entity.name == "entity-ghost"
    --        and start_with(entity.ghost_name, "miku-") then
    --end
end

script.on_event(defines.events.on_player_joined_game, on_player_joined_game)
script.on_event(defines.events.on_player_died, on_player_died)
script.on_event(defines.events.on_post_entity_died, on_entity_died, { { filter = "type", type = "unit" } })
script.on_event(defines.events.on_rocket_launched, on_rocket_launched)
script.on_event(defines.events.on_research_finished, on_research_finished)
script.on_event(defines.events.on_player_left_game, on_player_left_game)
script.on_event(defines.events.on_built_entity, on_built_entity)
