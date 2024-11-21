local pump = data.raw['offshore-pump']['offshore-pump']
if not pump then
    return
end

pump.tile_buildability_rules = nil;

local lavas = {
    ["lava"] = true,
    ["lava-hot"] = true,
    ["volcanic-cracks"] = true,
    ["volcanic-cracks-hot"] = true,
    ["volcanic-cracks-warm"] = true,
    ["volcanic-smooth-stone"] = true,
    ["volcanic-smooth-stone-warm"] = true,
}

for k, tile in pairs(data.raw["tile"]) do
    if tile and not tile["fluid"] then
        -- 检查当前 tile 是否在 lavas 哈希表中，或者是否以 "volcanic-" 开头
        if lavas[tile.name] or string.find(tile.name, "^volcanic-") then
            tile["fluid"] = "lava"
        else
            tile["fluid"] = "water"
        end
    end
end

