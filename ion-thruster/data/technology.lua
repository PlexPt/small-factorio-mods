
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
}
