-- 自动创建的物品
local baseIconPath = "__cloning-vat__/graphics/icons/"


ITEM {
    type = "item",
    name = "thermal-cloning-vat",
    icon = baseIconPath ..  "thermal-cloning-vat.png",
    icon_size = 500,
    subgroup = "smelting-machine",
    order = "aaa",
    stack_size = 100,
    place_result = "thermal-cloning-vat",
}


ITEM {
    type = "item",
    name = "electric-cloning-vat",
    icon = baseIconPath ..  "electric-cloning-vat.png",
    icon_size = 500,
    order = "aab",
    subgroup = "smelting-machine",
    stack_size = 100,
    place_result = "electric-cloning-vat",
}
