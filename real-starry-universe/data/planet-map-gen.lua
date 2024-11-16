local MapGen = {}

-- 标准地球（Nauvis）生成设置，适用于类地行星或中性星球
function MapGen.normal()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    -- I assume this is nauvis generation, so this has been left as-is.
    return map_gen_setting
end

-- 水星：干燥、无水、贫矿
-- 水星：极端温差、陨石坑多、无大气、富含金属
function MapGen.mercury()
    local map_gen_setting = table.deepcopy(data.raw.planet.vulcanus.map_gen_settings)
    -- Both vulcanus and mercury are hot, so until a map generation settings property can be created specifically for mercury, this will work better than nauvis generation.

      -- Mercury is a rocky planet with high temperatures and no water
    --map_gen_setting.water = "none" -- 无水覆盖
    --map_gen_setting.terrain_segmentation = "very-low" -- 地形多为光滑、平坦的区域
    -- 金属矿物丰富，特别是铁
    --map_gen_setting.autoplace_controls = {
    --    ["iron-ore"] = { frequency = "very-high", size = "big", richness = "very-good" },
    --    ["copper-ore"] = { frequency = "high", size = "medium", richness = "good" },
    --    ["stone"] = { frequency = "high", size = "very-big", richness = "very-good" },
    --    ["uranium-ore"] = { frequency = "low", size = "small", richness = "poor" },
    --    ["water"] = { frequency = "none", size = "none", richness = "none" }
    --}
    --
    --map_gen_setting.aux_climate_control = true
    --map_gen_setting.moisture_climate_control = false

    return map_gen_setting
end

-- 金星：致密大气、极端高温、火山活动频繁、高密度地形
function MapGen.venus()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    -- There isn't a planet in-game that similar to venus, so should be left as-is for now.

    map_gen_setting.terrain_segmentation = "very-high"
    map_gen_setting.starting_area = "very-small"

    -- 火山和岩浆地形
    map_gen_setting.autoplace_settings.decorative.settings = {
        ["cracked-mud-decal"] = {},
        ["dark-mud-decal"] = {},
        ["medium-rock"] = {}
    }

    --map_gen_setting.terrain_segmentation = "very-high" -- 地形多为复杂丘陵和断层
    --map_gen_setting.water = "none" -- 无水覆盖
    --map_gen_setting.autoplace_controls = {
    --    ["stone"] = { frequency = "high", size = "high", richness = "good" },
    --    ["iron-ore"] = { frequency = "medium", size = "small", richness = "poor" },
    --    ["copper-ore"] = { frequency = "medium", size = "medium", richness = "average" }
    --}

    -- 矿物分布受火山活动影响
    map_gen_setting.autoplace_controls = {
        ["stone"] = { frequency = "very-high", size = "very-big", richness = "very-good" },
        ["iron-ore"] = { frequency = "high", size = "medium", richness = "good" },
        ["copper-ore"] = { frequency = "high", size = "medium", richness = "good" },
        ["crude-oil"] = { frequency = "very-high", size = "very-big", richness = "very-good" },
        ["water"] = { frequency = "none", size = "none", richness = "none" },
    }

    -- 主要是火山岩地形
    map_gen_setting.autoplace_settings.tile.settings = {
        ["red-desert-0"] = {},
        ["red-desert-1"] = {},
        ["dirt-7"] = {},
        ["dirt-6"] = {}
    }

    map_gen_setting.aux_climate_control = true
    map_gen_setting.moisture_climate_control = false
    return map_gen_setting
end

-- 地球：标准设置, 生命宜居、水资源丰富
function MapGen.earth()
    -- Nauvis-based generation is perfectly fine
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    -- This is completely fine as-is, earth is very similar to nauvis.
    -- 保持完整的nauvis设置，因为它已经很好地模拟了地球环境
    return map_gen_setting
end

