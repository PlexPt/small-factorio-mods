-- 电力设施缩放调整
local electricMiningDrill = data.raw["mining-drill"]["electric-mining-drill"]
minify(electricMiningDrill, 1 / 3)

local burnerMiningDrill = data.raw["mining-drill"]["burner-mining-drill"]
minify(burnerMiningDrill, 1 / 2)

local beaconEntity = data.raw["beacon"]["beacon"]
rescale_entity(beaconEntity, 1 / 3)

local heatExchanger = data.raw["boiler"]["heat-exchanger"]
rescale_entity(heatExchanger, 1 / 3)
scale_collision(heatExchanger)
fixHeatConnections(heatExchanger)
heatExchanger.fluid_box.pipe_connections = {
    { type = "input-output", position = { 1, 0 } },
    { type = "input-output", position = { -1, 0 } }
}
heatExchanger.output_fluid_box.pipe_connections[1].position = { 0, -0.7 }

local boilerEntity = data.raw["boiler"]["boiler"]
rescale_entity(boilerEntity, 1 / 3)
scale_collision(boilerEntity)

boilerEntity.fluid_box.pipe_connections = {
    { type = "input-output", position = { 1, 0 } },
    { type = "input-output", position = { -1, 0 } }
}
boilerEntity.output_fluid_box.pipe_connections[1].position = { 0, -0.7 }

local steamEngine = data.raw["generator"]["steam-engine"]
minify(steamEngine, 1 / 3)

if steamEngine.fluid_box then
    steamEngine.fluid_box.pipe_connections = {
        { type = "input-output", position = { 0, 1 } },
        { type = "input-output", position = { 0, -1 } }
    }
end

local steamTurbine = data.raw["generator"]["steam-turbine"]
minify(steamTurbine, 1 / 3)

if steamTurbine.fluid_box then
    steamTurbine.fluid_box.pipe_connections = {
        { type = "input-output", position = { 0, 1 } },
        { type = "input-output", position = { 0, -1 } }
    }
end

-- 抽油机设备调整
local pumpJack = data.raw["mining-drill"]["pumpjack"]
rescale_entity(pumpJack, 1 / 3)
scale_collision(pumpJack)
pumpJack.output_fluid_box.pipe_connections[1].positions = { { 0, -0.7 }, { 0.7, 0 }, { 0, 0.7 }, { -0.7, 0 } }

--fixPipeConnections(pumpjack)

-- 炉子和加工设备调整
-- 电炉
-- 钢炉
-- 石炉
local stoneFurnace = data.raw["furnace"]["stone-furnace"]
if check_mod("Krastorio2") then
    stoneFurnace = data.raw["assembling-machine"]["stone-furnace"]
end

loge(stoneFurnace, "stoneFurnace")
rescale_entity(stoneFurnace, 1 / 2)

local steelFurnace = data.raw["furnace"]["steel-furnace"]
if check_mod("Krastorio2") then
    steelFurnace = data.raw["assembling-machine"]["steel-furnace"]
end

rescale_entity(steelFurnace, 1 / 2)

local electricFurnace = data.raw["furnace"]["electric-furnace"]
rescale_entity(electricFurnace, 1 / 3)

-- 更多工业设备缩放调整
-- 装配机
-- 装配机1
-- 装配机2
-- 装配机3
-- 离心机
-- 化工厂
-- 炼油厂

local oilRefinery = data.raw["assembling-machine"]["oil-refinery"]
rescale_entity(oilRefinery, 1 / 5)
fixPipeConnections(oilRefinery)

local chemicalPlant = data.raw["assembling-machine"]["chemical-plant"]
rescale_entity(chemicalPlant, 1 / 3)
fixPipeConnections(chemicalPlant)
--table.insert(chemical.crafting_categories, "oil-processing")

local centrifugeEntity = data.raw["assembling-machine"]["centrifuge"]
rescale_entity(centrifugeEntity, 1 / 3)

local assemblingMachine1 = data.raw["assembling-machine"]["assembling-machine-1"]
minify(assemblingMachine1, 1 / 3)

local assemblingMachine2 = data.raw["assembling-machine"]["assembling-machine-2"]
rescale_entity(assemblingMachine2, 1 / 3)
fixPipeConnections(assemblingMachine2)

