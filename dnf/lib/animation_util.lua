mod_path = "__DNF-mod__/graphics/"

function getStripes(path, max)

    local stripes = {}
    for i = 1, max do

        local s = {
            filename = mod_path .. path .. i .. ".png",
            width_in_frames = 1,
            height_in_frames = 1,
        }
        table.insert(stripes, s)
    end

    return stripes
end

function getStripesAnimation(path, max, width, height )
    local animation = {
        slice = 1,
        priority = "high",
        animation_speed = 0.2,
        width = width,
        height = height,
        frame_count = max,
        line_length = 1,
        draw_as_glow = true,
        direction_count = 1,
        --shift = util.by_pixel(0, -80),
        scale = 1,
        stripes = getStripes(path, max)

    }

    return animation
end
