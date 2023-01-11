data:extend(
        {
            {
                type = "item",
                name = "condom",
                icon = "__girlfriend__/graphics/items/condom.png",
                icon_size = 512,
                subgroup = "girlfriend-item",
                stack_size = 1,
            },
            {
                type = "item",
                name = "vibrator",
                icon = "__girlfriend__/graphics/items/vibrator.png",
                icon_size = 256,
                subgroup = "girlfriend-item",
                stack_size = 1,
            },
            {
                type = "item",
                name = "vibrator2",
                icon = "__girlfriend__/graphics/items/vibrator2.png",
                icon_size = 256,
                subgroup = "girlfriend-item",
                stack_size = 1,
            },
            {
                type = "item",
                name = "vibrator3",
                icon = "__girlfriend__/graphics/items/vibrator3.png",
                icon_size = 256,
                subgroup = "girlfriend-item",
                stack_size = 1,
            },
            {
                type = "item",
                name = "vibrator4",
                icon = "__girlfriend__/graphics/items/vibrator4.png",
                icon_size = 256,
                subgroup = "girlfriend-item",
                stack_size = 1,
            },
            {
                type = "recipe",
                name = "condom",
                category = "chemistry",
                enabled = true,
                energy_required = 300.00,
                ingredients = {
                    { type = "item", name = "sulfur", amount = 2 },
                    { type = "item", name = "plastic-bar", amount = 2 },
                    { type = "fluid", name = "lubricant", amount = 5 },
                },
                results = {
                    { type = "item", name = "condom", amount = 1, probability = 0.9  },
                },
                main_product = "condom",
                always_show_products = true,
            },
            {
                type = "recipe",
                name = "vibrator",
                category = "chemistry",
                enabled = true,
                energy_required = 300.00,
                ingredients = {
                    { type = "item", name = "plastic-bar", amount = 4 },
                    { type = "item", name = "advanced-circuit", amount = 1 },
                    { type = "item", name = "battery", amount = 1 },
                    { type = "fluid", name = "lubricant", amount = 5 },
                },
                results = {
                    { type = "item", name = "vibrator", amount = 1, probability = 0.9  },
                },
                main_product = "vibrator",
                always_show_products = true,
            },
            {
                type = "recipe",
                name = "vibrator2",
                category = "chemistry",
                enabled = true,
                energy_required = 300.00,
                ingredients = {
                    { type = "item", name = "plastic-bar", amount = 4 },
                    { type = "item", name = "iron-stick", amount = 1 },
                    { type = "item", name = "flamethrower", amount = 1 },
                },
                results = {
                    { type = "item", name = "vibrator2", amount = 1, probability = 0.9  },
                },
                main_product = "vibrator2",
                always_show_products = true,
            },
            {
                type = "recipe",
                name = "vibrator3",
                category = "chemistry",
                enabled = true,
                energy_required = 300.00,
                ingredients = {
                    { type = "item", name = "plastic-bar", amount = 4 },
                    { type = "item", name = "iron-stick", amount = 1 },
                    { type = "item", name = "iron-gear-wheel", amount = 1 },
                    { type = "item", name = "advanced-circuit", amount = 1 },
                    { type = "item", name = "battery", amount = 1 },
                    { type = "fluid", name = "lubricant", amount = 5 },
                },
                results = {
                    { type = "item", name = "vibrator3", amount = 1, probability = 0.9  },
                },
                main_product = "vibrator3",
                always_show_products = true,
            },
            {
                type = "recipe",
                name = "vibrator4",
                category = "chemistry",
                enabled = true,
                energy_required = 300.00,
                ingredients = {
                    --电池 蓝版 塑料 铜线
                    { type = "item", name = "advanced-circuit", amount = 1 },
                    { type = "item", name = "plastic-bar", amount = 1 },
                    { type = "item", name = "battery", amount = 1 },
                    { type = "item", name = "copper-cable", amount = 4 },
                },
                results = {
                    { type = "item", name = "vibrator4", amount = 1, probability = 0.9  },
                },
                main_product = "vibrator4",
                always_show_products = true,
            }
        }
)

