local enable_recipe = settings.startup["fruit-recipe-enable"].value

data:extend({
    {
        type = "item",
        name = "carrot",
        icon = "__fruit__/graphics/vegetable/carrot.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[carrot]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "carrot",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="carrot", amount=1}},
        results = {{type="item", name="carrot", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "cucumber",
        icon = "__fruit__/graphics/vegetable/cucumber.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[cucumber]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "cucumber",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="cucumber", amount=1}},
        results = {{type="item", name="cucumber", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "spinach",
        icon = "__fruit__/graphics/vegetable/spinach.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[spinach]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "spinach",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="spinach", amount=1}},
        results = {{type="item", name="spinach", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "tomato",
        icon = "__fruit__/graphics/vegetable/tomato.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[tomato]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "tomato",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="tomato", amount=1}},
        results = {{type="item", name="tomato", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "broccoli",
        icon = "__fruit__/graphics/vegetable/broccoli.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[broccoli]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "broccoli",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="broccoli", amount=1}},
        results = {{type="item", name="broccoli", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "lettuce",
        icon = "__fruit__/graphics/vegetable/lettuce.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[lettuce]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "lettuce",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="lettuce", amount=1}},
        results = {{type="item", name="lettuce", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "bell_pepper",
        icon = "__fruit__/graphics/vegetable/bell_pepper.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[bell_pepper]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "bell_pepper",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="bell_pepper", amount=1}},
        results = {{type="item", name="bell_pepper", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "zucchini",
        icon = "__fruit__/graphics/vegetable/zucchini.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[zucchini]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "zucchini",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="zucchini", amount=1}},
        results = {{type="item", name="zucchini", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "onion",
        icon = "__fruit__/graphics/vegetable/onion.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[onion]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "onion",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="onion", amount=1}},
        results = {{type="item", name="onion", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "garlic",
        icon = "__fruit__/graphics/vegetable/garlic.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[garlic]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "garlic",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="garlic", amount=1}},
        results = {{type="item", name="garlic", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "pumpkin",
        icon = "__fruit__/graphics/vegetable/pumpkin.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[pumpkin]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "pumpkin",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="pumpkin", amount=1}},
        results = {{type="item", name="pumpkin", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "cabbage",
        icon = "__fruit__/graphics/vegetable/cabbage.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[cabbage]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "cabbage",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="cabbage", amount=1}},
        results = {{type="item", name="cabbage", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "eggplant",
        icon = "__fruit__/graphics/vegetable/eggplant.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[eggplant]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "eggplant",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="eggplant", amount=1}},
        results = {{type="item", name="eggplant", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "potato",
        icon = "__fruit__/graphics/vegetable/potato.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[potato]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "potato",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="potato", amount=1}},
        results = {{type="item", name="potato", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "sweet_potato",
        icon = "__fruit__/graphics/vegetable/sweet_potato.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[sweet_potato]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "sweet_potato",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="sweet_potato", amount=1}},
        results = {{type="item", name="sweet_potato", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "beetroot",
        icon = "__fruit__/graphics/vegetable/beetroot.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[beetroot]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "beetroot",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="beetroot", amount=1}},
        results = {{type="item", name="beetroot", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "asparagus",
        icon = "__fruit__/graphics/vegetable/asparagus.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[asparagus]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "asparagus",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="asparagus", amount=1}},
        results = {{type="item", name="asparagus", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "pea",
        icon = "__fruit__/graphics/vegetable/pea.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[pea]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "pea",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="pea", amount=1}},
        results = {{type="item", name="pea", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "celery",
        icon = "__fruit__/graphics/vegetable/celery.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[celery]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "celery",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="celery", amount=1}},
        results = {{type="item", name="celery", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "artichoke",
        icon = "__fruit__/graphics/vegetable/artichoke.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[artichoke]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "artichoke",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="artichoke", amount=1}},
        results = {{type="item", name="artichoke", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "brussels_sprout",
        icon = "__fruit__/graphics/vegetable/brussels_sprout.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[brussels_sprout]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "brussels_sprout",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="brussels_sprout", amount=1}},
        results = {{type="item", name="brussels_sprout", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "parsnip",
        icon = "__fruit__/graphics/vegetable/parsnip.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[parsnip]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "parsnip",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="parsnip", amount=1}},
        results = {{type="item", name="parsnip", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "leek",
        icon = "__fruit__/graphics/vegetable/leek.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[leek]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "leek",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="leek", amount=1}},
        results = {{type="item", name="leek", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "turnip",
        icon = "__fruit__/graphics/vegetable/turnip.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[turnip]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "turnip",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="turnip", amount=1}},
        results = {{type="item", name="turnip", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "cauliflower",
        icon = "__fruit__/graphics/vegetable/cauliflower.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[cauliflower]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "cauliflower",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="cauliflower", amount=1}},
        results = {{type="item", name="cauliflower", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "okra",
        icon = "__fruit__/graphics/vegetable/okra.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[okra]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "okra",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="okra", amount=1}},
        results = {{type="item", name="okra", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "chicory",
        icon = "__fruit__/graphics/vegetable/chicory.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[chicory]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "chicory",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="chicory", amount=1}},
        results = {{type="item", name="chicory", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "snow_pea",
        icon = "__fruit__/graphics/vegetable/snow_pea.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[snow_pea]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "snow_pea",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="snow_pea", amount=1}},
        results = {{type="item", name="snow_pea", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "collard_greens",
        icon = "__fruit__/graphics/vegetable/collard_greens.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[collard_greens]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "collard_greens",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="collard_greens", amount=1}},
        results = {{type="item", name="collard_greens", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "watercress",
        icon = "__fruit__/graphics/vegetable/watercress.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[watercress]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "watercress",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="watercress", amount=1}},
        results = {{type="item", name="watercress", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "daikon",
        icon = "__fruit__/graphics/vegetable/daikon.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[daikon]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "daikon",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="daikon", amount=1}},
        results = {{type="item", name="daikon", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "mallow",
        icon = "__fruit__/graphics/vegetable/mallow.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[mallow]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "mallow",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="mallow", amount=1}},
        results = {{type="item", name="mallow", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "jicama",
        icon = "__fruit__/graphics/vegetable/jicama.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[jicama]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "jicama",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="jicama", amount=1}},
        results = {{type="item", name="jicama", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "chayote",
        icon = "__fruit__/graphics/vegetable/chayote.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[chayote]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "chayote",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="chayote", amount=1}},
        results = {{type="item", name="chayote", amount=2}},

    }
})

data:extend({
    {
        type = "item",
        name = "kale",
        icon = "__fruit__/graphics/vegetable/kale.png",
        icon_size = 512,
        subgroup = "vegetable",
        order = "a[kale]",
        stack_size = 100 ,
    },
    {
        type = "recipe",
        name = "kale",
        enabled = enable_recipe,
        energy_required = 600,
        ingredients = { {type="item", name="kale", amount=1}},
        results = {{type="item", name="kale", amount=2}},

    }
})
