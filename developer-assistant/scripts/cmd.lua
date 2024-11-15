commands.add_command("pt", "Print the contents of a Lua table", function(command)
    local player = game.players[command.player_index];
    if player then
        if (command.parameter) then
            local ok, data = pcall(function()
                return loadstring("return " .. command.parameter)()
            end)
            if ok then
                player.print(serpent.block(data))
            else
                player.print(serpent.block(data))
            end
        else
            player.print("usage pt table_name")
        end
    end
end)

