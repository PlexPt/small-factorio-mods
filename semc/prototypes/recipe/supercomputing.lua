local data_util=require("data-util")
local rcp = {}

-- Data Fromatting
  data_util.change_ingredients("se-formatting-1", {"se-space-coolant-cold"}, {{type = "fluid", name = "se-space-coolant-warm", amount = 1}})
  data_util.change_results("se-formatting-1", nil, {
    {name = "se-empty-data", amount_min = 1, amount_max = 1, probability = 0.999},
    {name = "se-broken-data", amount_min = 1, amount_max = 1, probability = 0.001},
  })
  data.raw.recipe["se-formatting-1"].energy_required = 8

-- Efficient Data frommatting
  data_util.change_ingredients("se-formatting-2", {"se-space-coolant-supercooled"}, {{type = "fluid", name = "se-space-coolant-cold", amount = 1}})
  data_util.change_results("se-formatting-2", nil, {
    {name = "se-empty-data", amount_min = 1, amount_max = 1, probability = 0.999},
    {name = "se-broken-data", amount_min = 1, amount_max = 1, probability = 0.001},
  })

-- Advanced data formatting
  data_util.change_results("se-formatting-3", nil, {
    {name = "se-empty-data", amount_min = 1, amount_max = 1, probability = 0.999},
    {name = "se-broken-data", amount_min = 1, amount_max = 1, probability = 0.001},
  })
  data.raw.recipe["se-formatting-3"].energy_required = 2

-- Deep data formatting
  data_util.change_results("se-formatting-4", nil, {
    {name = "se-empty-data", amount_min = 1, amount_max = 1, probability = 0.999},
    {name = "se-broken-data", amount_min = 1, amount_max = 1, probability = 0.001},
  })
  data.raw.recipe["se-formatting-4"].energy_required = 1
