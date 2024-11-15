local colors = require("script/ColorEnum")
require("script/gutil")
local base_name = girlfreed_base_name

function create_girl_unit(character, surname, set_color, scale, hp, attack_parameters)
    scale = scale or 1
    set_color = set_color or colors.pink
    local color = table.deepcopy(set_color)

    local att_anim = table.deepcopy(character.animations[1].idle_with_gun)
    --if attack_parameters.ammo_category and attack_parameters.ammo_category == "melee" then
    --    att_anim = table.deepcopy(character.animations[armor].mining_with_tool)
    --end

    local name = base_name .. surname



    local compilatron_animations =
    {
        walk =
        {
            width = 40,
            height = 52,
            frame_count = 2,
            axially_symmetrical = false,
            direction_count = 32,
            shift = util.by_pixel(0.0, -14.0),
            stripes =
            {
                {
                    filename = "__base__/graphics/entity/compilatron/compilatron-walk-1.png",
                    width_in_frames = 2,
                    height_in_frames = 16
                },
                {
                    filename = "__base__/graphics/entity/compilatron/compilatron-walk-2.png",
                    width_in_frames = 2,
                    height_in_frames = 16
                }
            },

            hr_version =
            {
                width = 78,
                height = 104,
                frame_count = 2,
                axially_symmetrical = false,
                direction_count = 32,
                shift = util.by_pixel(0.0, -14),
                scale = 0.5,
                stripes =
                {
                    {
                        filename = "__base__/graphics/entity/compilatron/hr-compilatron-walk-1.png",
                        width_in_frames = 2,
                        height_in_frames = 16
                    },
                    {
                        filename = "__base__/graphics/entity/compilatron/hr-compilatron-walk-2.png",
                        width_in_frames = 2,
                        height_in_frames = 16
                    }
                }
            }
        },
        walk_shadow =
        {
            width = 72,
            height = 30,
            frame_count = 2,
            direction_count = 32,
            shift = util.by_pixel(19, 0.0),
            draw_as_shadow = true,
            stripes = util.multiplystripes(2,
                    {
                        {
                            filename = "__base__/graphics/entity/compilatron/compilatron-walk-shadow.png",
                            width_in_frames = 1,
                            height_in_frames = 32
                        }
                    }),
            hr_version =
            {
                width = 142,
                height = 56,
                frame_count = 2,
                axially_symmetrical = false,
                direction_count = 32,
                shift = util.by_pixel(15.5, -0.5),
                draw_as_shadow = true,
                scale = 0.5,
                stripes = util.multiplystripes(2,
                        {
                            {
                                filename = "__base__/graphics/entity/compilatron/hr-compilatron-walk-shadow.png",
                                width_in_frames = 1,
                                height_in_frames = 32
                            }
                        })
            }
        }
    }

    local girlfreedunit = {
        type = "unit",
        name = "compilatron",
        icon = "__base__/graphics/icons/compilatron.png",
        icon_size = 64,
        flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air" },
        map_color = { r = 0, g = 0.365, b = 0.58, a = 1 },
        max_health = 100,
        order = "z-z-z",
        subgroup = "enemies",
        has_belt_immunity = true,
        selectable_in_game = true,
        can_open_gates = true,
        healing_per_tick = 0,
        collision_box = { { -0.2, -0.2 }, { 0.2, 0.2 } },
        selection_box = { { -0.8, -1.3 }, { 0.8, 0.5 } },
        attack_parameters = {
            type = "projectile",
            damage_modifier = 1,
            range = 0.5,
            cooldown = 35,
            ammo_category = "melee",
            ammo_type = {
                category = "melee",
                target_type = "entity",
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "instant",
                        target_effects = {
                            type = "damage",
                            damage = {
                                amount = 10,
                                type = "physical"
                            }
                        }
                    }
                }
            },
            animation = {
                layers = {
                    compilatron_animations.walk_shadow,
                    compilatron_animations.walk
                }
            }
        },
        vision_distance = 30,
        movement_speed = 0.2,
        distance_per_frame = 0.1,
        distraction_cooldown = 300,
        min_pursue_time = 10 * 60,
        max_pursue_distance = 50,
        run_animation = {
            layers = {
                compilatron_animations.walk_shadow,
                compilatron_animations.walk
            }
        },
        water_reflection = {
            pictures = {
                filename = "__base__/graphics/entity/compilatron/compilatron-reflection.png",
                priority = "extra-high",
                width = 20,
                height = 20,
                shift = util.by_pixel(0, 67 * 0.5),
                scale = 5,
                variation_count = 1
            },
            rotate = false,
            orientation_to_variation = false
        }
    }

    --local girlfreedunit = table.deepcopy(data.raw.unit["compilatron"])
    --girlfreedunit.flags = { "hidden", "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" }
    girlfreedunit.name = name
    girlfreedunit.localised_name = { "entity-name." .. surname }
    girlfreedunit.localised_description = { "entity-description." .. surname }
    girlfreedunit.selection_box = scale_box(table.deepcopy(character.selection_box), scale)
    girlfreedunit.sticker_box = scale_box(table.deepcopy(character.sticker_box), scale)
    girlfreedunit.icon = character.icon
    girlfreedunit.icon_size = character.icon_size

    girlfreedunit.map_color = color
    girlfreedunit.enemy_map_color = { r = 1 }
    --girlfreedunit.resistances = {}
    if hp then
        --hp = 200
        girlfreedunit.max_health = hp
    end
    --  --fake_human.move_while_shooting = true  --- se ativar ele foge do alvo -flee
    girlfreedunit.affected_by_tiles = true
    girlfreedunit.can_open_gates = true
    --girlfreedunit.attack_parameters = attack_parameters
    girlfreedunit.attack_parameters.animation = att_anim
    girlfreedunit.run_animation = table.deepcopy(character.animations[1].running)
    --girlfreedunit.pollution_to_join_attack = 10 + level * 10
    girlfreedunit.corpse = girlfreedunit.name .. "-corpse"
    --girlfreedunit.has_belt_immunity = true
    girlfreedunit.rotation_speed = 0.05
    girlfreedunit.vision_distance = 100
    --girlfreedunit.movement_speed = 0.05 + level / 100
    -- fake_human.dying_sound = nil
    girlfreedunit.working_sound = nil
    girlfreedunit.destroy_when_commands_fail = false
    girlfreedunit.hide_resistances = false
    --girlfreedunit.ai_settings = { destroy_when_commands_fail = true }

    hack_tint(girlfreedunit, color, true)
    if scale ~= 1 then
        hack_scale(girlfreedunit, scale)
    end

    girlfreedunit.light = {
        {
            minimum_darkness = 0.3,
            intensity = 0.4,
            size = 15,
            color = { r = 1.0, g = 1.0, b = 1.0 }
        },
        {
            type = "oriented",
            minimum_darkness = 0.3,
            picture = {
                filename = "__core__/graphics/light-cone.png",
                priority = "extra-high",
                flags = { "light" },
                scale = 2,
                width = 200,
                height = 200
            },
            shift = { 0, -7 },
            size = 1,
            intensity = 0.6,
            color = { r = 1.0, g = 1.0, b = 1.0 }
        }
    }
    girlfreedunit.running_sound_animation_positions = { 5, 16 }
    girlfreedunit.walking_sound = {
        aggregation = {
            max_count = 2,
            remove = true
        },
        variations = data.raw.tile["sand-1"].walking_sound
    }


    -- tint character_corpse
    local girl_corpse = table.deepcopy(data.raw["character-corpse"][character.character_corpse])
    local corpse_name = girl_corpse.name
    girl_corpse.name = girlfreedunit.name .. "-corpse"
    girl_corpse.localised_name = { "", "entity-name." .. surname, "genshin-impact-skin.corpse" }
    girl_corpse.order = "zzz-" .. name
    hack_scale(girl_corpse, scale) --1+ scale/2)
    hack_tint(girl_corpse, color, true)

    data:extend {
        girlfreedunit,
        girl_corpse
    }

end
