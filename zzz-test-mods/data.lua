local flying = table.deepcopy(data.raw["unit"]["behemoth-biter"])

flying.name = "flying-biter"

--flying.collision_box = { { 0, 0 }, { 0, 0 } }
flying.collision_mask = {}

data:extend({
    flying,
})




--or { "player-layer", "train-layer", "not-colliding-with-itself" }
