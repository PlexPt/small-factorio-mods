local flying = table.deepcopy(data.raw["unit"]["behemoth-biter"])

flying.name = "flying-biter"

--flying.collision_box = { { 0, 0 }, { 0, 0 } }
flying.collision_mask = {}

data:extend({
    flying,
})

local phoenix = table.deepcopy(data.raw["unit"]["behemoth-spitter"])

phoenix.name = "phoenix-biter"
phoenix.localised_name = { "phoenix-biter" }

--.collision_box = { { 0, 0 }, { 0, 0 } }
phoenix.collision_mask = {}

phoenix.attack_parameters.ammo_category = "flamethrower"
phoenix.attack_parameters.cooldown = 1
phoenix.attack_parameters.movement_slow_down_factor = 0.4
phoenix.attack_parameters.ammo_type = {
    category = "flamethrower",
    action = {
        type = "direct",
        action_delivery = {
            type = "stream",
            stream = "flamethrower-fire-stream",
            --source_offset = { 0.15, -0.5 }
        }
    }
}

data:extend({
    phoenix,
})


--local phoenix = data.raw["unit"]["big-spitter"]
--
--if phoenix then
--    phoenix.attack_parameters.ammo_category = "flamethrower"
--    phoenix.attack_parameters.cooldown = 1
--    phoenix.attack_parameters.movement_slow_down_factor = 0.4
--    phoenix.attack_parameters.ammo_type =   {
--        category = "flamethrower",
--        action =
--        {
--            type = "direct",
--            action_delivery =
--            {
--                type = "stream",
--                stream = "flamethrower-fire-stream",
--                source_offset = {0.15, -0.5}
--            }
--        }
--    }
--end




--or { "player-layer", "train-layer", "not-colliding-with-itself" }
