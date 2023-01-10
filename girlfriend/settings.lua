


data:extend({
    -- Settings

    {
        type = "string-setting",
        name = "girlfriend_who",
        --~ setting_type = "startup",
        setting_type = "runtime-per-user",
        allowed_values = {
          "please select in game left top",
        },
        default_value = "please select in game left top",
        order = "[girlfriend]-ww"
    },
    {
        type = "string-setting",
        name = "girlfriend_distance",
        --~ setting_type = "startup",
        setting_type = "runtime-per-user",
        allowed_values = {
          "5",
          "10",
          "20",
          "50",
          "100",
          "500",
          "1000",
          "2000",
          "10000",
        },
        default_value = "10",
        order = "[girlfriend]-dd"
    },

})
