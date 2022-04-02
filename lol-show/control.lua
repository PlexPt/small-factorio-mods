if script.active_mods["gvv"] then
    require("__gvv__.gvv")()
end

script.on_event("LOL7",
        function(event)
            local player = game.players[event.player_index]
            if (player.character) then
                rendering.draw_animation {
                    animation = "lol7",
                    target = player.character,
                    target_offset = { 0, -3 },
                    surface = player.surface,
                    animation_offset = 5,
                    time_to_live = 600 }
            end

        end)
