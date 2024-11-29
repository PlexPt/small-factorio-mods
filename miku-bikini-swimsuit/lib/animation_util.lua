local util = require("util")

function getAnimationWithHr(s)
    return s
end

function getSeqPics(prefix, max)
    local s = {}
    for i = 1, max do
        table.insert(s, prefix .. i .. ".png")
    end
    return s
end

function getSeqPicsRange(prefix, min, max)
    local s = {}
    for i = min, max do
        table.insert(s, prefix .. i .. ".png")
    end
    return s
end
