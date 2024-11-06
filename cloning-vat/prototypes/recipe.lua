-- prototypes/recipe.lua

data:extend({
    {
        type = "recipe",
        name = "thermal-cloning-vat",
        ingredients = {
            { type = "item", name = "stone", amount = 10 },

        },
        results = {
            { type = "item", name = "thermal-cloning-vat", amount = 1, probability = 0.9 },
        }
    },
    {
        type = "recipe",
        name = "electric-cloning-vat",
        ingredients = {
            { type = "item", name = "iron-plate", amount = 50 },
        },
        results = {
            { type = "item", name = "electric-cloning-vat", amount = 1, probability = 0.9 },
        }
    }
})