-- 火星：红色沙漠、古代河道、极地冰盖
-- 火星：干燥、贫水，矿石资源丰富
function MapGen.mars()
    -- There isn't a planet in-game that similar to mars
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    --map_gen_setting.water = "very-low" -- 几乎没有水源
    --map_gen_setting.terrain_segmentation = "medium" -- 地形平坦、沙地覆盖
    --map_gen_setting.autoplace_controls = {
    --    ["iron-ore"] = { frequency = "high", size = "large", richness = "good" },
    --    ["copper-ore"] = { frequency = "high", size = "medium", richness = "average" },
    --    ["uranium-ore"] = { frequency = "low", size = "small", richness = "poor" }
    --}

    map_gen_setting.water = "very-low" -- 仅在极地和深谷有冰
    map_gen_setting.terrain_segmentation = "high" -- 火星峡谷和山脉
    map_gen_setting.starting_area = "normal"

    -- 火星特有的地表特征
    map_gen_setting.autoplace_settings.decorative.settings = {
        ["red-desert-decal"] = {},
        ["sand-dune-decal"] = {},
        ["medium-rock"] = {},
        ["small-rock"] = {}
    }

    -- 丰富的铁矿（红色来源）和其他矿物
    map_gen_setting.autoplace_controls = {
        ["iron-ore"] = { frequency = "very-high", size = "very-big", richness = "very-good" },
        ["copper-ore"] = { frequency = "high", size = "big", richness = "good" },
        ["stone"] = { frequency = "high", size = "big", richness = "good" },
        ["uranium-ore"] = { frequency = "low", size = "medium", richness = "poor" },
        ["crude-oil"] = { frequency = "medium", size = "medium", richness = "regular" },
        ["water"] = { frequency = "very-low", size = "small", richness = "poor" }
    }

    -- 红色沙漠为主
    map_gen_setting.autoplace_settings.tile.settings = {
        ["red-desert-0"] = {},
        ["red-desert-1"] = {},
        ["red-desert-2"] = {},
        ["red-desert-3"] = {},
        ["sand-1"] = {},
        ["sand-2"] = {},
        ["sand-3"] = {},
        water = {} -- 极地冰盖
    }

    map_gen_setting.aux_climate_control = true
    map_gen_setting.moisture_climate_control = false
    return map_gen_setting
end

-- 木星：没有固态表面，仅供空间资源探索
-- 木星：气态巨星，特殊大气采集站
function MapGen.jupiter()
    -- Not sure about this one, jupiter is a gas giant and irl doesn't have a surface.
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    -- Jupiter is a gas giant, modify resources accordingly
    --map_gen_setting.starting_area = "none"
    --map_gen_setting.autoplace_controls = {} -- 禁止资源生成

    -- 气态巨星没有固态表面，设置特殊的资源采集环境
    map_gen_setting.starting_area = "none"
    map_gen_setting.terrain_segmentation = "none"

    -- 移除所有常规资源点
    map_gen_setting.autoplace_controls = {
        ["crude-oil"] = { frequency = "very-high", size = "very-big", richness = "very-good" },
        ["water"] = { frequency = "none", size = "none", richness = "none" }
    }

    -- 特殊大气环境
    map_gen_setting.autoplace_settings.tile.settings = {
        ["red-desert-0"] = {}
    }

    map_gen_setting.aux_climate_control = true
    map_gen_setting.moisture_climate_control = false

    return map_gen_setting
end

-- 土星：类似木星，无固态表面，拥有环带资源
-- 土星：气态巨星，密集环系统
function MapGen.saturn()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings) -- Not sure about this one, saturn is a gas giant and irl doesn't have a surface.


    -- 类似木星的设置，但增加环系统特征
    map_gen_setting.starting_area = "none"
    map_gen_setting.water = "none"
    map_gen_setting.terrain_segmentation = "none"

    -- 环系统中的冰和岩石碎片
    map_gen_setting.autoplace_controls = {
        ["stone"] = { frequency = "very-high", size = "very-big", richness = "very-good" },
        ["iron-ore"] = { frequency = "high", size = "big", richness = "good" },
        ["water"] = { frequency = "high", size = "big", richness = "good" }
    }

    map_gen_setting.aux_climate_control = true
    map_gen_setting.moisture_climate_control = true

    return map_gen_setting
end

-- 天王星：远离太阳，低资源密度
-- 天王星：倾斜的冰巨星
function MapGen.uranus()
    -- Not sure about this one, uranus is a gas giant and irl doesn't have a surface.
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    --map_gen_setting.terrain_segmentation = "low" -- 地形非常简单
    --map_gen_setting.water = "none"
    --map_gen_setting.autoplace_controls = {
    --    ["iron-ore"] = { frequency = "low", size = "small", richness = "poor" },
    --    ["copper-ore"] = { frequency = "low", size = "small", richness = "poor" },
    --    ["stone"] = { frequency = "low", size = "medium", richness = "poor" }
    --}

    map_gen_setting.water = "very-high" -- 大量的冰
    map_gen_setting.terrain_segmentation = "low"

    -- 主要是冰和少量矿物
    map_gen_setting.autoplace_controls = {
        ["stone"] = { frequency = "low", size = "small", richness = "poor" },
        ["iron-ore"] = { frequency = "very-low", size = "small", richness = "poor" },
        ["water"] = { frequency = "very-high", size = "very-big", richness = "very-good" }
    }

    map_gen_setting.aux_climate_control = true
    map_gen_setting.moisture_climate_control = true

    return map_gen_setting
end

-- 海王星：寒冷环境，稀疏资源
-- 海王星：风暴活跃的冰巨星
function MapGen.neptune()
    -- Not sure about this one, neptune is a gas giant and irl doesn't have a surface.
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)

    -- 类似天王星，但有更活跃的大气动力学
    map_gen_setting.water = "very-high"
    map_gen_setting.terrain_segmentation = "high"

    map_gen_setting.autoplace_controls = {
        ["stone"] = { frequency = "low", size = "small", richness = "poor" },
        ["crude-oil"] = { frequency = "high", size = "big", richness = "good" },
        ["water"] = { frequency = "very-high", size = "very-big", richness = "very-good" }
    }

    map_gen_setting.aux_climate_control = true
    map_gen_setting.moisture_climate_control = true

    return map_gen_setting
