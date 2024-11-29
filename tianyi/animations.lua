local characteranimations = {}
local animations_live = {}
local animations_dead = {}
local imgpath = "__tianyi__/images/"

local anims = {}

local function getDead()
    return {
        filename = imgpath .. "dead.png",
        width = 200,
        height = 200,
        --shift = util.by_pixel(0.0, -0.0),
        frame_count = 2,
        scale = 0.3,
    }
end
local function getRunning()
    return {
        filename = imgpath .. "running.png",
        width = 200,
        height = 200,
        --shift = util.by_pixel(0.0, -23.0),
        frame_count = 24,
        direction_count = 8,
        animation_speed = 0.8,
        scale = 0.3,
    }
end

local function getRunningGun()
    return {
        filename = imgpath .. "running-gun.png",
        width = 200,
        height = 200,
        --shift = util.by_pixel(0.0, -23.0),
        frame_count = 24,
        direction_count = 18,
        animation_speed = 0.8,
        scale = 0.3,
    }
end


local function getIdlePics()
  local ret = {}
    for i = 1, 255 do
      ret[#ret + 1] = string.format("%sidle/%s.png", imgpath, i)
    end
  return ret
end

local function getIdle()
    return {
        filenames = getIdlePics(),
        slice = 1,
        width = 200,
        height = 200,
        shift = util.by_pixel(-20.0, 0.0),
        frame_count = 255,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 1,
        animation_speed = 0.2,
        scale = 0.4,
    }
end

characteranimations["level1"] = {}

characteranimations["level1"]["dead"] = getDead()

characteranimations["level1"]["dead_shadow"] = nil,
{
    filename = imgpath .. "level1_dead_shadow.png",
    width = 50,
    height = 80,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 2,
    DRAWASSHADOW = true,

    hr_version = {
        filename = imgpath .. "level1_dead_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 2,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["dead_mask"] = nil,
{
    filename = imgpath .. "level1_dead_mask.png",
    width = 50,
    height = 80,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 2,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_dead_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 2,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["idle"] = getIdle()

characteranimations["level1"]["idle_mask"] = nil,
{
    filename = imgpath .. "level1_idle_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["idle_shadow"] = nil,
{
    filename = imgpath .. "level1_idle_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_idle_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["idle_gun"] = getIdle()

characteranimations["level1"]["idle_gun_mask"] = nil,
{
    filename = imgpath .. "level1_idle_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["idle_gun_shadow"] = nil,
{
    filename = imgpath .. "level1_idle_gun_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_idle_gun_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["mining_hands"] = getIdle()
characteranimations["level1"]["mining_hands_mask"] = nil,
{
    filename = imgpath .. "level1_mining_hands_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_hands_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["mining_hands_shadow"] = nil,
{
    filename = imgpath .. "level1_mining_hands_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_mining_hands_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["mining_tool"] = getIdle()
characteranimations["level1"]["mining_tool_mask"] = nil,
{
    filename = imgpath .. "level1_mining_tool_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.9,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_tool_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.9,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["mining_tool_shadow"] = nil,
{
    filename = imgpath .. "level1_mining_tool_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.9,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_mining_tool_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.9,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["running"] = getRunning()
characteranimations["level1"]["running_mask"] = nil,
{
    filename = imgpath .. "level1_running_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["running_shadow"] = nil,
{
    filename = imgpath .. "level1_running_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_running_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["running_gun"] = getRunningGun()
characteranimations["level1"]["running_gun_mask"] = nil,
{
    filename = imgpath .. "level1_running_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 18,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["running_gun_shadow"] = nil,
{
    filename = imgpath .. "level1_running_gun_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 18,
    animation_speed = 0.6,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_running_gun_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}

characteranimations["level2addon"] = {}

characteranimations["level2addon"]["dead"] = getDead()
characteranimations["level2addon"]["dead_mask"] = nil,
{
    filename = imgpath .. "level1_dead_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 2,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_dead_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 2,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["idle"] = getIdle()
characteranimations["level2addon"]["idle_mask"] = nil,
{
    filename = imgpath .. "level1_idle_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["idle_gun"] = getIdle()
characteranimations["level2addon"]["idle_gun_mask"] = nil,
{
    filename = imgpath .. "level1_idle_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["mining_hands"] = getIdle()
characteranimations["level2addon"]["mining_hands_mask"] = nil,
{
    filename = imgpath .. "level1_mining_hands_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_hands_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["mining_tool"] = getIdle()
characteranimations["level2addon"]["mining_tool_mask"] = nil,
{
    filename = imgpath .. "level1_mining_tool_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.9,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_tool_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.9,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["running"] = getRunning()
characteranimations["level2addon"]["running_mask"] = nil,
{
    filename = imgpath .. "level1_running_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["running_gun"] = getRunningGun()
characteranimations["level2addon"]["running_gun_mask"] = nil,
{
    filename = imgpath .. "level1_running_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 18,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}

characteranimations["level3addon"] = {}

characteranimations["level3addon"]["dead"] = getDead()
characteranimations["level3addon"]["dead_mask"] = nil,
{
    filename = imgpath .. "level1_dead_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 2,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_dead_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 2,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["idle"] = getIdle()
characteranimations["level3addon"]["idle_mask"] = nil,
{
    filename = imgpath .. "level1_idle_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["idle_gun"] = getIdle()
characteranimations["level3addon"]["idle_gun_mask"] = nil,
{
    filename = imgpath .. "level1_idle_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["mining_hands"] = getIdle()
characteranimations["level3addon"]["mining_hands_mask"] = nil,
{
    filename = imgpath .. "level1_mining_hands_mask.png",
    width = 50,
    height = 80,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_hands_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["mining_tool"] = getIdle()
characteranimations["level3addon"]["mining_tool_mask"] = nil,
{
    filename = imgpath .. "level1_mining_tool_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.9,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_tool_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.9,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["running"] = getRunning()
characteranimations["level3addon"]["running_mask"] = nil,
{
    filename = imgpath .. "level1_running_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["running_gun"] = getRunningGun()
characteranimations["level3addon"]["running_gun_mask"] = nil,
{
    filename = imgpath .. "level1_running_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 18,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}

anims.animations_live = {
    {
        idle = {
            layers = {
                characteranimations["level1"]["idle"],
                --characteranimations["level1"]["idle_mask"],
                --characteranimations["level1"]["idle_shadow"],
            }
        },
        idle_with_gun = {
            layers = {
                characteranimations["level1"]["idle_gun"],
                --characteranimations["level1"]["idle_gun_mask"],
                --characteranimations["level1"]["idle_gun_shadow"],
            }
        },
        mining_with_hands = {
            layers = {
                characteranimations["level1"]["mining_hands"],
                characteranimations["level1"]["mining_hands_mask"],
                characteranimations["level1"]["mining_hands_shadow"],
            }
        },
        mining_with_tool = {
            layers = {
                characteranimations["level1"]["mining_tool"],
                characteranimations["level1"]["mining_tool_mask"],
                characteranimations["level1"]["mining_tool_shadow"],
            }
        },
        running_with_gun = {
            layers = {
                characteranimations["level1"]["running_gun"],
                characteranimations["level1"]["running_gun_mask"],
                characteranimations["level1"]["running_gun_shadow"],
            }
        },
        running = {
            layers = {
                characteranimations["level1"]["running"],
                characteranimations["level1"]["running_mask"],
                characteranimations["level1"]["running_shadow"],
            }
        }
    },
    {

        armors = data.is_demo and { "light-armor" } or { "light-armor", "heavy-armor" },
        idle = {
            layers = {
                characteranimations["level2addon"]["idle"],
                characteranimations["level2addon"]["idle_mask"],
                characteranimations["level1"]["idle_shadow"],
            }
        },
        idle_with_gun = {
            layers = {
                characteranimations["level2addon"]["idle_gun"],
                characteranimations["level2addon"]["idle_gun_mask"],
                characteranimations["level1"]["idle_gun_shadow"],
            }
        },
        mining_with_hands = {
            layers = {
                characteranimations["level2addon"]["mining_hands"],
                characteranimations["level2addon"]["mining_hands_mask"],
                characteranimations["level1"]["mining_hands_shadow"],
            }
        },
        mining_with_tool = {
            layers = {
                characteranimations["level2addon"]["mining_tool"],
                characteranimations["level2addon"]["mining_tool_mask"],
                characteranimations["level1"]["mining_tool_shadow"],
            }
        },
        running_with_gun = {
            layers = {
                characteranimations["level2addon"]["running_gun"],
                characteranimations["level2addon"]["running_gun_mask"],
                characteranimations["level1"]["running_gun_shadow"],
            }
        },
        running = {
            layers = {
                characteranimations["level2addon"]["running"],
                characteranimations["level2addon"]["running_mask"],
                characteranimations["level1"]["running_shadow"],
            }
        }
    },
    {

        armors = data.is_demo and {} or { "modular-armor", "power-armor", "power-armor-mk2" },
        idle = {
            layers = {
                characteranimations["level3addon"]["idle"],
                characteranimations["level3addon"]["idle_mask"],
                characteranimations["level1"]["idle_shadow"],
            }
        },
        idle_with_gun = {
            layers = {
                characteranimations["level3addon"]["idle_gun"],
                characteranimations["level3addon"]["idle_gun_mask"],
                characteranimations["level1"]["idle_gun_shadow"],
            }
        },
        mining_with_hands = {
            layers = {
                characteranimations["level3addon"]["mining_hands"],
                characteranimations["level3addon"]["mining_hands_mask"],
                characteranimations["level1"]["mining_hands_shadow"],
            }
        },
        mining_with_tool = {
            layers = {
                characteranimations["level3addon"]["mining_tool"],
                characteranimations["level3addon"]["mining_tool_mask"],
                characteranimations["level1"]["mining_tool_shadow"],
            }
        },
        running_with_gun = {
            layers = {
                characteranimations["level3addon"]["running_gun"],
                characteranimations["level3addon"]["running_gun_mask"],
                characteranimations["level1"]["running_gun_shadow"],
            }
        },
        running = {
            layers = {
                characteranimations["level3addon"]["running"],
                characteranimations["level3addon"]["running_mask"],
                characteranimations["level1"]["running_shadow"],
            }
        }
    }
}

anims.animations_dead = {
    {
        layers = {
            characteranimations["level1"]["dead"],
            characteranimations["level1"]["dead_mask"],
            characteranimations["level1"]["dead_shadow"],
        }
    },
    {
        layers = {
            characteranimations["level2addon"]["dead"],
            characteranimations["level2addon"]["dead_mask"],
            characteranimations["level1"]["dead_shadow"],
        }
    },
    {
        layers = {
            characteranimations["level3addon"]["dead"],
            characteranimations["level3addon"]["dead_mask"],
            characteranimations["level1"]["dead_shadow"],
        }
    },
    {
        layers = {
            characteranimations["level3addon"]["dead"],
            characteranimations["level3addon"]["dead_mask"],
            characteranimations["level1"]["dead_shadow"],
        }
    }
}

return anims
--~ if ((data.raw["player"] ~= nil) and (data.raw["player"]["player"] ~= nil)) then
    --~ data.raw["player"]["player"]["animations"] = animations_live
--~ end

--~ if ((data.raw["character"] ~= nil) and (data.raw["character"]["character"] ~= nil)) then
    --~ data.raw["character"]["character"]["animations"] = animations_live
--~ end

--~ if ((data.raw["character-corpse"] ~= nil) and (data.raw["character-corpse"]["character-corpse"] ~= nil)) then
    --~ data.raw["character-corpse"]["character-corpse"]["pictures"] = animations_dead
--~ end
