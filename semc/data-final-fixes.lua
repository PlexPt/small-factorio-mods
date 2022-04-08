require("prototypes.recipe.final-recipe")
require("prototypes.technology")
require("prototypes.misc")
require("prototypes.final-other")

if (settings.startup["allow-on-land"].value) then
    require("script.space-on-land")
end
