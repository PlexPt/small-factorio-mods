data:extend {
    {
        type = "double-setting",
        name = "data-failure-divisor",
        setting_type = "startup",
        default_value = 3.2,
        minimum_value = 1,
    },
    {
        type = "int-setting",
        name = "cargo-rocket-part-stack-size",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 1,
        maximum_value = 200,
    },
    {
        type = "bool-setting",
        name = "allow-on-land",
        setting_type = "startup",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "skip-land",
        setting_type = "startup",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "quick-craft",
        setting_type = "startup",
        default_value = true
    },
}

data.raw["double-setting"]["robot-attrition-factor"].minimum_value = 0
