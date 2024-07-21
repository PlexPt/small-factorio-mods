local substation = data.raw["electric-pole"]["kr-substation-mk2"]
rescale_entity(substation, 1 / 2)

minify(data.raw["mining-drill"]["kr-electric-mining-drill-mk2"], 1 / 3)
minify(data.raw["mining-drill"]["kr-electric-mining-drill-mk3"], 1 / 3)

rescale_entity(data.raw["radar"]["advanced-radar"], 1 / 3)

rescale_entity(data.raw["lab"]["biusart-lab"], 1 / 3)
rescale_entity(data.raw["lab"]["kr-singularity-lab"], 1 / 8)

rescale_entity(data.raw["assembling-machine"]["electric-furnace"], 1 / 3)

--rescale_entity(data.raw["assembling-machine"]["kr-electric-offshore-pump"], 1 / 2)
local mwp = rescale_entity(data.raw["mining-drill"]["kr-mineral-water-pumpjack"], 1 / 3)

mwp.output_fluid_box.pipe_connections = {
    { position = { -1, 0 } },
    { position = { 0, -1 } },
    { position = { 1, 0 } },
    { position = { 0, 1 } },
}

local quarry = rescale_entity(data.raw["mining-drill"]["kr-quarry-drill"], 1 / 3)
quarry.vector_to_place_result = { 0, -0.75 }
scale_collision(quarry)

local fs = rescale_entity(data.raw["storage-tank"]["kr-fluid-storage-1"], 1 / 3)
fs.fluid_box.pipe_connections = {
    { position = { -1, 0 } },
    { position = { 0, -1 } },
    { position = { 1, 0 } },
    { position = { 0, 1 } },
}

local fs2 = rescale_entity(data.raw["storage-tank"]["kr-fluid-storage-2"], 1 / 5)
fs2.fluid_box.pipe_connections = {
    { position = { -1, 0 } },
    { position = { 0, -1 } },
    { position = { 1, 0 } },
    { position = { 0, 1 } },
}

rescale_entity(data.raw["furnace"]["kr-air-purifier"], 1 / 2)
rescale_entity(data.raw["furnace"]["kr-crusher"], 1 / 7)

rescale_entity(data.raw["furnace"]["kr-stabilizer-charging-station"], 1 / 2)
local advancedsteam = rescale_entity(data.raw["generator"]["kr-advanced-steam-turbine"], 1 / 7)
advancedsteam.fluid_box.pipe_connections = {
    { type = "input-output", position = { 0, 1 } },
    { type = "input-output", position = { 0, -1 } },
}

local gaspower = rescale_entity(data.raw["generator"]["kr-gas-power-station"], 1 / 2)
scale_collision(gaspower)

gaspower.fluid_box.pipe_connections = {
    { type = "input-output", position = { 1, 0 } },
    { type = "input-output", position = { -1, 0 } },
    { type = "input-output", position = { 0, 1 } },
    { type = "input-output", position = { 0, -1 } },
}

rescale_entity(data.raw["lab"]["kr-crash-site-lab-repaired"], 1 / 3) -- 5x3
--RTZipline


rescale_entity(data.raw["container"]["kr-shelter-container"], 1 / 6)
rescale_entity(data.raw["container"]["kr-shelter-plus-container"], 1 / 6)
rescale_entity(data.raw["container"]["kr-medium-container"], 1 / 2)
rescale_entity(data.raw["container"]["kr-big-container"], 1 / 6)
rescale_entity(data.raw["logistic-container"]["kr-medium-active-provider-container"], 1 / 2)
rescale_entity(data.raw["logistic-container"]["kr-medium-buffer-container"], 1 / 2)
rescale_entity(data.raw["logistic-container"]["kr-medium-passive-provider-container"], 1 / 2)
rescale_entity(data.raw["logistic-container"]["kr-medium-requester-container"], 1 / 2)
rescale_entity(data.raw["logistic-container"]["kr-medium-storage-container"], 1 / 2)
rescale_entity(data.raw["logistic-container"]["kr-big-active-provider-container"], 1 / 6)
rescale_entity(data.raw["logistic-container"]["kr-big-buffer-container"], 1 / 6)
rescale_entity(data.raw["logistic-container"]["kr-big-passive-provider-container"], 1 / 6)
rescale_entity(data.raw["logistic-container"]["kr-big-requester-container"], 1 / 6)
rescale_entity(data.raw["logistic-container"]["kr-big-storage-container"], 1 / 6)
rescale_entity(data.raw["accumulator"]["kr-energy-storage"], 1 / 6)
rescale_entity(data.raw["accumulator"]["kr-intergalactic-transceiver"], 1 / 12)
rescale_entity(data.raw["accumulator"]["kr-planetary-teleporter"], 1 / 6)
rescale_entity(data.raw["solar-panel"]["kr-advanced-solar-panel"], 1 / 4)
rescale_entity(data.raw["beacon"]["kr-singularity-beacon"], 1 / 2)
--rescale_entity(data.raw["pump"]["pump"], 1 / 5)
--rescale_entity(data.raw["pump"]["kr-steel-pump"], 1 / 5)

