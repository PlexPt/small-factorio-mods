


data:extend({
    -- Settings

    {
        type = "string-setting",
        name = "girlfriend_who",
        --~ setting_type = "startup",
        setting_type = "runtime-per-user",
        allowed_values = {
          "player_follows_character",
          "character_follows_player",
        },
        default_value = "player_follows_character",
        order = "[girlfriend]-cc"
    },

})
