local data_util=require("data-util")
local rcp = {}

-- Biomass
data.raw.recipe["se-specimen"].ingredients = {
  {"se-genetic-data", 1},
  {"se-vitamelange-spice", 5},
  {"iron-plate", 2},
  {"glass", 2},
  {type = "fluid", name = "se-bio-sludge", amount = 50},
  {type = "fluid", name = "se-nutrient-gel", amount = 200},
}
data_util.change_results("se-specimen", nil, {{"se-junk-data", 1}})


-- Experimental Biomass
  data.raw.recipe["se-experimental-specimen"].ingredients = {
    {"se-experimental-genetic-data", 10},
    {"se-vitamelange-spice", 20},
    {"iron-plate", 2},
    {"glass", 2},
    {type = "fluid", name = "se-bio-sludge", amount = 100},
    {type = "fluid", name = "se-nutrient-gel", amount = 200},
  }
  data_util.change_results("se-experimental-specimen", nil, {{"se-junk-data", 10}})


-- Fish Growth
  data.raw.recipe["se-specimen-fish"].ingredients = {
    {"se-genetic-data", 1},
    {"se-vitamelange-spice", 5},
    {type = "fluid", name = "se-nutrient-gel", amount = 200},
    {type = "fluid", name = "se-bio-sludge", amount = 50},
  }
  data_util.change_results("se-specimen-fish", nil, {{"se-junk-data", 1}})


-- Wood Growth
  data.raw.recipe["se-specimen-wood"].ingredients = {
    {"se-genetic-data", 1},
    {"se-vitamelange-spice", 5},
    {type = "fluid", name = "se-nutrient-gel", amount = 200},
    {type = "fluid", name = "se-bio-sludge", amount = 50},
  }
  data_util.change_results("se-specimen-wood", nil, {{"se-junk-data", 1}})

data.raw["assembling-machine"]["se-space-growth-facility"].crafting_categories = {"no-category"}
