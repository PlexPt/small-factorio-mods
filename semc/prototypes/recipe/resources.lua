local data_util=require("data-util")
local rcp = {}

-- Vulcanite
data.raw.recipe["se-vulcanite-block"].ingredients = {
  {"se-vulcanite", 1},
}


-- Cryonite
data.raw.recipe["se-cryonite-rod"].ingredients = {
  {"se-cryonite", 1},
}


-- Berylium
rcp = data.raw.recipe["se-beryllium-plate"]
rcp.category = "smelting" -- crafting
rcp.ingredients = {
  {"se-beryllium-ore", 4},
  {"se-cryonite-rod", 1},
}


-- Holmium
rcp = data.raw.recipe["se-holmium-plate"]
rcp.category = "smelting" -- crafting
rcp.ingredients = {
  {"se-holmium-ore", 4},
  {"se-vulcanite-block", 1},
}


-- Iridium
rcp = data.raw.recipe["se-iridium-plate"]
rcp.category = "smelting" -- crafting
rcp.ingredients = {
  {"se-iridium-ore", 4},
  {"se-vulcanite-block", 1},
  {"se-cryonite-rod", 1},
}


-- Naquium
rcp = data.raw.recipe["se-naquium-plate"]
rcp.category = "smelting" -- "crafting"
rcp.ingredients = {
  {"se-naquium-ore", 4},
  {"se-vulcanite-block", 1},
  {"se-vitalic-acid", 1},
}
rcp.energy_required = 20


-- Vitamelange
rcp = data.raw.recipe["se-vitamelange-spice"]
rcp.category = "smelting" -- "crafting"
rcp.ingredients = {
  {"se-vitamelange", 4},
  {"se-vulcanite-block", 1},
}
rcp.results = {
  {"se-vitamelange-spice", 4},
}
rcp.energy_required = 20

--[[ remove ingredients
  naquium ingot (naquium structural data, naquium energy data)
  vitamelange nugget (biosludge from vitamelange)
]]
