

local starship_silo_recipe = table.deepcopy(data.raw["recipe"]["rocket-silo"])
starship_silo_recipe.name = "starship-silo-recipe"

starship_silo_recipe.results = {{type = "item", name = "starship-silo-item", amount = 1}}

data:extend{starship_silo_recipe}
