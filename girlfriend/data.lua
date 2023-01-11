require("config")

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

--rendering.draw_animation { animation = name,
--            target = player.character,
--            target_offset = { 0, -5 },
--            surface = player.surface,
--            animation_speed = animation_speed or 1,
--            animation_offset = animation_offset or 0, }
data:extend({
    {
        type = "sprite",
        name = "girlfriend_button",
        filename = "__girlfriend__/graphics/girlfriend/head.png",
        priority = "extra-high-no-scale",
        width = 225,
        height = 225
    },
    {
        type = "animation",
        name = "animation-laurel",
        slice = 1,
        animation_speed = 0.5,
        width = 498,
        height = 309,
        frame_count = 72,
        draw_as_glow = true,
        direction_count = 1,
        shift = util.by_pixel(0, 0),
        scale = 1,
        stripes = getStripes("__girlfriend__/graphics/laurel/laurel_", 0, 71)
    }
})

require("datas/groups")
require("datas/items")
require("datas/compilatron")

if mods["genshin-impact-skin"] then
    require("datas/genshen")
end

if mods["miku-bikini-swimsuit"] then
    require("datas/miku")
end

if mods["tianyi"] then
    require("datas/tianyi")
end

