data:extend(
        {

            { type = "technology",
              name = "universal-machine",
              icon_size = 256,
              icon = "__base__/graphics/technology/automation-3.png",
              effects = {
                  {
                      type = "unlock-recipe",
                      recipe = "universal-machine"
                  },

              },
              prerequisites = { "automation" },
              unit = {
                  count = 100,
                  ingredients = {
                      { "automation-science-pack", 1 },
                      { "logistic-science-pack", 1 },
                  },
                  time = 30
              },
            },

        })













