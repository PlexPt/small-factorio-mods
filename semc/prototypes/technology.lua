local tch = {}

-- data.raw.technology["se-space-gravimetrics-laboratory"].prerequisites = {"se-space-telescope"}
-- data.raw.technology["se-space-astrometrics-laboratory"]=nil

-- Resources
data.raw.technology["se-processing-vulcanite"].effects = {
    {type = "unlock-recipe", recipe = "se-vulcanite-block"},
    {type = "unlock-recipe", recipe = "se-iron-smelting-vulcanite"},
    {type = "unlock-recipe", recipe = "se-copper-smelting-vulcanite"},
    {type = "unlock-recipe", recipe = "se-stone-brick-vulcanite"},
    {type = "unlock-recipe", recipe = "se-glass-vulcanite"}
    -- {type = "unlock-recipe", recipe = "se-vulcanite-crushed"},
    -- {type = "unlock-recipe", recipe = "se-vulcanite-washed"},
    -- {type = "unlock-recipe", recipe = "se-vulcanite-ion-exchange-beads"},
}
data.raw.technology["se-processing-cryonite"].effects = {
    {type = "unlock-recipe", recipe = "se-cryonite-rod"},
    {type = "unlock-recipe", recipe = "se-cryonite-slush"},
    {type = "unlock-recipe", recipe = "se-cryonite-lubricant"},
    {type = "unlock-recipe", recipe = "se-cryonite-to-water-ice"}
    -- {type = "unlock-recipe", recipe = "se-cryonite-crushed"},
    -- {type = "unlock-recipe", recipe = "se-cryonite-washed"},
    -- {type = "unlock-recipe", recipe = "se-cryonite-ion-exchange-beads"},
}
data.raw.technology["se-processing-beryllium"].effects = {
    {type = "unlock-recipe", recipe = "se-beryllium-plate"}
    -- {type = "unlock-recipe", recipe = "se-beryllium-ore-crushed"},
    -- {type = "unlock-recipe", recipe = "se-beryllium-sulfate"},
    -- {type = "unlock-recipe", recipe = "se-beryllium-hydroxide"},
    -- {type = "unlock-recipe", recipe = "se-beryllium-powder"},
    -- {type = "unlock-recipe", recipe = "se-beryllium-ingot"},
}
tch = data.raw.technology["se-processing-holmium"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-holmium-plate"}
    -- {type = "unlock-recipe", recipe = "se-holmium-ore-crushed"},
    -- {type = "unlock-recipe", recipe = "se-holmium-ore-washed"},
    -- {type = "unlock-recipe", recipe = "se-holmium-powder"},
    -- {type = "unlock-recipe", recipe = "se-holmium-ingot"},
}
tch.prerequisites = {"se-rocket-science-pack"}

tch = data.raw.technology["se-processing-iridium"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-iridium-plate"},
    {type = "unlock-recipe", recipe = "se-heat-shielding-iridium"}
    -- {type = "unlock-recipe", recipe = "se-iridium-ore-crushed"},
    -- {type = "unlock-recipe", recipe = "se-iridium-ore-washed"},
    -- {type = "unlock-recipe", recipe = "se-iridium-powder"},
    -- {type = "unlock-recipe", recipe = "se-iridium-ingot"},
}
tch.prerequisites = {"se-processing-cryonite", "se-rocket-science-pack"}

data.raw.technology["se-processing-naquium"].effects = {
    {type = "unlock-recipe", recipe = "se-naquium-plate"},
    {type = "unlock-recipe", recipe = "se-naquium-heat-pipe"},
    {type = "unlock-recipe", recipe = "se-naquium-heat-pipe-long--+--"},
    {type = "unlock-recipe", recipe = "se-naquium-heat-pipe-long--+-----+--"}
    -- {type = "unlock-recipe", recipe = "se-naquium-ore-crushed"},
    -- {type = "unlock-recipe", recipe = "se-naquium-ore-washed"},
    -- {type = "unlock-recipe", recipe = "se-naquium-powder"},
    -- {type = "unlock-recipe", recipe = "se-naquium-ingot"},
}
tch = data.raw.technology["se-processing-vitamelange"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-vitamelange-spice"}
    -- {type = "unlock-recipe", recipe = "se-vitamelange-nugget"},
    -- {type = "unlock-recipe", recipe = "se-vitamelange-roast"},
    -- {type = "unlock-recipe", recipe = "se-vitamelange-extract"},
}
tch.prerequisites = {"se-rocket-science-pack"}

