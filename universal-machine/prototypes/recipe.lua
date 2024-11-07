data:extend({

    { type = "recipe",
      name = "universal-machine",
      icon = "__universal-machine__/graphics/icon.png",
      icon_size = 144,
      enabled = false,
      energy_required = 10,
      ingredients = {
          { type = "item", name = "assembling-machine-1", amount = 32 },
          { type = "item", name = "iron-plate", amount = 100 },
          { type = "item", name = "steel-plate", amount = 100 },
          { type = "item", name = "electronic-circuit", amount = 150 },
      },
      results = { { type = "item", name = "universal-machine", amount = 1 } }
    },
    {
        type = "recipe",
        name = "double-iron-plate",
        icon = "__universal-machine__/graphics/double-iron-plate.png",
        icon_size = 32,
        ingredients = { { type = "item", name = "iron-ore", amount = 10 } },
        results = { { type = "item", name = "iron-plate", amount = 5 } }
    },
    {
        type = "recipe",
        name = "double-copper-plate",
        icon = "__universal-machine__/graphics/double-copper-plate.png",
        icon_size = 32,
        ingredients = { { type = "item", name = "copper-ore", amount = 10 } },
        results = { { type = "item", name = "copper-plate", amount = 5 } }
    },
})
