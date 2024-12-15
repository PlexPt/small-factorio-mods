local recipe = {
    type = "recipe",
    name = "ion-thruster",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "electric-engine-unit", amount = 10 },
        { type = "item", name = "steel-plate", amount = 50 },
        { type = "item", name = "pipe", amount = 50 },
        { type = "item", name = "iron-gear-wheel", amount = 50 },
        { type = "item", name = "copper-cable", amount = 1000 },
        { type = "item", name = "iron-stick", amount = 50 },
        { type = "item", name = "storage-tank", amount = 2 }
    },
    results = { { type = "item", name = "ion-thruster", amount = 1 } }
}
local recipe_xenon = {
    type = "recipe",
    name = "xenon",
    enabled = false,
    energy_required = 3,
    category = "ion-thruster",
    ingredients = {
    },
    results = { { type = "fluid", name = "xenon", amount = 1 } }
}

data:extend { recipe, recipe_xenon }