-- Remove vats
data.raw.technology["se-space-biochemical-laboratory"].effects = {
    {type = "unlock-recipe", recipe = "se-space-biochemical-laboratory"},
    {type = "unlock-recipe", recipe = "se-bio-sludge-from-wood"},
    {type = "unlock-recipe", recipe = "se-bio-sludge-from-fish"},
    {type = "unlock-recipe", recipe = "se-bio-sludge"},
    {type = "unlock-recipe", recipe = "se-bio-sludge-crude-oil"},
    {type = "unlock-recipe", recipe = "se-nutrient-gel"},
    {type = "unlock-recipe", recipe = "se-nutrient-gel-methane"},
    {type = "unlock-recipe", recipe = "se-melting-water-ice"},
    {type = "unlock-recipe", recipe = "se-melting-methane-ice"}
    -- {type = "unlock-recipe", recipe = "se-nutrient-vat"},
}
data.raw.technology["se-space-genetics-laboratory"].effects = {
    {type = "unlock-recipe", recipe = "se-space-genetics-laboratory"},
    {type = "unlock-recipe", recipe = "se-genetic-data"}
    -- {type = "unlock-recipe", recipe = "se-bioculture"},
    -- {type = "unlock-recipe", recipe = "se-experimental-bioculture"},
}

