require("lib.animation_util")

local jian = {
    type = "combat-robot",
    name = "shen-jian",
    icon = "__flying-sword__/graphics/shen/1.png",
    icon_size = 2216,
    flags = { "placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable" },
    resistances = {
        {
            type = "fire",
            percent = 95
        },
        {
            type = "acid",
            decrease = 0,
            percent = 80
        }
    },
    subgroup = "capsule",
    order = "shenjian",
    max_health = 600,
    alert_when_damaged = false,
    collision_box = { { 0, 0 }, { 0, 0 } },
    --selection_box = { { -0.5, -1.5 }, { 0.5,  -0.5 } },
    selection_box = { { -1, -3 }, { 1, 3 } },
    hit_visualization_box = { { -0.1, -1.1 }, { 0.1, -1.0 } },
    damaged_trigger_effect = {
        type = "create-entity",
        entity_name = "flying-robot-damaged-explosion",
        offset_deviation = { { -0.25, -0.25 }, { 0.25, 0.25 } },
        offsets = { { 0, 0 } },
        damage_type_filters = "fire"
    },
    dying_explosion = "big-explosion",
    time_to_live = 60 * 60 * 5,
    follows_player = true,
    friction = 0.01,
    range_from_player = 10,
    speed = 0.1,
    --working_sound = {
    --    sound = { filename = "__base__/sound/fight/jianshen.ogg", volume = 0.7 },
    --    apparent_volume = 1,
    --    persistent = true
    --},
    destroy_action = {
        type = "direct",
        action_delivery = {
            type = "instant",
            source_effects = {
                type = "create-entity",
                entity_name = "big-explosion"
            }
        }
    },
    attack_parameters = {
        type = "projectile",
        range = 30,
        cooldown = 30,
        cooldown_deviation = 0.2,
        projectile_center = { 0, 1 },
        projectile_creation_distance = 0.6,
        --sound = sounds.defender_gunshot,
        ammo_category = "bullet",
        ammo_type = {
            clamp_position = true,
            action = {
                type = "direct",
                action_delivery = {
                    {
                        type = "projectile",
                        projectile = "projectile-shen-jian",
                        starting_speed = 1,

                    },
                }
            }
        }
    },
    idle = {
        slice = 1,
        animation_speed = 0.5,
        width = 2216,
        height = 2216,
        frame_count = 1,
        draw_as_glow = true,
        direction_count = 8,
        shift = shift or util.by_pixel(0, 0),
        scale = 0.2,
        stripes = getStripes("shen/", 8)

    },
    in_motion = {
        slice = 1,
        animation_speed = 0.5,
        width = 2216,
        height = 2216,
        frame_count = 1,
        draw_as_glow = true,
        direction_count = 8,
        shift = shift or util.by_pixel(0, 0),
        scale = 0.2,
        stripes = getStripes("shen/", 8)

    },
    --shadow_idle = robot_animations.defender.shadow_idle,
    --shadow_in_motion = robot_animations.defender.shadow_in_motion
}

data:extend({ jian })

data:extend { {
                  type = "capsule",
                  name = "shen-jian",
                  icon = "__flying-sword__/graphics/shen/1.png",
                  icon_size = 2216,
                  subgroup = "capsule",
                  stack_size = 100,
                  weight = 10000,
                  capsule_action = {
                      type = "throw",
                      attack_parameters = {
                          type = "projectile",
                          activation_type = "throw",
                          ammo_category = "capsule",
                          cooldown = 15,
                          projectile_creation_distance = 0.6,
                          range = 20,
                          ammo_type = {
                              target_type = "position",
                              action = {
                                  {
                                      type = "direct",
                                      action_delivery = {
                                          type = "instant",
                                          source_effects = {
                                              type = "create-entity",
                                              show_in_tooltip = true,
                                              entity_name = "shen-jian",
                                          }
                                      }
                                  },

                              }
                          }
                      }
                  },
              }
}
data:extend { {
                  type = "recipe",
                  name = "shen-jian",
                  enabled = true,
                  energy_required = 8,
                  ingredients = {
                      { type = "item", name = "iron-plate", amount = 2000 },
                  },
                  results = { { type = "item", name = "shen-jian", amount = 1 } }
              } }

data:extend({ {
                  type = "projectile",
                  name = "projectile-shen-jian",
                  localised_name = "飞剑",
                  flags = { "not-on-map" },
                  acceleration = 0.05,
                  action = {
                      type = "direct",
                      action_delivery = {
                          type = "instant",
                          target_effects = {
                              {
                                  type = "damage",
                                  damage = { amount = 30,
                                             type = "physical" }
                              },
                              {
                                  type = "damage",
                                  damage = { amount = 10,
                                             type = "physical" }
                              },

                          }
                      }
                  },
                  light = {
                      intensity = 1,
                      color = { r = 0.1, g = 0.9, b = 0.3 },
                      size = 20
                  },
                  animation = {
                      slice = 1,
                      animation_speed = 0.5,
                      width = 2216,
                      height = 2216,
                      frame_count = 1,
                      draw_as_glow = true,
                      direction_count = 8,
                      scale = 0.15,
                      stripes = getStripes("shen/", 8)

                  },

              }
})


