local result = {}
local function test ()


    local entity = create_my_entity(player)
    storage.myentitys[player.name] = entity

    local entity = storage.myentitys[player.name]

    if not entity then
        game.print("entity nil")
    end

end
