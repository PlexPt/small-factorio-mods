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
    local girlfreedunit = table.deepcopy(data.raw.unit["compilatron"])
    --girlfreedunit.flags = { "hidden", "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" }
    girlfreedunit.name = name
    girlfreedunit.localised_name = { "entity-name." .. surname }
    girlfreedunit.selection_box = scale_box(table.deepcopy(character.selection_box), scale)
    girlfreedunit.sticker_box = scale_box(table.deepcopy(character.sticker_box), scale)
    girlfreedunit.icon = character.icon
    girlfreedunit.icon_size = character.icon_size
    girlfreedunit.icon_mipmaps = character.icon_mipmaps

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

    local corpse = table.deepcopy(girl_corpse)
    corpse.name = girlfreedunit.name .. "-corpse"
    corpse.order = "zzz-" .. name
    hack_scale(corpse, scale) --1+ scale/2)
    hack_tint(corpse, color, true)

    data:extend {
        girlfreedunit,
        corpse
    }

end
