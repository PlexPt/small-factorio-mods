local result = {}
local function test ()


    local entity = create_my_entity(player)
    global.myentitys[player.name] = entity

    local entity = global.myentitys[player.name]

    if not entity then
        game.print("entity nil")
    end

end
