local IMG_PATH = "__miku-bikini-swimsuit__/images/"
local util = require("util")

function getAnimationWithHr(s)
    local hr = util.table.deepcopy(s)
    s.hr_version = hr
    return s
end

function getSeqPics(prefix, max)
    local s = {}
    for i = 1, max do
        table.insert(s, IMG_PATH .. prefix .. i .. ".png")
    end
    return s
end
