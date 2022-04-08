

data.raw.item["se-cargo-rocket-section"].stack_size = settings.startup["cargo-rocket-part-stack-size"].value

data.raw.item["rocket-fuel"].stack_size = 100

local rcp = data.raw.recipe["se-space-pipe-to-ground"]
rcp.ingredients = {
    { "se-space-pipe", 10 },
    { "steel-plate", 2 }
}
rcp.result_count = 10 -- 1

local sptg = data.raw["pipe-to-ground"]["se-space-pipe-to-ground"]
sptg.max_distance = 60 -- 6
sptg.fluid_box.pipe_connections[2].max_underground_distance = 60 -- 6

rcp = data.raw.recipe["spidertron"]
data.raw.recipe["spidertron"].ingredients = {
    { "low-density-structure", 150 },
    { "rocket-control-unit", 16 },
    { "rocket-launcher", 4 },
    { "se-rtg-equipment", 2 },
    { "exoskeleton-equipment", 4 },
    { "radar", 2 },
    { "effectivity-module-3", 2 },
    { "raw-fish", 1 },
}

data.raw.accumulator.accumulator.energy_source.input_flow_limit = "450kW"
data.raw.accumulator["se-space-accumulator"].energy_source.input_flow_limit = "4500kW"
data.raw.accumulator["se-space-accumulator-2"].energy_source.input_flow_limit = "22500kW"