-- Remove insight
-- astronomic
tch = data.raw.technology["se-space-catalogue-astronomic-1"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-astronomic-catalogue-1"},
    {type = "unlock-recipe", recipe = "se-astrometric-analysis-multispectral-1"},
    {type = "unlock-recipe", recipe = "se-visible-observation-data"},
    {type = "unlock-recipe", recipe = "se-uv-observation-data"},
    {type = "unlock-recipe", recipe = "se-infrared-observation-data"}
    -- {type = "unlock-recipe", recipe = "se-simulation-a"},
    -- {type = "unlock-recipe", recipe = "se-astronomic-insight-1"},
}
tch.prerequisites = {"se-space-laser-laboratory"}
tch = data.raw.technology["se-space-catalogue-astronomic-2"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-astronomic-catalogue-2"},
    {type = "unlock-recipe", recipe = "se-astrometric-analysis-multispectral-2"},
    {type = "unlock-recipe", recipe = "se-microwave-observation-data"},
    {type = "unlock-recipe", recipe = "se-xray-observation-data"},
    {type = "unlock-recipe", recipe = "se-gravitational-lensing-data"},
    {type = "unlock-recipe", recipe = "se-gravity-wave-data"}
    -- {type = "unlock-recipe", recipe = "se-astronomic-insight-2"},
}
tch.prerequisites = {"se-aeroframe-pole"}
tch = data.raw.technology["se-space-catalogue-astronomic-3"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-astronomic-catalogue-3"},
    {type = "unlock-recipe", recipe = "se-astrometric-analysis-multispectral-3"},
    {type = "unlock-recipe", recipe = "se-radio-observation-data"},
    {type = "unlock-recipe", recipe = "se-gammaray-observation-data"},
    {type = "unlock-recipe", recipe = "se-negative-pressure-data"},
    {type = "unlock-recipe", recipe = "se-darkmatter-data"}
    -- {type = "unlock-recipe", recipe = "se-astronomic-insight-3"},
}
tch.prerequisites = {"se-aeroframe-scaffold"}
tch = data.raw.technology["se-space-catalogue-astronomic-4"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-astronomic-catalogue-4"},
    {type = "unlock-recipe", recipe = "se-dark-energy-data"},
    {type = "unlock-recipe", recipe = "se-micro-black-hole-data"},
    {type = "unlock-recipe", recipe = "se-zero-point-energy-data"},
    {type = "unlock-recipe", recipe = "se-belt-probe"}
    -- {type = "unlock-recipe", recipe = "se-astronomic-insight-4"},
}
tch.prerequisites = {"se-aeroframe-bulkhead", "se-space-probe"}
-- biological
data.raw.technology["se-space-catalogue-biological-1"].effects = {
    {type = "unlock-recipe", recipe = "se-biological-catalogue-1"},
    {type = "unlock-recipe", recipe = "se-bio-combustion-data"},
    {type = "unlock-recipe", recipe = "se-biomechanical-data"},
    {type = "unlock-recipe", recipe = "se-biochemical-data"}
    -- {type = "unlock-recipe", recipe = "se-simulation-b"},
    -- {type = "unlock-recipe", recipe = "se-biological-insight-1"},
}
tch = data.raw.technology["se-space-catalogue-biological-2"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-biological-catalogue-2"},
    {type = "unlock-recipe", recipe = "se-experimental-genetic-data"},
    {type = "unlock-recipe", recipe = "se-biochemical-resistance-data"},
    {type = "unlock-recipe", recipe = "se-biomechanical-resistance-data"},
    {type = "unlock-recipe", recipe = "se-bio-combustion-resistance-data"},
    {type = "unlock-recipe", recipe = "se-experimental-specimen"}
    -- {type = "unlock-recipe", recipe = "se-biological-insight-2"},
}
tch.prerequisites = {"se-vitalic-acid"}
tch = data.raw.technology["se-space-catalogue-biological-3"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-biological-catalogue-3"},
    {type = "unlock-recipe", recipe = "se-bioelectrics-data"},
    {type = "unlock-recipe", recipe = "se-decompression-data"},
    {type = "unlock-recipe", recipe = "se-cryogenics-data"},
    {type = "unlock-recipe", recipe = "se-radiation-exposure-data"},
    {type = "unlock-recipe", recipe = "se-neural-gel-2"},
    {type = "unlock-recipe", recipe = "se-significant-specimen"}
    -- {type = "unlock-recipe", recipe = "se-biological-insight-3"},
}
tch.prerequisites = {"se-space-radiation-laboratory", "se-vitalic-reagent"}
tch = data.raw.technology["se-space-catalogue-biological-4"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-biological-catalogue-4"},
    {type = "unlock-recipe", recipe = "se-comparative-genetic-data"},
    {type = "unlock-recipe", recipe = "se-decompression-resistance-data"},
    {type = "unlock-recipe", recipe = "se-neural-anomaly-data"},
    {type = "unlock-recipe", recipe = "se-radiation-exposure-resistance-data"}
    -- {type = "unlock-recipe", recipe = "se-biological-insight-4"},
}
tch.prerequisites = {"se-vitalic-epoxy"}
-- material
data.raw.technology["se-space-catalogue-material-1"].effects = {
    {type = "unlock-recipe", recipe = "se-material-catalogue-1"},
    {type = "unlock-recipe", recipe = "se-cold-thermodynamics-data"},
    {type = "unlock-recipe", recipe = "se-hot-thermodynamics-data"},
    {type = "unlock-recipe", recipe = "se-tensile-strength-data"},
    {type = "unlock-recipe", recipe = "se-compressive-strength-data"}
    -- {type = "unlock-recipe", recipe = "se-simulation-m"},
    -- {type = "unlock-recipe", recipe = "se-material-insight-1"},
}
tch = data.raw.technology["se-space-catalogue-material-2"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-material-catalogue-2"},
    {type = "unlock-recipe", recipe = "se-rigidity-data"},
    {type = "unlock-recipe", recipe = "se-impact-shielding-data"},
    {type = "unlock-recipe", recipe = "se-pressure-containment-data"},
    {type = "unlock-recipe", recipe = "se-corrosion-resistance-data"}
    -- {type = "unlock-recipe", recipe = "se-material-insight-2"},
}
tch.prerequisites = {"se-space-biochemical-laboratory", "se-heavy-girder"}
tch = data.raw.technology["se-space-catalogue-material-3"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-material-catalogue-3"},
    {type = "unlock-recipe", recipe = "se-friction-data"},
    {type = "unlock-recipe", recipe = "se-ballistic-shielding-data"},
    {type = "unlock-recipe", recipe = "se-explosion-shielding-data"},
    {type = "unlock-recipe", recipe = "se-radiation-shielding-data"}
    -- {type = "unlock-recipe", recipe = "se-material-insight-3"},
}
tch.prerequisites = {"se-space-radiation-laboratory", "se-heavy-bearing"}
tch = data.raw.technology["se-space-catalogue-material-4"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-material-catalogue-4"},
    {type = "unlock-recipe", recipe = "se-electrical-shielding-data"},
    {type = "unlock-recipe", recipe = "se-laser-shielding-data"},
    {type = "unlock-recipe", recipe = "se-particle-beam-shielding-data"},
    {type = "unlock-recipe", recipe = "se-experimental-alloys-data"}
    -- {type = "unlock-recipe", recipe = "se-material-insight-4"},
}
tch.prerequisites = {"se-space-particle-collider", "se-heavy-composite"}
-- energy
data.raw.technology["se-space-catalogue-energy-1"].effects = {
    {type = "unlock-recipe", recipe = "se-energy-catalogue-1"},
    {type = "unlock-recipe", recipe = "se-conductivity-data"},
    {type = "unlock-recipe", recipe = "se-electromagnetic-field-data"},
    {type = "unlock-recipe", recipe = "se-polarisation-data"},
    {type = "unlock-recipe", recipe = "se-radiation-data"}
    -- {type = "unlock-recipe", recipe = "se-simulation-s"},
    -- {type = "unlock-recipe", recipe = "se-energy-insight-1"},
}
tch = data.raw.technology["se-space-catalogue-energy-2"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-energy-catalogue-2"},
    {type = "unlock-recipe", recipe = "se-atomic-data"},
    {type = "unlock-recipe", recipe = "se-subatomic-data"},
    {type = "unlock-recipe", recipe = "se-quantum-phenomenon-data"},
    {type = "unlock-recipe", recipe = "se-forcefield-data"}
    -- {type = "unlock-recipe", recipe = "se-energy-insight-2"},
}
tch.prerequisites = {"se-space-particle-collider"}
tch = data.raw.technology["se-space-catalogue-energy-3"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-energy-catalogue-3"},
    {type = "unlock-recipe", recipe = "se-superconductivity-data"},
    {type = "unlock-recipe", recipe = "se-entanglement-data"},
    {type = "unlock-recipe", recipe = "se-quark-data"},
    {type = "unlock-recipe", recipe = "se-lepton-data"}
    -- {type = "unlock-recipe", recipe = "se-energy-insight-3"},
}
tch.prerequisites = {"se-holmium-solenoid"}
tch = data.raw.technology["se-space-catalogue-energy-4"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-energy-catalogue-4"},
    {type = "unlock-recipe", recipe = "se-boson-data"},
    {type = "unlock-recipe", recipe = "se-fusion-test-data"},
    {type = "unlock-recipe", recipe = "se-magnetic-monopole-data"},
    {type = "unlock-recipe", recipe = "se-star-probe"}
    -- {type = "unlock-recipe", recipe = "se-energy-insight-4"},
}
tch.prerequisites = {"se-space-supercomputer-2", "se-space-probe"}
data.raw.technology["se-space-simulation-ab"].hidden = true
data.raw.technology["se-space-simulation-as"].hidden = true
data.raw.technology["se-space-simulation-am"].hidden = true
data.raw.technology["se-space-simulation-bm"].hidden = true
data.raw.technology["se-space-simulation-sb"].hidden = true
data.raw.technology["se-space-simulation-sm"].hidden = true
data.raw.technology["se-space-simulation-abm"].hidden = true
data.raw.technology["se-space-simulation-asb"].hidden = true
data.raw.technology["se-space-simulation-asm"].hidden = true
data.raw.technology["se-space-simulation-sbm"].hidden = true
data.raw.technology["se-space-simulation-asbm"].hidden = true

