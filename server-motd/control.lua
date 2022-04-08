script.on_event(defines.events.on_player_joined_game, function(event)

    local player = game.players[event.player_index]
    if player then

        local msg = settings.global["motd-player-join-message"].value;

        if msg then
            player.print(msg)
        end
    end

end)





