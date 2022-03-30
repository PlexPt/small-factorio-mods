require("lib.animation_util")

data:extend({

    {
        type = "explosion",
        name = "atsword_majesty-explosion",
        localised_name = { "entity-name.massive-explosion" },
        icon = "__base__/graphics/item-group/effects.png",
        icon_size = 64,
        flags = { "not-on-map", "hidden" },
        subgroup = "explosions",
        animations = getStripesAnimation("atsword_majesty/", 30, 1067, 489),
    },

})