local assemblingMachine3 = data.raw["assembling-machine"]["assembling-machine-3"]
rescale_entity(assemblingMachine3, 1 / 3)
fixPipeConnections(assemblingMachine3)

local solarPanel = data.raw["solar-panel"]["solar-panel"]
rescale_entity(solarPanel, 1 / 3)

local accumulatorEntity = data.raw["accumulator"]["accumulator"]
rescale_entity(accumulatorEntity, 1 / 2)

rescale_entity(data.raw["power-switch"]["power-switch"], 1 / 2)

local nuclearReactor = data.raw["reactor"]["nuclear-reactor"]
rescale_entity(nuclearReactor, 1 / 5)
nuclearReactor.heat_buffer.connections = {
    { position = { 0, 0 }, direction = defines.direction.north },
    { position = { 0, 0 }, direction = defines.direction.east },
    { position = { 0, 0 }, direction = defines.direction.south },
    { position = { 0, 0 }, direction = defines.direction.west }
}

local radarEntity = data.raw["radar"]["radar"]
rescale_entity(radarEntity, 1 / 3)

local labEntity = data.raw["lab"]["lab"]
rescale_entity(labEntity, 1 / 3)

local storageTank = data.raw["storage-tank"]["storage-tank"]
rescale_entity(storageTank, 1 / 3)
storageTank.fluid_box.pipe_picture = pipe_pictures_hide
storageTank.fluid_box.pipe_connections = {
    { position = { 0, -1 } },
    { position = { 1, 0 } },
    { position = { 0, 1 } },
    { position = { -1, 0 } }
}

local roboportEntity = data.raw["roboport"]["roboport"]
rescale_entity(roboportEntity, 1 / 4)

local substationEntity = data.raw["electric-pole"]["substation"]
rescale_entity(substationEntity, 1 / 2)

local bigElectricPole = data.raw["electric-pole"]["big-electric-pole"]
rescale_entity(bigElectricPole, 1 / 2)

local artilleryTurret = data.raw["artillery-turret"]["artillery-turret"]
rescale_entity(artilleryTurret, 1 / 3)

local laserTurret = data.raw["electric-turret"]["laser-turret"]
rescale_entity(laserTurret, 1 / 2)

local gunTurret = data.raw["ammo-turret"]["gun-turret"]
rescale_entity(gunTurret, 1 / 2)

local flamethrowerTurret = data.raw["fluid-turret"]["flamethrower-turret"]
rescale_entity(flamethrowerTurret, 1 / 2)
scale_collision(flamethrowerTurret)
flamethrowerTurret.not_enough_fuel_indicator_light.size = 0.7
flamethrowerTurret.enough_fuel_indicator_light.size = 0.7
flamethrowerTurret.fluid_box.pipe_connections = {
    { position = { -1, 0 } },
    { position = { 1, 0 } }
}

local rocketSilo = data.raw["rocket-silo"]["rocket-silo"]
rescale_entity(rocketSilo, 1 / 9)
rocketSilo.hole_clipping_box = { { -1, -1 }, { 1, 1 } }
rocketSilo.silo_fade_out_start_distance = 1
rocketSilo.silo_fade_out_end_distance = 3

--    rocket_initial_offset = {0, 1.5},
--    rocket_rise_offset = {0, -3.5},
--    rocket_launch_offset = {0, -256},
--    rocket_render_layer_switch_distance = 7.5,
--    full_render_layer_switch_distance = 9,
--    effects_fade_in_start_distance = 4.5,
--    effects_fade_in_end_distance = 7.5,
--    shadow_fade_out_start_ratio = 0.25,
--    shadow_fade_out_end_ratio = 0.75,
--    rocket_visible_distance_from_center = 2.75,
--    rocket_above_wires_slice_offset_from_center = -3,
--    rocket_air_object_slice_offset_from_center = -5.5

local rocketSiloRocket = data.raw["rocket-silo-rocket"]["rocket-silo-rocket"]
rescale_entity(rocketSiloRocket, 1 / 9)
rocketSiloRocket.rocket_render_layer_switch_distance = 0
rocketSiloRocket.full_render_layer_switch_distance = 1
rocketSiloRocket.effects_fade_in_start_distance = 0
rocketSiloRocket.effects_fade_in_end_distance = 1
