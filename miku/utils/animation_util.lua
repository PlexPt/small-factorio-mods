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
            --shift = util.by_pixel(0, -80),
            slice = 1,
            stripes = getStripes(),
            scale = 1.0
        }
    })
end

function getStripes(path, min, max)

    local stripes = {}
    for i = min, max do

        local s = {
            filename = path .. i .. ".png",
            width_in_frames = 1,
            height_in_frames = 1,
        }
        table.insert(stripes, s)
    end

    return stripes
end

function getStripesAnimation(path, min, max, width, height, animation_speed, shift, scale)
    local animation = {
        slice = 1,
        animation_speed = animation_speed or 0.5,
        width = width,
        height = height,
        frame_count = max - min + 1,
        draw_as_glow = true,
        direction_count = 1,
        shift = shift or util.by_pixel(0, 0),
        scale = scale or 1,
        stripes = getStripes(path, min, max)

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