rescale_entity(data.raw["burner-generator"]["kr-antimatter-reactor"], 1 / 10)
--rescale_entity(data.raw["burner-generator"]["burner-generator"], 1 / 5)
rescale_entity(data.raw["electric-energy-interface"]["kr-activated-intergalactic-transceiver"], 1 / 12)
rescale_entity(data.raw["electric-energy-interface"]["kr-wind-turbine"], 1 / 3)
rescale_entity(data.raw["electric-energy-interface"]["kr-tesla-coil"], 1 / 3)
rescale_entity(data.raw["roboport"]["kr-small-roboport"], 1 / 2)
rescale_entity(data.raw["roboport"]["kr-small-roboport-logistic-mode"], 1 / 2)
rescale_entity(data.raw["roboport"]["kr-small-roboport-construction-mode"], 1 / 2)
rescale_entity(data.raw["roboport"]["kr-large-roboport"], 1 / 8)
rescale_entity(data.raw["roboport"]["kr-large-roboport-logistic-mode"], 1 / 8)
rescale_entity(data.raw["roboport"]["kr-large-roboport-construction-mode"], 1 / 8)
rescale_entity(data.raw["roboport"]["roboport-logistic-mode"], 1 / 4)
rescale_entity(data.raw["roboport"]["roboport-construction-mode"], 1 / 4)
rescale_entity(data.raw["ammo-turret"]["kr-railgun-turret"], 1 / 4)
rescale_entity(data.raw["ammo-turret"]["kr-rocket-turret"], 1 / 4)
rescale_entity(data.raw["electric-turret"]["kr-laser-artillery-turret"], 1 / 4)

local inactiveshelter = rescale_entity(data.raw["simple-entity-with-owner"]["kr-inactive-shelter"], 1 / 3)
local inactiveshelter2 =rescale_entity(data.raw["simple-entity-with-owner"]["kr-inactive-shelter-plus"], 1 / 3)
scale_collision(inactiveshelter)
scale_collision(inactiveshelter2)

--rescale_entity(nil, 1 / 5)



function reset_pipe_connections_position(entity, box, pipe, x, y)
    if not entity then
        return
    end

    entity.fluid_boxes[box].pipe_connections[pipe].position = { x, y }
end

function reset_pipe_connections_position2x2(entity)
    reset_pipe_connections_position(entity, 1, 1, -1, 0)
    reset_pipe_connections_position(entity, 2, 1, 1, 0)
    reset_pipe_connections_position(entity, 3, 1, 0, 1)
    reset_pipe_connections_position(entity, 4, 1, 0, -1)
end

function reset_pipe_connections_position_updown(entity)
    reset_pipe_connections_position(entity, 1, 1, 0, 1)
    reset_pipe_connections_position(entity, 2, 1, 0, -1)
end

local fluidburner = rescale_entity(data.raw["furnace"]["kr-fluid-burner"], 1 / 2)
--data.raw["furnace"]["kr-fluid-burner"].fluid_boxes[1].pipe_connections[1].position = { 0, 1 }
reset_pipe_connections_position(fluidburner, 1, 1, 0, 1)

local biolab = data.raw["assembling-machine"]["kr-bio-lab"]
rescale_entity(biolab, 1 / 7)
reset_pipe_connections_position(biolab, 1, 1, 0, -1)
reset_pipe_connections_position(biolab, 1, 2, 0, 1)
reset_pipe_connections_position(biolab, 2, 1, 1, 0)
reset_pipe_connections_position(biolab, 2, 2, -1, 0)

