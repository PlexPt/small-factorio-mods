
-- 机器
local types = {
    "assembling-machine",
    "mining-drill",
    "storage-tank",
    "furnace",
    "generator",
    "lab",
    "radar",
    "container",
    "logistic-container",
    "reactor",
    "accumulator",
    "solar-panel",
    "boiler",
    "beacon",
    "pump",
    "burner-generator",
    "electric-energy-interface",
    "roboport",
    "rocket-silo",
    "rocket-silo-rocket",
    "fluid-turret",
    "ammo-turret",
    "electric-turret",
    "artillery-turret",
    "electric-pole",
    "power-switch",
    "simple-entity-with-owner",
}
--/sc game.player.print(game.player.selected.type) log(game.player.selected.type)

log("==========================================================check type==============================================================================")

local resulttype = ""

for type, machine in pairs(data.raw) do
    local one = type
    resulttype = resulttype .. one .. "\n"
end

log(resulttype)

log("==========================================================check raw==============================================================================")

--for _, type in pairs(types) do
--    log("==============================================================" .. type .. " check start==============================================================")
--    local machines = data.raw[type]
--    for k, machine in pairs(machines) do
--
--        log("")
--        log("data.raw[\"" .. type .. "\"][\"" .. k .. "\"]")
--        --log("data.raw[\"" .. type .. "\"][\"" .. k .. "\"] - Selection Box Size: " .. selection_box_width .. "x" .. selection_box_height)
--
--    end
--
--    log("==============================================================" .. type .. " end ==============================================================")
--
--end


local result = ""

for type, machine in pairs(data.raw) do
    local machines = data.raw[type]
    for name, machine in pairs(machines) do
        local one = ("data.raw[\"" .. type .. "\"][\"" .. name .. "\"]")
        result = result .. one .. "\n"
    end
end

log(result)

log("==========================================================check raw end==============================================================================")


local graphics_set = data.raw["mining-drill"]["electric-mining-drill"].graphics_set

loge(graphics_set, "graphics_set")




local function see_one_type(type)
    local result = ""
    local machines = data.raw[type]
    for name, machine in pairs(machines) do
        local one = ("data.raw[\"" .. type .. "\"][\"" .. name .. "\"]")
        result = result .. one .. "\n"
    end
    print(result)
end


