end

-- 冥王星：矮行星、极寒环境，特定稀有矿物
function MapGen.pluto()
    -- Both aquilo and pluto are cold, so until a map generation settings property can be created specifically for pluto, this will work better than nauvis generation.
    local map_gen_setting = table.deepcopy(data.raw.planet.aquilo.map_gen_settings)

    --map_gen_setting.water = "high" -- 冰面覆盖
    --map_gen_setting.terrain_segmentation = "medium"
    --map_gen_setting.starting_area = "small"
    --
    ---- 稀有的冰下矿物
    --map_gen_setting.autoplace_controls = {
    --    ["stone"] = { frequency = "medium", size = "small", richness = "poor" },
    --    ["uranium-ore"] = { frequency = "high", size = "medium", richness = "good" },
    --    ["water"] = { frequency = "very-high", size = "very-big", richness = "very-good" }
    --}
    --
    ---- 冰原地形
    --map_gen_setting.autoplace_settings.tile.settings = {
    --    water = {},
    --    deepwater = {},
    --    ["dirt-1"] = {},
    --    ["dirt-2"] = {}
    --}

    return map_gen_setting
end

-- 月球：陨石坑密布、稀有资源
--铜矿:
--目前在月球上尚未发现大规模的铜矿。虽然一些月球样本中检测到了微量的铜，但这些含量非常低，不足以构成经济上有价值的矿床。
--铁矿:
--月球表面确实含有大量的铁，但主要以氧化铁的形式存在于矿物中，如辉石、橄榄石和钛铁矿。这些矿物中的铁含量较高，但提取和加工这些铁矿石的技术挑战较大。
--煤矿:
--月球上没有已知的煤炭资源。煤炭是由古代植物在特定地质条件下形成的有机沉积物，而月球缺乏这些条件。
--石油:
--月球上没有已知的石油资源。石油是由古代生物遗骸在地质作用下转化而成的，而月球缺乏生命存在的条件，因此不可能有石油。
--铀矿:
--月球上可能存在微量的铀，但尚未发现大规模的铀矿床。一些月球样本中检测到了痕量的铀，但这些含量非常低，不足以构成经济上有价值的矿床。

--但以下几种资源可能在未来的月球探索和开发中具有重要价值：
--水冰:
--月球南极和北极的永久阴影区中可能含有大量水冰。水可以分解成氢和氧，用于生产火箭燃料和提供生命支持系统所需的氧气和水。
--氦-3:
--月球表层土壤（月壤）中含有丰富的氦-3，这是一种潜在的核聚变燃料。氦-3在地球上非常稀少，但在月球上可能相对丰富。
-- 月球：多岩石，极度贫水
function MapGen.luna()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    -- 可根据需要自定义生成参数，例如地形多为岩石和灰色土地
    -- Great! This is the kind of effort which should be done for the other space objects.
    --map_gen_setting.terrain_segmentation = "very-high"
    --map_gen_setting.water = "none"
    --map_gen_setting.starting_area = "small"
    --map_gen_setting.autoplace_controls = {
    --    ["stone"] = { frequency = "high", size = "high", richness = "very-good" },
    --    ["iron-ore"] = { frequency = "medium", size = "medium", richness = "good" },
    --    ["uranium-ore"] = { frequency = "low", size = "small", richness = "poor" }
    --}



    map_gen_setting.terrain_segmentation = "very-high" -- 陨石坑地形
    map_gen_setting.water = "very-low" -- 极地可能有冰
    map_gen_setting.starting_area = "small"

    -- 月球特有的地表特征
    map_gen_setting.autoplace_settings.decorative.settings = {
        ["medium-rock"] = {},
        ["small-rock"] = {},
        ["tiny-rock"] = {},
        ["sand-dune-decal"] = {}
    }

    -- 月球特有资源
    map_gen_setting.autoplace_controls = {
        ["stone"] = { frequency = "very-high", size = "big", richness = "very-good" },
        ["iron-ore"] = { frequency = "high", size = "medium", richness = "good" },
        ["uranium-ore"] = { frequency = "high", size = "small", richness = "good" }, -- 代表氦-3资源
        ["water"] = { frequency = "very-low", size = "small", richness = "poor" } -- 极地冰川
    }

    -- 月球地形
    map_gen_setting.autoplace_settings.tile.settings = {
        ["dirt-1"] = {},
        ["dirt-2"] = {},
        ["dirt-3"] = {},
        ["dirt-4"] = {},
        water = {} -- 极地冰
    }

    return map_gen_setting
end

return MapGen
