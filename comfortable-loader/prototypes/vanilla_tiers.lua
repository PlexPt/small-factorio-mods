-- tier 1
deadlock.add_tier({
    transport_belt = "transport-belt",
    loader = "comfortable-loader",
    colour = { r = 210, g = 180, b = 80 },
    underground_belt = "underground-belt",
    splitter = "splitter",
    technology = "logistics",
    order = "a",
    loader_ingredients = {
        { type = "item", name = "transport-belt", amount = 1 },
        { type = "item", name = "iron-plate", amount = 5 },
    },
})
if data.raw["loader-1x1"]["comfortable-loader"] then
    data.raw["loader-1x1"]["comfortable-loader"].next_upgrade = "fast-comfortable-loader"
end

-- tier 2
deadlock.add_tier({
    transport_belt = "fast-transport-belt",
    loader = "fast-comfortable-loader",
    colour = { r = 210, g = 60, b = 60 },
    underground_belt = "fast-underground-belt",
    splitter = "fast-splitter",
    technology = "logistics-2",
    order = "b",
    loader_ingredients = {
        { type = "item", name = "comfortable-loader", amount = 1 },
        { type = "item", name = "iron-gear-wheel", amount = 20 },
    },
})
if data.raw.technology["deadlock-stacking-2"] then
    table.insert(data.raw.technology["deadlock-stacking-2"].prerequisites, "deadlock-stacking-1")
end
if data.raw["loader-1x1"]["fast-comfortable-loader"] then
    data.raw["loader-1x1"]["fast-comfortable-loader"].next_upgrade = "express-comfortable-loader"
end

-- tier 3
deadlock.add_tier({
    transport_belt = "express-transport-belt",
    loader = "express-comfortable-loader",

    colour = { r = 80, g = 180, b = 210 },
    underground_belt = "express-underground-belt",
    splitter = "express-splitter",
    technology = "logistics-3",
    order = "c",
    loader_ingredients = {
        { type = "item", name = "fast-comfortable-loader", amount = 1 },
        { type = "item", name = "iron-gear-wheel", amount = 40 },
        { name = "lubricant", type = "fluid", amount = 20 },
    },
    loader_category = "crafting-with-fluid",
})
if data.raw.technology["deadlock-stacking-3"] then
    table.insert(data.raw.technology["deadlock-stacking-3"].prerequisites, "deadlock-stacking-2")
end
