--This is a reference file, a copy of the code from the original
local nauvis_planet = {
    distance = 15,
    gravity_pull = 10,
    icon = "__base__/graphics/icons/nauvis.png",
    magnitude = 1,
    map_seed_offset = 0,
    name = "nauvis",
    order = "a[nauvis]",
    orientation = 0.275,
    persistent_ambient_sounds = {
        base_ambience = {
            filename = "__base__/sound/world/world_base_wind.ogg",
            volume = 0.3
        },
        crossfade = {
            curve_type = "cosine",
            from = {
                control = 0.35,
                volume_percentage = 0
            },
            order = {
                "wind",
                "base_ambience"
            },
            to = {
                control = 2,
                volume_percentage = 100
            }
        },
        wind = {
            filename = "__base__/sound/wind/wind.ogg",
            volume = 0.8
        }
    },
    planet_procession_set = {
        arrival = {
            "default-b"
        },
        departure = {
            "default-rocket-a"
        }
    },
    pollutant_type = "pollution",
    procession_graphic_catalogue = {
        {
            index = 506,
            sprite = {
                blend_mode = "additive",
                draw_as_glow = true,
                filename = "__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-A.png",
                height = 316,
                line_length = 1,
                priority = "medium",
                scale = 0.5,
                shift = {
                    0.703125,
                    -0.3125
                },
                width = 356
            }
        },
        {
            index = 507,
            sprite = {
                blend_mode = "additive",
                draw_as_glow = true,
                filename = "__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-B.png",
                height = 388,
                line_length = 1,
                priority = "medium",
                scale = 0.5,
                shift = {
                    -1.21875,
                    0.265625
                },
                width = 402
            }
        },
        {
            index = 508,
            sprite = {
                blend_mode = "additive",
                draw_as_glow = true,
                filename = "__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-C.png",
                height = 358,
                line_length = 1,
                priority = "medium",
                scale = 0.5,
                shift = {
                    0.015625,
                    -0.96875
                },
                width = 350
            }
        }
    },
    solar_power_in_space = 300,
    starmap_icon = "__base__/graphics/icons/starmap-planet-nauvis.png",
    starmap_icon_size = 512,
    surface_properties = {
        ["day-night-cycle"] = 25200
    },
    surface_render_parameters = {
        clouds = {
            additional_density_sample = {
                scale = 0.0084375,
                wind_speed_factor = 1.77
            },
            detail_noise_texture = {
                filename = "__core__/graphics/clouds-detail-noise.png",
                size = 2048
            },
            detail_sample_1 = {
                scale = 0.053406250000000002,
                wind_speed_factor = 0.11702750146284377
            },
            detail_sample_2 = {
                scale = 0.068093749999999993,
                wind_speed_factor = 0.091785222579164767
            },
            detail_sample_morph_duration = 256,
            movement_speed_multiplier = 0.75,
            opacity = 0.25,
            scale = 1,
            shape_noise_texture = {
                filename = "__core__/graphics/clouds-noise.png",
                size = 2048
            },
            shape_warp_strength = 0.06,
            shape_warp_weight = 0.4,
            warp_sample_1 = {
                scale = 0.05
            },
            warp_sample_2 = {
                scale = 0.09375,
                wind_speed_factor = 0
            },
            warped_shape_sample = {
                scale = 0.01125
            }
        }
    },
    type = "planet",
    map_gen_settings = {
        autoplace_controls = {
            coal = {},
            ["copper-ore"] = {},
            ["crude-oil"] = {},
            ["enemy-base"] = {},
            ["iron-ore"] = {},
            nauvis_cliff = {},
            rocks = {},
            starting_area_moisture = {},
            stone = {},
            trees = {},
            ["uranium-ore"] = {},
            water = {}
        },
        autoplace_settings = {
            decorative = {
                settings = {
                    ["brown-asterisk"] = {},
                    ["brown-asterisk-mini"] = {},
                    ["brown-carpet-grass"] = {},
                    ["brown-fluff"] = {},
                    ["brown-fluff-dry"] = {},
                    ["brown-hairy-grass"] = {},
                    ["cracked-mud-decal"] = {},
                    ["dark-mud-decal"] = {},
                    garballo = {},
                    ["garballo-mini-dry"] = {},
                    ["green-asterisk"] = {},
                    ["green-asterisk-mini"] = {},
                    ["green-bush-mini"] = {},
                    ["green-carpet-grass"] = {},
                    ["green-croton"] = {},
                    ["green-desert-bush"] = {},
                    ["green-hairy-grass"] = {},
                    ["green-pita"] = {},
                    ["green-pita-mini"] = {},
                    ["green-small-grass"] = {},
                    ["light-mud-decal"] = {},
                    ["medium-rock"] = {},
                    ["medium-sand-rock"] = {},
                    ["red-asterisk"] = {},
                    ["red-croton"] = {},
                    ["red-desert-bush"] = {},
                    ["red-desert-decal"] = {},
                    ["red-pita"] = {},
                    ["sand-decal"] = {},
                    ["sand-dune-decal"] = {},
                    ["small-rock"] = {},
                    ["small-sand-rock"] = {},
                    ["tiny-rock"] = {},
                    ["white-desert-bush"] = {}
                }
            },
            entity = {
                settings = {
                    ["big-rock"] = {},
                    ["big-sand-rock"] = {},
                    coal = {},
                    ["copper-ore"] = {},
                    ["crude-oil"] = {},
                    fish = {},
                    ["huge-rock"] = {},
                    ["iron-ore"] = {},
                    stone = {},
                    ["uranium-ore"] = {}
                }
            },
            tile = {
                settings = {
                    deepwater = {},
                    ["dirt-1"] = {},
                    ["dirt-2"] = {},
                    ["dirt-3"] = {},
                    ["dirt-4"] = {},
                    ["dirt-5"] = {},
                    ["dirt-6"] = {},
                    ["dirt-7"] = {},
                    ["dry-dirt"] = {},
                    ["grass-1"] = {},
                    ["grass-2"] = {},
                    ["grass-3"] = {},
                    ["grass-4"] = {},
                    ["red-desert-0"] = {},
                    ["red-desert-1"] = {},
                    ["red-desert-2"] = {},
                    ["red-desert-3"] = {},
                    ["sand-1"] = {},
                    ["sand-2"] = {},
                    ["sand-3"] = {},
                    water = {}
                }
            }
        },
        aux_climate_control = true,
        cliff_settings = {
            cliff_smoothing = 0,
            control = "nauvis_cliff",
            name = "cliff"
        },
        moisture_climate_control = true,
        property_expression_names = {}
    },

}