data.raw.technology["se-astronomic-science-pack-1"].effects = {
    {type = "unlock-recipe", recipe = "se-astronomic-science-pack-1"},
    {type = "unlock-recipe", recipe = "se-cargo-rocket-section-beryllium"}
    -- {type = "unlock-recipe", recipe = "se-astronomic-science-pack-1-no-beryllium",},
}

data.raw.technology["se-rocket-landing-pad"].effects = {
    {type = "unlock-recipe", recipe = "se-rocket-landing-pad"}
    -- {type = "unlock-recipe", recipe = "se-cargo-rocket-section-pack",},
    -- {type = "unlock-recipe", recipe = "se-cargo-rocket-section-unpack",},
}

data.raw.technology["se-space-manufactory"].effects = {
    {type = "unlock-recipe", recipe = "se-space-manufactory"},
    {type = "unlock-recipe", recipe = "se-chemical-gel"},
    {type = "unlock-recipe", recipe = "se-space-mirror"},
    {type = "unlock-recipe", recipe = "se-space-mirror-alternate"},
    {type = "unlock-recipe", recipe = "se-material-testing-pack"},
    {type = "unlock-recipe", recipe = "se-gammaray-detector"} -- nil
}

tch = data.raw.technology["se-space-particle-accelerator"]
tch.effects = {
    -- {type = "unlock-recipe", recipe = "se-space-particle-accelerator"},
    {type = "unlock-recipe", recipe = "se-space-particle-collider"}, -- nil
    {type = "unlock-recipe", recipe = "se-ion-stream"}
}
tch.prerequisites = {"se-rocket-science-pack"}

