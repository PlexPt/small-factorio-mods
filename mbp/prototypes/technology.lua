data:extend(
        {

            { type = "technology",
              name = "mbp",
              icon_size = 400,
              icon = "__mbp-pro__/graphics/icon.png",
              effects = {
                  {
                      type = "unlock-recipe",
                      recipe = "mbp"
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