local aquilo = {
    type = "planet",
    name = "aquilo",
    icon = "__space-age__/graphics/icons/aquilo.png",
    starmap_icon = "__space-age__/graphics/icons/starmap-planet-aquilo.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 35,
    orientation = 0.225,
    magnitude = 1.0,
    label_orientation = 0.15,
    order = "e[aquilo]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.aquilo(),
    pollutant_type = nil,
    solar_power_in_space = 60,
    platform_procession_set = {
        arrival = { "planet-to-platform-b" },
        departure = { "platform-to-planet-a" }
    },
    planet_procession_set = {
        arrival = { "platform-to-planet-b" },
        departure = { "planet-to-platform-a" }
    },
    procession_graphic_catalogue = planet_catalogue_aquilo,
    surface_properties = {
        ["day-night-cycle"] = 20 * minute,
        ["magnetic-field"] = 10,
        pressure = 300,
        ["solar-power"] = 1,
        gravity = 15
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo, 0.9),
    persistent_ambient_sounds = {
        base_ambience = { filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5 },
        wind = { filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8 },
        crossfade = {
            order = { "wind", "base_ambience" },
            curve_type = "cosine",
            from = { control = 0.35, volume_percentage = 0.0 },
            to = { control = 2, volume_percentage = 100.0 }
        },
        semi_persistent = {
            {
                sound = {
                    variations = sound_variations("__space-age__/sound/world/semi-persistent/ice-cracks", 5, 0.7),
                    advanced_volume_control = {
                        fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 2, 100.0 } } }
                    }
                },
                delay_mean_seconds = 10,
                delay_variance_seconds = 5
            },
            {
                sound = { variations = sound_variations("__space-age__/sound/world/semi-persistent/cold-wind-gust", 5, 0.3) },
                delay_mean_seconds = 15,
                delay_variance_seconds = 9
            }
        }
    },
    entities_require_heating = true,
    player_effects = {
        type = "direct",
        action_delivery = {
            type = "instant",
            source_effects = {
                type = "create-trivial-smoke",
                smoke_name = "aquilo-snow-smoke",
                speed = { 0, 0.1 },
                initial_height = 0.5,
                speed_multiplier = 1,
                speed_multiplier_deviation = 0.5,
                starting_frame = 8,
                starting_frame_deviation = 8,
                offset_deviation = { { -96, -48 }, { 96, 48 } },
                speed_from_center = 0.04,
                speed_from_center_deviation = 0.2
            }
        }
    },
    ticks_between_player_effects = 2
}
