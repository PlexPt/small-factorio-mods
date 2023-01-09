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
            girl.set_command({
                type = defines.command.go_to_location,
                destination = position,
                --destination_entity = player,
                radius = 1,
                distraction = defines.distraction.none
            })
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
        girlfriendsDialog[player.name] = dialog

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
        girlfriendsDialog[player.name] = dialog

    end
end

function destroyDialog(player, girlfriend)
    if player and player.valid and girlfriend then
        local dialog = girlfriendsDialog[player.name]
        if dialog then
            dialog.destroy()
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

            local girl = girlfriends[player.name]

            local distance = getDistance(girl.position, player.position)
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

            local girl = girlfriends[player.name]
            local nextTick = NextTime[player.name]
            if not nextTick then
                drawDialog(player, girl)
                NextTime[player.name] = GetNextTime(tick)
            elseif (nextTick <= tick) then
                drawDialog(player, girl)
                NextTime[player.name] = GetNextTime(tick)
            end
        end
    end
end)

local function on_player_joined_game (event)
    local player = game.players[event.player_index]
    if (player and player.valid and player.character) then

        local msg = ""

        if msg then
            player.print(msg)
        end

        check_girl(player)
    end

end
local function on_rocket_launched (event)
    log("=====================================火箭发射 on_rocket_launched==============================================")

    --debugtool.infoless((event.rocket))
    --debugtool.infoless((event.rocket.last_user))
    debugtool.infoless((event.rocket_silo))
    debugtool.infoless((event.rocket_silo.last_user))
    local player = event.rocket_silo.last_user

    if (player and player.valid and player.character) then
        local tick = event.tick
        check_girl(player)

        local girl = girlfriends[player.name]

        if RocketLaunched[player.name] then
            if math.random(1, 10) == 5 then
                --  已经说过了  小概率触发
                drawDialog(player, girl, GetRandomMsg("msg.rocket-", 10))
                NextTime[player.name] = GetNextTime(tick)
            end
        else
            drawDialog(player, girl, GetRandomMsg("msg.rocket-", 10))
            NextTime[player.name] = GetNextTime(tick)

            RocketLaunched[player.name] = true
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
        local girl = girlfriends[player.name]
        drawDialog(player, girl, GetRandomMsg("msg.player-die-", 10))
        NextTime[player.name] = GetNextTime(tick)
    end
    debugtool.infoless(event.cause)

end

local function on_entity_died(event)
    getAllGirl()

    --@see getAllGirl()
    if global.girl_list then
        for k, girl in pairs(global.girl_list) do
            if girl.entity == event.entity.name then
                log("===================================== 女朋友亡语 ==============================================")
                local pink2 = { r = 1, g = 179 / 255, b = 230 / 255, a = 1 }

                local text_obj = rendering.draw_text {
                    text = GetRandomMsg("msg.die-", 30),
                    surface = event.entity.surface,
                    target = event.entity.position,
                    target_offset = { 0, -4 },
                    color = pink2,
                    scale = 1,
                    time_to_live = 60 * 60,
                    alignment = "center"
                    -- Allowed fonts: default-dialog-button default-game compilatron-message-font default-large default-large-semibold default-large-bold heading-1 compi
                    --font = "compi",
                }

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

                    local girl = girlfriends[player.name]
                    drawDialog(player, girl, GetRandomMsg("msg.research-", 10))
                    NextTime[player.name] = GetNextTime(tick)
                end
            end
        end
    end

end

script.on_event(defines.events.on_player_joined_game, on_player_joined_game)
script.on_event(defines.events.on_player_died, on_player_died)
script.on_event(defines.events.on_entity_died, on_entity_died)
script.on_event(defines.events.on_rocket_launched, on_rocket_launched)
script.on_event(defines.events.on_research_finished, on_research_finished)



-- 检查女朋友状态 如果死了就重新找一个
function check_girl(player)
    if not girlfriends[player.name] then
        local girl = create_girl(player)
        girlfriends[player.name] = girl
    elseif not girlfriends[player.name].valid then
        local girl = create_girl(player)
        girlfriends[player.name] = girl
    end

end

---create_girl 创建女朋友
---@param player
function create_girl(player)
    local position = player.position
    local surface = player.surface

    position = surface.find_non_colliding_position("character", position, 100, 0.5, false)

    if position then
        local girl_name = global.girl_entity[player.name]
        if not girl_name then
            global.girl_entity[player.name] = girl_entity
            girl_name = girl_entity
        end

        local girl = player.surface.create_entity({ name = girl_name, position = position, force = player.force })
        drawName(player, girl)
        return girl
    else
        player.print("女朋友：你周围没有位置了，我挤不过来！")

    end

    return nil

end

script.on_init(function()


    for _, player in pairs(game.players) do
        if player and player.valid then
            show_gui(player)
        end
    end
end)

