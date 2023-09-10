--修改炼油厂2配方
--    type = "recipe",
--    name = "advanced-oil-processing",

local r1 = data.raw["recipe"]["advanced-oil-processing"]

if r1.ingredients[1].name == "water" then
    r1.ingredients[1] = { type = "item", name = "water-barrel", amount = 1 }
end


local r2 = data.raw["recipe"]["coal-liquefaction"]

if r2.ingredients[3].name == "steam" then
    r2.ingredients[3] = { type = "item", name = "steam-barrel", amount = 1 }
end

local r3 = data.raw["recipe"]["basic-oil-processing"]
r3.ingredients[1].fluidbox_index = nil
r3.results[1].fluidbox_index = nil
