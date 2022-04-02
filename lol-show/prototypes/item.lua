local mod_path = "__DNF-mod__/graphics/"

data:extend(
        { {
              type = "projectile",
              name = "atsword_majesty",
              flags = { "not-on-map" },
              acceleration = 0.005,
              action = {
                  {
                      type = "direct",
                      action_delivery = {
                          type = "instant",
                          target_effects = {
                              {
                                  type = "create-entity",
                                  entity_name = "atsword_majesty-explosion"
                              },

                              {
                                  type = "destroy-decoratives",
                                  from_render_layer = "decorative",
                                  to_render_layer = "object",
                                  include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
                                  include_decals = false,
                                  invoke_decorative_trigger = true,
                                  decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
                                  radius = 2.25 -- large radius for demostrative purposes
                              }
                          }
                      }
                  },
                  {
                      type = "area",
                      radius = 6.5,
                      action_delivery = {
                          type = "instant",
                          target_effects = {
                              {
                                  type = "damage",
                                  damage = { amount = 35, type = "explosion" }
                              }
                          }
                      }
                  }
              },
              light = { intensity = 0.5, size = 4 },
              animation = {
                  filename = "__base__/graphics/entity/grenade/grenade.png",
                  draw_as_glow = true,
                  frame_count = 16,
                  line_length = 8,
                  animation_speed = 0.250,
                  width = 26,
                  height = 28,
                  shift = util.by_pixel(1, 1),
                  priority = "high"

              },
              shadow = {
                  filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
                  frame_count = 16,
                  line_length = 8,
                  animation_speed = 0.250,
                  width = 26,
                  height = 20,
                  shift = util.by_pixel(2, 6),
                  priority = "high",
                  draw_as_shadow = true
              }
          },
          { type = "capsule",
            name = "atsword_majesty",
            localised_name = "觉醒",
            icon = mod_path .. "atsword_majesty/23.png",
            icon_size = 489,
            subgroup = "gun",
            order = "a-a",
            capsule_action = {
                type = "throw",
                attack_parameters = {
                    type = "projectile",
                    activation_type = "throw",
                    ammo_category = "grenade",
                    cooldown = 30,
                    projectile_creation_distance = 0.6,
                    range = 15,
                    ammo_type = {
                        category = "grenade",
                        target_type = "position",
                        action = {
                            {
                                type = "direct",
                                action_delivery = {
                                    type = "projectile",
                                    projectile = "atsword_majesty",
                                    starting_speed = 0.3
                                }
                            },
                            --{
                            --    type = "direct",
                            --    action_delivery = {
                            --        type = "instant",
                            --        target_effects = {
                            --            {
                            --                type = "play-sound",
                            --                sound = sounds.throw_projectile
                            --            }
                            --        }
                            --    }
                            --}
                        }
                    }
                }
            },
            stack_size = 1
          },

        }

)
