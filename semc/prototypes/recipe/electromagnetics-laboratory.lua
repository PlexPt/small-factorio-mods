local data_util=require("data-util")

data_util.change_ingredients("se-naquium-energy-data", {"se-naquium-ingot"}, {{"se-naquium-plate", 4}})

data_util.change_results("se-superconductive-cable", {"se-space-coolant-warm"}, {{type = "fluid", name = "se-space-coolant-hot", amount = 10}})
