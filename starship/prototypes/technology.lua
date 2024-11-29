local starship_technology = table.deepcopy(data.raw["technology"]["rocket-silo"])
starship_technology.name = "starship-technology"
starship_technology.effects = { { type = "unlock-recipe", recipe = "starship-silo-recipe" } }
data:extend { starship_technology }

