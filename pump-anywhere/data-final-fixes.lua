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
        -- Ensure the fluid "lava" exists
        local lava_exists = data.raw["fluid"]["lava"] ~= nil

        -- 检查当前 tile 是否在 lavas 哈希表中，或者是否以 "volcanic-" 开头
        if lavas[tile.name] or string.find(tile.name, "^volcanic-") then
            if lava_exists then
                tile["fluid"] = "lava"
            else
                -- Fallback if "lava" does not exist
                tile["fluid"] = "water"
            end
        else
            tile["fluid"] = "water"
        end
    end
end

