--debug
--if true then
--
--    return
--end

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

local function check_all_type()
    log("==========================================================check type==============================================================================")

    local resulttype = ""

    for type, machine in pairs(data.raw) do
        local one = type
        resulttype = resulttype .. one .. "\n"
    end

    print(resulttype)
end


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

local function see_all_type()
    log("==========================================================check raw==============================================================================")

    local result = ""

    for type, machine in pairs(data.raw) do
        local machines = data.raw[type]
        for name, machine in pairs(machines) do
            local one = ("data.raw[\"" .. type .. "\"][\"" .. name .. "\"]")
            result = result .. one .. "\n"
        end
    end
    print(result)
    log("==========================================================check raw end==============================================================================")
end


--local electricMiningDrill = data.raw["mining-drill"]["electric-mining-drill"].graphics_set

--loge(electricMiningDrill, "electricMiningDrill graphics_set")
--local boilerEntity = data.raw["boiler"]["boiler"]
--loge(boilerEntity.fluid_box.pipe_connections  , "pipe_connections  ")
--loge(boilerEntity.output_fluid_box.pipe_connections  , "output_fluid_box pipe_connections  ")

--local assemblingMachine1 = data.raw["assembling-machine"]["assembling-machine-2"]
--loge(assemblingMachine1, "assemblingMachine2")

local oilRefinery = data.raw["assembling-machine"]["oil-refinery"]
loge(oilRefinery, "oilRefinery")

local function see_one_type(type)
    local result = ""
    local machines = data.raw[type]
    for name, machine in pairs(machines) do
        local one = ("data.raw[\"" .. type .. "\"][\"" .. name .. "\"]")
        result = result .. one .. "\n"
    end
    print(result)
end




















