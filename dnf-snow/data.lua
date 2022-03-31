local characteranimations = {}
local animations_live = {}
local animations_dead = {}
local imgpath = "__dnf-snow__/images/"

local function getIdlePics(max)
    local s = {}
    for i = 1, max do
        table.insert(s, imgpath .. "idle/" .. i .. ".png")
    end
    return s
end

local function getRunningPics(max)
    local s = {}
    for k = 1, 8 do
        for i = 1, max do
            table.insert(s, imgpath .. k .. "/" .. i .. ".png")
        end
    end
    return s
end

local function getRunningGunPics(max)
    local s = {}
    local t = {
        a1 = 1,
        a2 = 1,
        a3 = 1,
        a4 = 2,
        a5 = 2,
        a6 = 2,
        a7 = 2,
        a8 = 3,
        a9 = 3,
        a29 = 3,
        a28 = 3,
        a27 = 4,
        a26 = 4,
        a25 = 4,
        a24 = 4,
        a23 = 5,
        a22 = 5,
        a21 = 5,
    }
    for _, k in pairs(t) do
        for i = 1, max do
            table.insert(s, imgpath .. k .. "/" .. i .. ".png")
        end
    end
    return s
end

local function getDead()
    return {
        filename = imgpath .. "dead.png",
        width = 200,
        height = 200,
        shift = util.by_pixel(0.0, -10.0),
        frame_count = 2,
        scale = 0.5,
        hr_version = {
            filename = imgpath .. "dead.png",
            width = 200,
            height = 200,
            shift = util.by_pixel(0.0, -10.0),
            frame_count = 2,
            scale = 0.5,
        }
    }
end
local function getRunning()
    return {
        filenames = getRunningPics(21),
        width = 400,
        height = 400,
        shift = util.by_pixel(0.0, -20.0),
        frame_count = 21,
        slice = 1,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 8,
        animation_speed = 0.3,
        scale = 0.3,
        hr_version = {
            filenames = getRunningPics(21),
            width = 400,
            height = 400,
            shift = util.by_pixel(0.0, -20.0),
            frame_count = 21,
            slice = 1,
            line_length = 1,
            lines_per_file = 1,
            direction_count = 8,
            animation_speed = 0.3,
            scale = 0.3,
        }
    }
end

local function getRunningGun()
    return {
        filenames = getRunningGunPics(21),
        width = 400,
        height = 400,
        slice = 1,
        shift = util.by_pixel(0.0, -20.0),
        frame_count = 21,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 18,
        animation_speed = 0.3,
        scale = 0.3,
        hr_version = {
            filenames = getRunningGunPics(21),
            width = 400,
            height = 400,
            slice = 1,
            shift = util.by_pixel(0.0, -20.0),
            frame_count = 21,
            line_length = 1,
            lines_per_file = 1,
            direction_count = 18,
            animation_speed = 0.3,
            scale = 0.3,
        }
    }
end

local function getIdle()
    return {
        filenames = getIdlePics(72),
        slice = 1,
        width = 400,
        height = 400,
        shift = util.by_pixel(0.0, -20.0),
        frame_count = 18,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 4,
        animation_speed = 0.5,
        scale = 0.3,
        hr_version = {
            filenames = getIdlePics(72),
            slice = 1,
            width = 400,
            height = 400,
            shift = util.by_pixel(0.0, -20.0),
            frame_count = 18,
            line_length = 1,
            lines_per_file = 1,
            direction_count = 4,
            animation_speed = 0.5,
            scale = 0.3,
        }
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

animations_live = {
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

animations_dead = {
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
    }
}

if ((data.raw["player"] ~= nil) and (data.raw["player"]["player"] ~= nil)) then
    data.raw["player"]["player"]["animations"] = animations_live
end

if ((data.raw["character"] ~= nil) and (data.raw["character"]["character"] ~= nil)) then
    data.raw["character"]["character"]["animations"] = animations_live
end

if ((data.raw["character-corpse"] ~= nil) and (data.raw["character-corpse"]["character-corpse"] ~= nil)) then
    data.raw["character-corpse"]["character-corpse"]["pictures"] = animations_dead
end