local electrolysis = rescale_entity(data.raw["assembling-machine"]["kr-electrolysis-plant"], 1 / 5)
reset_pipe_connections_position(electrolysis, 1, 1, -1, 0)
reset_pipe_connections_position(electrolysis, 2, 1, 1, 0)
reset_pipe_connections_position(electrolysis, 3, 1, 0, 1)
reset_pipe_connections_position(electrolysis, 4, 1, 0, -1)

local filtration = rescale_entity(data.raw["assembling-machine"]["kr-filtration-plant"], 1 / 7)
reset_pipe_connections_position(filtration, 1, 1, 0, -1)
reset_pipe_connections_position(filtration, 2, 1, 0, 1)

--2进2出
local advanced_furnace = rescale_entity(data.raw["assembling-machine"]["kr-advanced-furnace"], 1 / 7)
--reset_pipe_connections_position2x2(advanced_furnace)
advanced_furnace.fluid_boxes = {
    {
        production_type = "input",
        pipe_picture = furnacekpipepictures_a(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = { { type = "input", position = { -1, 0 } } },
        secondary_draw_orders = { north = -1 },
    },
    {
        production_type = "input",
        pipe_picture = furnacekpipepictures_b(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = { { type = "input", position = { 1, 0 } } },
        secondary_draw_orders = { north = -1 },
    },
    {
        production_type = "output",
        pipe_picture = furnacekpipepictures_b(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = { { type = "output", position = { 0, 1 } } },
        secondary_draw_orders = { north = -1 },
    },
    {
        production_type = "output",
        pipe_picture = furnacekpipepictures_a(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = { { type = "output", position = { 0, -1 } } },
        secondary_draw_orders = { north = -1 },
    },
    off_when_no_fluid_recipe = true,
}
--2进2出
local advanced_chemical = rescale_entity(data.raw["assembling-machine"]["kr-advanced-chemical-plant"], 1 / 7)
--reset_pipe_connections_position2x2(advanced_chemical)
advanced_chemical.fluid_boxes = {
    {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 20,
        base_level = -1,
        pipe_connections = { { type = "input", position = { -1, 0 } } },
    },
    {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 20,
        base_level = -1,
        pipe_connections = { { type = "input", position = { 1, 0 } } },
    },

    {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 10,
        base_level = 1,
        pipe_connections = { { type = "output", position = { 0, 1 } } },
    },
    {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 10,
        base_level = 1,
        pipe_connections = { { type = "output", position = { 0, -1 } } },
    },
    off_when_no_fluid_recipe = false,
}

local fuel_refinery = rescale_entity(data.raw["assembling-machine"]["kr-fuel-refinery"], 1 / 3)
reset_pipe_connections_position2x2(fuel_refinery)

local matter_assembler = rescale_entity(data.raw["assembling-machine"]["kr-matter-assembler"], 1 / 7)
reset_pipe_connections_position2x2(matter_assembler)

local matter_plant = rescale_entity(data.raw["assembling-machine"]["kr-matter-plant"], 1 / 7)
reset_pipe_connections_position2x2(matter_plant)

local fusion = rescale_entity(data.raw["assembling-machine"]["kr-fusion-reactor"], 1 / 15)
reset_pipe_connections_position_updown(fusion)

local computer = rescale_entity(data.raw["assembling-machine"]["kr-quantum-computer"], 1 / 6)
reset_pipe_connections_position_updown(computer)
local researchserver = rescale_entity(data.raw["assembling-machine"]["kr-research-server"], 1 / 3)
reset_pipe_connections_position_updown(researchserver)
local advanced_assembling_machine = rescale_entity(data.raw["assembling-machine"]["kr-advanced-assembling-machine"], 1 / 5)
reset_pipe_connections_position_updown(advanced_assembling_machine)

local greenhouse = rescale_entity(data.raw["assembling-machine"]["kr-greenhouse"], 1 / 7)
reset_pipe_connections_position(greenhouse, 1, 1, 0, -1)
reset_pipe_connections_position(greenhouse, 1, 2, -1, 0)
reset_pipe_connections_position(greenhouse, 1, 3, 1, 0)
reset_pipe_connections_position(greenhouse, 1, 4, 0, 1)

local condenser = data.raw["assembling-machine"]["kr-atmospheric-condenser"]
rescale_entity(condenser, 1 / 5)

condenser.fluid_boxes[1].pipe_connections = {
    { type = "output", position = { 0, -1 } },
    { type = "output", position = { 0, 1 } },
    { type = "output", position = { -1, 0 } },
    { type = "output", position = { 1, 0 } },
}
