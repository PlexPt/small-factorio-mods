require("fruit")
require("vegetable")
require("animal_products")

data:extend(
        {
            {
                type = "item-group",
                name = "fruit",
                icon =   "thumbnail.png",
                icon_size = 1024,

            }
        }
)

data:extend({
    {
        type = "item-subgroup",
        name = "fruit",
        group = "fruit",
        order = "fruit"
    },
    {
        type = "item-subgroup",
        name = "vegetable",
        group = "fruit",
        order = "vegetable"
    },
    {
        type = "item-subgroup",
        name = "animal_products",
        group = "fruit",
        order = "animal_products"
    },
})
