IMG_PATH = "__lol-show__/graphics/"

local function getStripes()

    local stripes = {}
    for i = 1, 118 do

        local s = {
            filename = IMG_PATH .. "yasuo/" .. i .. ".png",
            width_in_frames = 1,
            height_in_frames = 1,
        }
        table.insert(stripes, s)
    end

    return stripes
end

data:extend({{
                  type = "animation",
                  name = "lol7",
                  size = 256,
                  width = 256,
                  height = 256,
                  frame_count = 118,
                  animation_speed = 0.5,
                  priority = "high",
                  shift = util.by_pixel(0, -80),
                  slice = 1,
                  stripes = getStripes(),
                  scale = 1.0
              },
              {
                  type = "custom-input",
                  name = "LOL7",
                  key_sequence = "LCTRL + H"
              }
})


