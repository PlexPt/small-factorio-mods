local common = require('lib.common')

local IMG_PATH = common.IMG_PATH

local util = require("util")

function getAnimationWithHr(s)
    return s
end

function getSeqPics(prefix, max)
    local s = {}
    for i = 1, max do
        table.insert(s, IMG_PATH .. prefix .. i .. ".png")
    end
    return s
end
