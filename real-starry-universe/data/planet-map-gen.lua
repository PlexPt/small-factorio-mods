local MapGen = {}

function MapGen.normal()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end

function MapGen.mercury()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end

function MapGen.venus()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end

function MapGen.earth()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end

function MapGen.mars()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end

function MapGen.jupiter()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end

function MapGen.saturn()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end

function MapGen.uranus()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end

function MapGen.neptune()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end

function MapGen.pluto()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    return map_gen_setting
end


function MapGen.luna()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    -- 可根据需要自定义生成参数，例如地形多为岩石和灰色土地
    map_gen_setting.terrain_segmentation = "very-high"
    map_gen_setting.water = "none"
    map_gen_setting.starting_area = "small"
    map_gen_setting.autoplace_controls = {
        ["stone"] = { frequency = "high", size = "high", richness = "good" },
        ["uranium-ore"] = { frequency = "low", size = "small", richness = "poor" }
    }
    return map_gen_setting
end

return MapGen