tch = data.raw.technology["se-space-particle-collider"]
tch.effects = {
    -- {type = "unlock-recipe",   recipe = "se-space-particle-collider"},
    {type = "unlock-recipe", recipe = "se-proton-stream"},
    {type = "unlock-recipe", recipe = "se-particle-stream"}
}
tch.prerequisites = {"se-holmium-cable"}

data.raw.technology["se-space-plasma-generator"].hidden = true

tch = data.raw.technology["se-space-thermodynamics-laboratory"]
tch.effects = {
    {type = "unlock-recipe", recipe = "se-space-thermodynamics-laboratory"},
    {type = "unlock-recipe", recipe = "se-thermodynamics-coal"},
    {type = "unlock-recipe", recipe = "se-plasma-stream"} -- nil
}
tch.prerequisites = {"se-rocket-science-pack"}

-- data.raw.technology["se-rocket-launch-pad"].prerequisites = {
-- "electric-energy-accumulators",
-- "se-thruster-suit",
-- "electric-engine",
-- "battery",
-- }

data.raw.technology["se-space-telescope"].effects = {
    {type = "unlock-recipe", recipe = "se-observation-frame-blank"},
    {type = "unlock-recipe", recipe = "se-observation-frame-blank-beryllium"},
    {type = "unlock-recipe", recipe = "se-space-telescope-xray"}
}

data.raw.technology["se-space-gravimetrics-laboratory"].prerequisites = {
    "se-space-telescope"
}

data.raw.technology["se-space-astrometrics-laboratory"].hidden = true
data.raw.technology["se-space-telescope-xray"].hidden = true
data.raw.technology["se-space-telescope-microwave"].hidden = true
data.raw.technology["se-space-telescope-gammaray"].hidden = true
data.raw.technology["se-space-telescope-radio"].hidden = true

tch = data.raw.technology["spidertron"]
tch.prerequisites = {
    "military-4", "exoskeleton-equipment", "se-rtg-equipment", "rocketry",
    "rocket-control-unit", "effectivity-module-3"
}
tch.unit = {
    count = 2500,
    ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"military-science-pack", 1}, {"chemical-science-pack", 1},
        {"production-science-pack", 1}, {"utility-science-pack", 1}
    },
    time = 30
}

data.raw.technology["chemical-science-pack"].prerequisites = {
    "sulfur-processing", "advanced-electronics", "optics", "engine"
}

data.raw.technology["automation-3"].prerequisites = {
    "production-science-pack", "electric-engine", "speed-module",
    "automation-2", "concrete"
}

if not mods["Krastorio2"] then
    data.raw.technology["rocket-silo"].prerequisites = {
        "rocket-control-unit", "rocket-fuel", "se-heat-shielding",
        "low-density-structure", "solar-energy", "radar", "concrete",
        "electric-energy-accumulators"
    }

    data.raw.technology["rocket-silo"].prerequisites = {
        "rocket-control-unit", "rocket-fuel", "se-heat-shielding",
        "low-density-structure", "solar-energy", "radar", "concrete",
        "electric-energy-accumulators"
    }
end
