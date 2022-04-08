local data_util=require("data-util")

data_util.change_results("se-cold-thermodynamics-data", {"se-contaminated-scrap"}, {{"se-scrap", 8}, {type = "fluid", name = "se-contaminated-space-water", amount = 2}})

data.raw["assembling-machine"]["se-space-thermodynamics-laboratory"].crafting_categories = {"space-thermodynamics", "smelting", "space-plasma"}
