require("fruit")
require("vegetable")
require("animal_products")

data:extend(
        {
            {
                type = "item-group",
                name = "fruit",
                icon =   "__fruit__/graphics/group.png",
                icon_size = 512,

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
