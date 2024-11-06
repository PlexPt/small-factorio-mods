data:extend(
        {

            { type = "technology",
              name = "universal-machine",
              icon = "__universal-machine__/graphics/icon.png",
              icon_size = 144,
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













