data:extend(
        {

            { type = "recipe",
              name = "universal-machine",
              enabled = false,
              energy_required = 10,
              ingredients = {
                  { "assembling-machine-1", 32 },
                  { "iron-plate", 100 },
                  { "steel-plate", 100 },
                  { "electronic-circuit", 150 },
              },
              result = "universal-machine",
              result_count = 1,
            },
            {
                type = "recipe",
                name = "double-iron-plate",
                icon = "__universal-machine__/graphics/double-iron-plate.png",
                icon_size = 32,
                ingredients = { { "iron-ore", 12 } },
                result = "iron-plate",
                result_count = 8
            },
            {
                type = "recipe",
                name = "double-copper-plate",
                icon = "__universal-machine__/graphics/double-copper-plate.png",
                icon_size = 32,
                ingredients = { { "copper-ore", 12 } },
                result = "copper-plate",
                result_count = 8
            },
            {
                type = "recipe",
                name = "iron-plate",
                category = "smelting",
                energy_required = 6.4,
                ingredients = { { "iron-ore", 1 } },
                result = "iron-plate",
                result_count = 1
            },
            {
                type = "recipe",
                name = "copper-plate",
                category = "smelting",
                energy_required = 6.4,
                ingredients = { { "copper-ore", 1 } },
                result = "copper-plate",
                result_count = 1
            },
            --
        })
