local ConstEnum = {}
ConstEnum.graphics = "__flying-sword__/graphics"

function create_simple(name, path, frame_count)

    data:extend({
        {
            type = "animation",
            name = name,
            size = 256,
            width = 256,
            height = 256,
            frame_count = 118,
            animation_speed = 0.5,
            priority = "high",
            slice = 1,
            stripes = getStripes(),
            scale = 1.0
        }
    })
end

function getStripes(path, max)

    local stripes = {}
    for i = 1, max do

        local s = {
            filename = ConstEnum.graphics .. "/" .. path .. i .. ".png",
            width_in_frames = 1,
            height_in_frames = 1,
        }
        table.insert(stripes, s)
    end

    return stripes
end

function getStripesAnimation(path, max, width, height, animation_speed, shift, scale)
    local animation = {
        slice = 1,
        animation_speed = animation_speed or 0.5,
        width = width,
        height = height,
        frame_count = max,
        draw_as_glow = true,
        direction_count = 1,
        shift = shift or util.by_pixel(0, 0),
        scale = scale or 1,
        stripes = getStripes(path, max)

    }

    return animation
end

function getStripesAnimation4Way(path, max, width, height, animation_speed, shift)
    local animation = {
        slice = 1,
        priority = "high",
        animation_speed = animation_speed or 0.5,
        width = width,
        height = height,
        frame_count = max,
        draw_as_glow = true,
        direction_count = 4,
        shift = shift or util.by_pixel(0, 0),
        scale = 1,
        stripes = getStripes(path, 4 * max)

    }
    return animation
end

function getStripesAnimation4Way1(path, max, width, height, animation_speed, shift)

    return {
        north = {
            filename = ConstEnum.graphics .. "/" .. path .. "1.png",
            priority = "high",
            width = 400,
            height = 400,
            frame_count = 1,
            line_length = 1,
            shift = shift or util.by_pixel(0, 0),
            animation_speed = animation_speed or 0.5,
            scale = 1,
        },
        east = {
            filename = ConstEnum.graphics .. "/" .. path .. "2.png",
            priority = "high",
            width = 400,
            height = 400,
            frame_count = 1,
            line_length = 1,
            shift = shift or util.by_pixel(0, 0),
            animation_speed = animation_speed or 0.5,
            scale = 1,

        },
        south = {
            filename = ConstEnum.graphics .. "/" .. path .. "3.png",
            priority = "high",
            width = 400,
            height = 400,
            frame_count = 1,
            line_length = 1,
            shift = shift or util.by_pixel(0, 0),
            animation_speed = animation_speed or 0.5,
            scale = 1,

        },
        west = {
            filename = ConstEnum.graphics .. "/" .. path .. "4.png",
            priority = "high",
            width = 400,
            height = 400,
            frame_count = 1,
            line_length = 1,
            shift = shift or util.by_pixel(0, 0),
            animation_speed = animation_speed or 0.5,
            scale = 1,

        },
    }
end
