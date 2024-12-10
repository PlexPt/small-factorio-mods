require("entity")

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

local ionthruster_item = table.deepcopy(data.raw.item["thruster"])
ionthruster_item.name = "ion-thruster"
ionthruster_item.place_result = "ion-thruster"
ionthruster_item.order = "z[thruster]"
ionthruster_item.subgroup = "space-platform"
ionthruster_item.icon = "__ion-thruster__/graphics/icon.png"
ionthruster_item.icon_size = 512

data:extend { ionthruster_item, recipe, recipe_xenon }

data:extend {
    {
        type = "technology",
        name = "ion-thruster",
        icon = "__ion-thruster__/graphics/icon.png",
        icon_size = 512,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ion-thruster"
            }
        },
        prerequisites = { "space-platform-thruster" },
        unit = {
            count = 2000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
                { "production-science-pack", 1 },
                { "utility-science-pack", 1 },
                { "space-science-pack", 1 }
            },
            time = 60
        }
    },
    {
        type = "fluid",
        name = "xenon",
        icon = "__ion-thruster__/graphics/neon.png",
        icon_size = 512,
        subgroup = "fluid",
        order = "b[new-fluid]-a[space]-a[neon-fuel]",
        default_temperature = 25,
        fuel_value = "10kJ",
        base_color = { 0.53, 0.1, 0 },
        flow_color = { 0.93, 0.68, 0.2 },
        auto_barrel = false
    },
}
