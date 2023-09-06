script.on_event(defines.events.on_player_joined_game, function(event)

    local player = game.players[event.player_index]
    if player then

        local msg = "在线MOD开发平台，请访问 https://mod.plexpt.com/"

        if msg then
            player.print(msg)
        end
    end

end)





