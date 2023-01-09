local util = require("util")
local result = {}

function getAnimationWithHr(s)
    local hr = util.table.deepcopy(s)
    s.hr_version = hr
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

local function getHr(s)
    return getAnimationWithHr(s)
end

local function getIdlePics(min, max, IMG_PATH)
    local s = getSeqPicsRange(IMG_PATH, min, max)
    return s
end

local function getRunningPics(max, IMG_PATH)
    local s = {}
    for i = 1, max do
        table.insert(s, IMG_PATH .. i .. ".png")
    end
    return s
end
local function getRunningGunPics(max, IMG_PATH)
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
            local from = (k - 1) * max
            local name = i + from
            table.insert(s, IMG_PATH .. name .. ".png")
        end
    end
    return s
end

local function getDead(IMG_PATH)
    local s = {
        width = 400,
        height = 400,
        shift = { 0, -4 },
        frame_count = 2,
        scale = 1,
        stripes = {
            {
                filename = IMG_PATH .. "274.png",
                width_in_frames = 1,
                height_in_frames = 1,
            },
            {
                filename = IMG_PATH .. "275.png",
                width_in_frames = 1,
                height_in_frames = 1,
            }, }
    }
    return getHr(s)
end

local function getRunning(IMG_PATH)
    local s = {
        filenames = getRunningPics(160, IMG_PATH),
        width = 400,
        height = 400,
        shift = { 0, -4 },
        frame_count = 20,
        slice = 1,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 8,
        animation_speed = 0.5,
        scale = 1,
    }
    return getHr(s)
end

local function getRunningGun(IMG_PATH)
    local s = {
        filenames = getRunningGunPics(20, IMG_PATH),
        width = 400,
        height = 400,
        slice = 1,
        shift = { 0, -4 },
        frame_count = 20,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 18,
        animation_speed = 0.5,
        scale = 1,
    }
    return getHr(s)

end

local function getIdle(IMG_PATH)
    local s = {
        filenames = getIdlePics(161, 272, IMG_PATH),
        slice = 1,
        width = 400,
        height = 400,
        shift = { 0, -4 },
        frame_count = 28,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 4,
        animation_speed = 0.5,
        scale = 1,
    }
    return getHr(s)
end

local function getMining(imgPath)
    return getIdle(imgPath)
end

result.getIdle = getIdle
result.getRunning = getRunning

return result
