-- 电力
local drill = data.raw["mining-drill"]["electric-mining-drill"]
minify(drill, 1 / 3)

local entity2 = data.raw["mining-drill"]["burner-mining-drill"]
minify(entity2, 1 / 2)

local beacon = data.raw["beacon"]["beacon"]
rescale_entity(beacon, 1 / 3)

local heat = data.raw["boiler"]["heat-exchanger"]
rescale_entity(heat, 1 / 3)
scale_collision(heat)
fixHeatConnections(heat)
heat.fluid_box.pipe_connections = {
    { type = "input-output", position = { 1, 0 } },
    { type = "input-output", position = { -1, 0 } }
}
heat.output_fluid_box.pipe_connections[1].position = { 0, -0.7 }

local boiler = data.raw["boiler"]["boiler"]
rescale_entity(boiler, 1 / 3)
scale_collision(boiler)

boiler.fluid_box.pipe_connections = {
    { type = "input-output", position = { 1, 0 } },
    { type = "input-output", position = { -1, 0 } }
}
boiler.output_fluid_box.pipe_connections[1].position = { 0, -0.7 }

local steam = data.raw["generator"]["steam-engine"]
minify(steam, 1 / 3)

if steam.fluid_box then
    steam.fluid_box.pipe_connections = {
        { type = "input-output", position = { 0, 1 } },
        { type = "input-output", position = { 0, -1 } }
    }
end

local steam2 = data.raw["generator"]["steam-turbine"]
minify(steam2, 1 / 3)

if steam2.fluid_box then
    steam2.fluid_box.pipe_connections = {
        { type = "input-output", position = { 0, 1 } },
        { type = "input-output", position = { 0, -1 } }
    }
end



-- 抽油机
local pumpjack = data.raw["mining-drill"]["pumpjack"]
rescale_entity(pumpjack, 1 / 3)
scale_collision(pumpjack)
pumpjack.output_fluid_box.pipe_connections[1].positions = { { 0, -0.7 }, { 0.7, 0 }, { 0, 0.7 }, { -0.7, 0 } }

--fixPipeConnections(pumpjack)

--furnace
--electric-furnace
--steel-furnace
--stone-furnace

local stonefurnace = data.raw["furnace"]["stone-furnace"]
if check_mod("Krastorio2") then
    stonefurnace = data.raw["assembling-machine"]["stone-furnace"]
end

loge(stonefurnace, "stonefurnace")
rescale_entity(stonefurnace, 1 / 2)

local steelfurnace = data.raw["furnace"]["steel-furnace"]
if check_mod("Krastorio2") then
    steelfurnace = data.raw["assembling-machine"]["steel-furnace"]
end

rescale_entity(steelfurnace, 1 / 2)

local electricfurnace = data.raw["furnace"]["electric-furnace"]
rescale_entity(electricfurnace, 1 / 3)

--assembling-machine
--assembling-machine-1
--assembling-machine-2
--assembling-machine-3
--centrifuge
--chemical-plant
--oil-refinery

local refinery = data.raw["assembling-machine"]["oil-refinery"]
rescale_entity(refinery, 1 / 5)
fixPipeConnections(refinery)

local chemical = data.raw["assembling-machine"]["chemical-plant"]
rescale_entity(chemical, 1 / 3)
fixPipeConnections(chemical)
--table.insert(chemical.crafting_categories, "oil-processing")

local centrifuge = data.raw["assembling-machine"]["centrifuge"]
rescale_entity(centrifuge, 1 / 3)

local am1 = data.raw["assembling-machine"]["assembling-machine-1"]
minify(am1, 1 / 3)

local am2 = data.raw["assembling-machine"]["assembling-machine-2"]
rescale_entity(am2, 1 / 3)
fixPipeConnections(am2)

local am3 = data.raw["assembling-machine"]["assembling-machine-3"]
rescale_entity(am3, 1 / 3)
fixPipeConnections(am3)

local sp = data.raw["solar-panel"]["solar-panel"]
rescale_entity(sp, 1 / 3)

local accumulator = data.raw["accumulator"]["accumulator"]
rescale_entity(accumulator, 1 / 2)


rescale_entity(data.raw["power-switch"]["power-switch"], 1 / 2)

local reactor = data.raw["reactor"]["nuclear-reactor"]
rescale_entity(reactor, 1 / 5)
reactor.heat_buffer.connections = {

    {
        position = { 0, 0 },
        direction = defines.direction.north
    },

    {
        position = { 0, 0 },
        direction = defines.direction.east
    },

    {
        position = { 0, 0 },
        direction = defines.direction.south
    },

    {
        position = { 0, 0 },
        direction = defines.direction.west
    }
}

local radar = data.raw["radar"]["radar"]
rescale_entity(radar, 1 / 3)

local lab = data.raw["lab"]["lab"]
rescale_entity(lab, 1 / 3)

local storagetank = data.raw["storage-tank"]["storage-tank"]
rescale_entity(storagetank, 1 / 3)
storagetank.fluid_box.pipe_picture = pipe_pictures_hide
storagetank.fluid_box.pipe_connections = {
    { position = { 0, -1 } },
    { position = { 1, 0 } },
    { position = { 0, 1 } },
    { position = { -1, 0 } }
}

local roboport = data.raw["roboport"]["roboport"]
rescale_entity(roboport, 1 / 4)

local substation = data.raw["electric-pole"]["substation"]
rescale_entity(substation, 1 / 2)

local substation2 = data.raw["electric-pole"]["big-electric-pole"]
rescale_entity(substation2, 1 / 2)

local artilleryturret = data.raw["artillery-turret"]["artillery-turret"]
rescale_entity(artilleryturret, 1 / 3)


--    type = "electric-turret",
--    name = "laser-turret",

local laserturret = data.raw["electric-turret"]["laser-turret"]
rescale_entity(laserturret, 1 / 2)

local turret = data.raw["ammo-turret"]["gun-turret"]
rescale_entity(turret, 1 / 2)

local flamethrower = data.raw["fluid-turret"]["flamethrower-turret"]
rescale_entity(flamethrower, 1 / 2)
scale_collision(flamethrower)
flamethrower.not_enough_fuel_indicator_light.size = 0.7
flamethrower.enough_fuel_indicator_light.size = 0.7
flamethrower.fluid_box.pipe_connections = {
    { position = { -1, 0 } },
    { position = { 1, 0 } }
}

local rocket = data.raw["rocket-silo"]["rocket-silo"]
rescale_entity(rocket, 1 / 9)
rocket. hole_clipping_box = { { -1, -1 }, { 1, 1 } }
rocket. silo_fade_out_start_distance = 1
rocket. silo_fade_out_end_distance = 3


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

local rocket2 = data.raw["rocket-silo-rocket"]["rocket-silo-rocket"]
rescale_entity(rocket2, 1 / 9)
rocket2.rocket_render_layer_switch_distance = 0
rocket2.full_render_layer_switch_distance = 1
rocket2.effects_fade_in_start_distance = 0
rocket2.effects_fade_in_end_distance = 1
