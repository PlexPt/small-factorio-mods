
local entity = {

    type = "thruster",
    name = "ion-thruster",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    icon = "__space-age__/graphics/icons/thruster.png",
    collision_box = { { -1.7, -2.2 }, { 1.7, 2.2 } },
    selection_box = { { -2, -2.5 }, { 2, 5.5 } },
    collision_mask = { layers = { item = true, object = true, train = true, is_lower_object = true, is_object = true } },
    tile_buildability_rules = {
        { area = { { -1.8, -2.3 }, { 1.8, 2.3 } }, required_tiles = { layers = { ground_tile = true } }, colliding_tiles = { layers = { empty_space = true } }, remove_on_collision = true },
        { area = { { -1.8, 2.7 }, { 1.8, 90.3 } }, required_tiles = { layers = { empty_space = true } }, remove_on_collision = true },
    },
    max_health = 300,
    minable = { mining_time = 0.1, result = "thruster" },
    fast_replaceable_group = "thruster",
    impact_category = "metal",
    surface_conditions = {
        {
            property = "pressure",
            min = 0,
            max = 0
        }
    },
    min_performance = { fluid_volume = 0.1, fluid_usage = 0.1, effectivity = 1 },
    max_performance = { fluid_volume = 0.8, fluid_usage = 2, effectivity = 0.51 },
    fuel_fluid_box = {
        filter = "thruster-fuel",
        production_type = "input",
        -- pipe_covers = pipecoverspictures(),
        draw_only_when_connected = true,
        volume = 10,
        pipe_connections = {
            { flow_direction = "input-output", direction = defines.direction.west, position = { -1.5, -2 }, enable_working_visualisations = { "pipe-4" } },
            { flow_direction = "input-output", direction = defines.direction.east, position = { 1.5, 0 }, enable_working_visualisations = { "pipe-2" } },
        }
    },
    oxidizer_fluid_box = {
        filter = "thruster-oxidizer",
        production_type = "input",
        -- pipe_covers = pipecoverspictures(),
        draw_only_when_connected = true,
        volume = 10,
        pipe_connections = {
            { flow_direction = "input-output", direction = defines.direction.east, position = { 1.5, -2 }, enable_working_visualisations = { "pipe-1" } },
            { flow_direction = "input-output", direction = defines.direction.west, position = { -1.5, 0 }, enable_working_visualisations = { "pipe-3" } },
        }
    },
    placeable_position_visualization = {
        filename = "__core__/graphics/cursor-boxes-32x32.png",
        priority = "extra-high-no-scale",
        size = 64,
        scale = 0.5,
        x = 3 * 64
    },

    graphics_set = {
        animation = util.sprite_load("__space-age__/graphics/entity/thruster/thruster",
                {
                    animation_speed = 0.5,
                    frame_count = 64,
                    scale = 0.5,
                    shift = { 0, 3 }
                }),

        integration_patch_render_layer = "floor",
        integration_patch = util.sprite_load("__space-age__/graphics/entity/thruster/thruster-bckg",
                {
                    scale = 0.5,
                    shift = { 0, 3 }
                }),

        working_visualisations = {
            {
                always_draw = true,
                name = "pipe-1",
                enabled_by_name = true,
                animation = {
                    filename = "__space-age__/graphics/entity/thruster/thruster-pipe-connection-1.png",
                    width = 384,
                    height = 832,
                    shift = util.by_pixel(0, 95),
                    scale = 0.5
                }
            },
            {
                always_draw = true,
                name = "pipe-2",
                enabled_by_name = true,
                animation = {
                    filename = "__space-age__/graphics/entity/thruster/thruster-pipe-connection-2.png",
                    width = 384,
                    height = 832,
                    shift = util.by_pixel(0, 96),
                    scale = 0.5
                }
            },
            {
                always_draw = true,
                name = "pipe-3",
                enabled_by_name = true,
                animation = {
                    filename = "__space-age__/graphics/entity/thruster/thruster-pipe-connection-3.png",
                    width = 384,
                    height = 832,
                    shift = util.by_pixel(0, 96),
                    scale = 0.5
                }
            },
            {
                always_draw = true,
                name = "pipe-4",
                enabled_by_name = true,
                animation = {
                    filename = "__space-age__/graphics/entity/thruster/thruster-pipe-connection-4.png",
                    width = 384,
                    height = 832,
                    shift = util.by_pixel(0, 95),
                    scale = 0.5
                }
            },

            {
                -- effect = "flicker",
                fadeout = true,
                animation = util.sprite_load("__space-age__/graphics/entity/thruster/thruster-light",
                        {
                            animation_speed = 0.5,
                            frame_count = 64,
                            blend_mode = "additive",
                            draw_as_glow = true,
                            scale = 0.5,
                            shift = { 0, 3 }
                        }),
            },
        },
        flame_effect = {
            filename = "__space-age__/graphics/entity/thruster/thruster-flame.png",
            width = 384,
            height = 832
        },
        flame_position = { 0, 5.5 },
        flame_half_height = 0,
        flame_effect_height = 1000 / 32,
        flame_effect_width = 384 / 64,
        flame_effect_offset = 50 / 32,
    },

    plumes = {
        min_probability = 0.08,
        max_probability = 1,
        min_y_offset = -4,
        max_y_offset = 0,
        stateless_visualisations = {
            {
                offset_x = { -0.1, 0.1 },
                offset_y = { 10.5, 10.5 },
                offset_z = { 0.0, 0.0 },

                speed_x = { -0.014, 0.014 },
                speed_y = { 0.5, 0.7 },
                speed_z = { -0.014, 0.014 },

                probability = 0.3,
                count = 3,
                age_discrimination = -10,
                period = 200,
                fade_in_progress_duration = 0.25,
                fade_out_progress_duration = 0.6,
                spread_progress_duration = 0.375,
                begin_scale = 0.25,
                end_scale = 1.25,
                affected_by_wind = false,
                render_layer = "smoke",
                can_lay_on_the_ground = false,
                animation = {
                    width = 253,
                    height = 210,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 60,
                    shift = { 0, 0 },
                    priority = "high",
                    animation_speed = 0.25,
                    tint = { r = 1, b = 0.95, g = 0.97, a = 0.5 },
                    filename = "__space-age__/graphics/entity/thruster/thruster-smoke.png",
                    flags = { "smoke" }
                }
            },
            {
                offset_x = { -0.2, 0.2 },
                offset_y = { 14.5, 14.5 },
                offset_z = { 0.0, 0.0 },

                speed_x = { -0.014, 0.014 },
                speed_y = { 0.55, 0.65 },
                speed_z = { -0.014, 0.014 },

                probability = 0.5,
                period = 60,
                age_discrimination = -6,
                fade_in_progress_duration = 0.5,
                fade_out_progress_duration = 0.5,
                begin_scale = 0.5,
                end_scale = 1.25,
                affected_by_wind = false,
                render_layer = "smoke",
                can_lay_on_the_ground = false,
                animation = {
                    width = 2024 / 8,
                    height = 1216 / 8,
                    line_length = 8,
                    frame_count = 60,
                    shift = { 0, 0 },
                    priority = "high",
                    animation_speed = 0.25,
                    tint = { r = 0.75, b = 0.75, g = 0.75, a = 1 },
                    filename = "__space-age__/graphics/entity/thruster/thruster-smoke-glow.png",
                    flags = { "smoke" },
                    draw_as_glow = true
                }
            },
            {
                offset_x = { -0.25, 0.25 },
                offset_y = { 13.0, 13.0 },
                offset_z = { 0.0, 0.0 },

                speed_x = { -0.014, 0.014 },
                speed_y = { 0.5, 0.7 },
                speed_z = { -0.014, 0.014 },

                probability = 0.2,
                count = 2,
                period = 200,
                --age_discrimination = 0,
                fade_in_progress_duration = 0.3,
                fade_out_progress_duration = 0.7,
                begin_scale = 0.5,
                end_scale = 3.0,
                affected_by_wind = false,
                render_layer = "smoke",
                can_lay_on_the_ground = false,
                animation = {
                    width = 253,
                    height = 210,
                    line_length = 8,
                    frame_count = 60,
                    shift = { 0, 0 },
                    priority = "high",
                    animation_speed = 0.1,
                    tint = { r = 1, b = 0.95, g = 0.97, a = 1.0 },
                    filename = "__space-age__/graphics/entity/thruster/thruster-smoke.png",
                    flags = { "smoke" }
                }
            }
        }
    },
    --damaged_trigger_effect = hit_effects.entity(),
    open_sound = { filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55 },
    close_sound = { filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54 },
    --working_sound = {
    --    main_sounds = {
    --        {
    --            sound = {
    --                filename = "__space-age__/sound/entity/platform-thruster/thruster-burner.ogg",
    --                volume = 0.3,
    --                speed_smoothing_window_size = 60,
    --                advanced_volume_control = { attenuation = "exponential" },
    --            },
    --            match_volume_to_activity = true,
    --            activity_to_volume_modifiers = { multiplier = 2.0 },
    --            match_speed_to_activity = true,
    --            activity_to_speed_modifiers = { multiplier = 1.2 },
    --            audible_distance_modifier = 0.8
    --        },
    --    },
    --    sound_accents = {
    --        {
    --            sound = {
    --                variations = sound_variations("__space-age__/sound/entity/platform-thruster/thruster-mechanic-stop", 5, 0.5),
    --                advanced_volume_control = {
    --                    fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 3, 100.0 } } },
    --                }
    --            },
    --            frame = 25,
    --            audible_distance_modifier = 0.3,
    --        },
    --        {
    --            sound = {
    --                variations = sound_variations("__space-age__/sound/entity/platform-thruster/thruster-mechanic-move", 5, 0.3),
    --                advanced_volume_control = {
    --                    fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 3, 100.0 } } },
    --                }
    --            },
    --            frame = 52,
    --            audible_distance_modifier = 0.3,
    --        },
    --    },
    --    max_sounds_per_type = 2,
    --    use_doppler_shift = false,
    --    extra_sounds_ignore_limit = true,
    --    activate_sound = { variations = sound_variations("__space-age__/sound/entity/platform-thruster/thruster-engine-activate", 3, 0.3) },
    --    deactivate_sound = { variations = sound_variations("__space-age__/sound/entity/platform-thruster/thruster-engine-deactivate", 3, 0.3) },
    --},
}
