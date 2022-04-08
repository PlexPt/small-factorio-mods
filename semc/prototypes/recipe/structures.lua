local data_util=require("data-util")

data_util.change_ingredients("se-space-telescope-xray", {"se-aeroframe-pole"}, {{"se-beryllium-plate", 30}})
data_util.change_ingredients("se-space-particle-collider", {"se-holmium-cable"}, {{"se-holmium-plate", 200}})
data_util.change_ingredients("se-space-genetics-laboratory", {"se-nutrient-vat"}, {{type = "fluid", name = "se-nutrient-gel", amount = 200}})
