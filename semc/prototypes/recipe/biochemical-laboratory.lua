local data_util=require("data-util")

data_util.change_ingredients("se-bio-sludge-from-vitamelange", {"se-vitamelange-nugget"}, {{"se-vitamelange", 20}})

data.raw["assembling-machine"]["se-space-biochemical-laboratory"].crafting_categories = {"space-biochemical", "space-growth", "oil-processing"}
