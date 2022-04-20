script.on_event(defines.events.on_player_joined_game, function(event)

    local player = game.players[event.player_index]
    if player then
        player.print("欢迎!" .. player.name)

        local msg = settings.global["lovewall-player-join-message"].value;

        if msg then
            player.print(msg)
        end
    end

end)





