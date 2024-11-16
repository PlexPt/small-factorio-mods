local MapGen = {}

function MapGen.normal()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings) -- I assume this is nauvis generation, so this has been left as-is.
    return map_gen_setting
end

function MapGen.mercury()
    local map_gen_setting = table.deepcopy(data.raw.planet.vulcanus.map_gen_settings) -- Both vulcanus and mercury are hot, so until a map generation settings property can be created specifically for mercury, this will work better than nauvis generation.
    return map_gen_setting
end

function MapGen.venus()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings) -- There isn't a planet in-game that similar to venus, so should be left as-is for now.
    return map_gen_setting
end

function MapGen.earth()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings) -- This is completely fine as-is, earth is very similar to nauvis.
    return map_gen_setting
end

function MapGen.mars()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings) -- There isn't a planet in-game that similar to mars, so should be left as-is for now.
    return map_gen_setting
end

function MapGen.jupiter()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings) -- Not sure about this one, jupiter is a gas giant and irl doesn't have a surface.
    return map_gen_setting
end

function MapGen.saturn()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings) -- Not sure about this one, saturn is a gas giant and irl doesn't have a surface.
    return map_gen_setting
end

function MapGen.uranus()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings) -- Not sure about this one, uranus is a gas giant and irl doesn't have a surface.
    return map_gen_setting
end

function MapGen.neptune()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings) -- Not sure about this one, neptune is a gas giant and irl doesn't have a surface.
    return map_gen_setting
end

function MapGen.pluto()
    local map_gen_setting = table.deepcopy(data.raw.planet.aquilo.map_gen_settings) -- Both aquilo and pluto are cold, so until a map generation settings property can be created specifically for pluto, this will work better than nauvis generation.
    return map_gen_setting
end


function MapGen.luna()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    -- 可根据需要自定义生成参数，例如地形多为岩石和灰色土地
    -- Great! This is the kind of effort which should be done for the other space objects.
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
