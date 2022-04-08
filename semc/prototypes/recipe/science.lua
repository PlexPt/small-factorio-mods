local rcp = {}


-- Astronomic
-- 1
  rcp = data.raw.recipe["se-astronomic-science-pack-1"]
  rcp.ingredients = {
    {"se-astrometric-data", 1},
    {"se-visible-observation-data", 1},
    {"se-infrared-observation-data", 1},
    {"se-uv-observation-data", 1},
    {"se-beryllium-plate", 10},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
  }
  rcp.results = {
    {"se-astronomic-science-pack-1", 1},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"
  
-- 2
  rcp = data.raw.recipe["se-astronomic-science-pack-2"]
  rcp.ingredients = {
    {"se-microwave-observation-data", 1},
    {"se-xray-observation-data", 1},
    {"se-gravitational-lensing-data", 1},
    {"se-gravity-wave-data", 1},
    {"se-astronomic-science-pack-1", 1},
    {"se-aeroframe-pole", 10},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
  }
  rcp.results = {
    {"se-astronomic-science-pack-2", 2},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 3
  rcp = data.raw.recipe["se-astronomic-science-pack-3"]
  rcp.ingredients = {
    {"se-radio-observation-data", 1},
    {"se-gammaray-observation-data", 1},
    {"se-darkmatter-data", 1},
    {"se-negative-pressure-data", 1},
    {"se-astronomic-science-pack-2", 2},
    {"se-aeroframe-scaffold", 5},
    {type = "fluid", name = "se-space-coolant-supercooled", amount = 10},
  }
  rcp.results = {
    {"se-astronomic-science-pack-3", 3},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 4
  rcp = data.raw.recipe["se-astronomic-science-pack-4"]
  rcp.ingredients = {
    {"se-dark-energy-data", 1},
    {"se-micro-black-hole-data", 1},
    {"se-zero-point-energy-data", 1},
    {"se-belt-probe-data", 1},
    {"se-astronomic-science-pack-3", 3},
    {"se-aeroframe-bulkhead", 1},
    {type = "fluid", name = "se-space-coolant-supercooled", amount = 10},
  }
  rcp.results = {
    {"se-astronomic-science-pack-4", 4},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"


-- Biological
-- 1
  rcp = data.raw.recipe["se-biological-science-pack-1"]
  rcp.ingredients = {
    {"se-bio-combustion-data", 1},
    {"se-biomechanical-data", 1},
    {"se-biochemical-data", 1},
    {"se-genetic-data", 1},
    {"se-vitamelange-spice", 20},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
  }
  rcp.results = {
    {"se-biological-science-pack-1", 1},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 2
  rcp = data.raw.recipe["se-biological-science-pack-2"]
  rcp.ingredients = {
    {"se-bio-combustion-resistance-data", 1},
    {"se-experimental-genetic-data", 1},
    {"se-biochemical-resistance-data", 1},
    {"se-biomechanical-resistance-data", 1},
    {"se-biological-science-pack-1", 1},
    {"se-bioscrubber", 2},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
  }
  rcp.results = {
    {"se-biological-science-pack-2", 2},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 3
  rcp = data.raw.recipe["se-biological-science-pack-3"]
  rcp.ingredients = {
    {"se-bioelectrics-data", 1},
    {"se-cryogenics-data", 1},
    {"se-decompression-data", 1},
    {"se-radiation-exposure-data", 1},
    {"se-biological-science-pack-2", 2},
    {"se-vitalic-reagent", 2},
    {type = "fluid", name = "se-space-coolant-supercooled", amount = 10},
  }
  rcp.results = {
    {"se-biological-science-pack-3", 3},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 4
  rcp = data.raw.recipe["se-biological-science-pack-4"]
  rcp.ingredients = {
    {"se-comparative-genetic-data", 1},
    {"se-decompression-resistance-data", 1},
    {"se-neural-anomaly-data", 1},
    {"se-radiation-exposure-resistance-data", 1},
    {"se-biological-science-pack-3", 3},
    {"se-vitalic-epoxy", 1},
    {type = "fluid", name = "se-space-coolant-supercooled", amount = 10},
  }
  rcp.results = {
    {"se-biological-science-pack-4", 4},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"


-- Material
-- 1
  rcp = data.raw.recipe["se-material-science-pack-1"]
  rcp.ingredients = {
    {"se-cold-thermodynamics-data", 1},
    {"se-hot-thermodynamics-data", 1},
    {"se-tensile-strength-data", 1},
    {"se-compressive-strength-data", 1},
    {"se-iridium-plate", 10},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
  }
  rcp.results = {
    {"se-material-science-pack-1", 1},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 2
  rcp = data.raw.recipe["se-material-science-pack-2"]
  rcp.ingredients = {
    {"se-rigidity-data", 1},
    {"se-pressure-containment-data", 1},
    {"se-corrosion-resistance-data", 1},
    {"se-impact-shielding-data", 1},
    {"se-material-science-pack-1", 1},
    {"se-heavy-girder", 5},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
  }
  rcp.results = {
    {"se-material-science-pack-2", 2},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 3
  rcp = data.raw.recipe["se-material-science-pack-3"]
  rcp.ingredients = {
    {"se-friction-data", 1},
    {"se-ballistic-shielding-data", 1},
    {"se-radiation-shielding-data", 1},
    {"se-explosion-shielding-data", 1},
    {"se-material-science-pack-2", 2},
    {"se-heavy-bearing", 3},
    {type = "fluid", name = "se-space-coolant-supercooled", amount = 10},
  }
  rcp.results = {
    {"se-material-science-pack-3", 3},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 4
  rcp = data.raw.recipe["se-material-science-pack-4"]
  rcp.ingredients = {
    {"se-electrical-shielding-data", 1},
    {"se-laser-shielding-data", 1},
    {"se-particle-beam-shielding-data", 1},
    {"se-experimental-alloys-data", 1},
    {"se-material-science-pack-3", 3},
    {"se-heavy-composite", 1},
    {type = "fluid", name = "se-space-coolant-supercooled", amount = 10},
  }
  rcp.results = {
    {"se-material-science-pack-4", 4},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"


-- Energy
-- 1
  rcp = data.raw.recipe["se-energy-science-pack-1"]
  rcp.ingredients = {
    {"se-conductivity-data", 1},
    {"se-electromagnetic-field-data", 1},
    {"se-polarisation-data", 1},
    {"se-radiation-data", 1},
    {"se-holmium-plate", 10},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
  }
  rcp.results = {
    {"se-energy-science-pack-1", 1},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 2
  rcp = data.raw.recipe["se-energy-science-pack-2"]
  rcp.ingredients = {
    {"se-quantum-phenomenon-data", 1},
    {"se-atomic-data", 1},
    {"se-subatomic-data", 1},
    {"se-forcefield-data", 1},
    {"se-energy-science-pack-1", 1},
    {"se-holmium-cable", 12},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
  }
  rcp.results = {
    {"se-energy-science-pack-2", 2},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 3
  rcp = data.raw.recipe["se-energy-science-pack-3"]
  rcp.ingredients = {
    {"se-superconductivity-data", 1},
    {"se-quark-data", 1},
    {"se-entanglement-data", 1},
    {"se-lepton-data", 1},
    {"se-energy-science-pack-2", 2},
    {"se-holmium-solenoid", 5},
    {type = "fluid", name = "se-space-coolant-supercooled", amount = 10},
  }
  rcp.results = {
    {"se-energy-science-pack-3", 3},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"

-- 4
  rcp = data.raw.recipe["se-energy-science-pack-4"]
  rcp.ingredients = {
    {"se-boson-data", 1},
    {"se-fusion-test-data", 1},
    {"se-magnetic-monopole-data", 1},
    {"se-star-probe-data", 1},
    {"se-energy-science-pack-3", 3},
    {"se-quantum-processor", 1},
    {type = "fluid", name = "se-space-coolant-supercooled", amount = 10},
  }
  rcp.results = {
    {"se-energy-science-pack-4", 4},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 10},
  }
  rcp.category = "space-supercomputing-1"


-- Deep Space
-- 1
  rcp = data.raw.recipe["se-deep-space-science-pack-1"]
  rcp.ingredients = {
      {"se-nano-engineering-data", 1},
      {"se-naquium-energy-data", 1},
      {"se-naquium-structural-data", 1},
      {"se-void-probe-data", 1},
      {"se-naquium-plate", 5},
      {type = "fluid", name = "se-neural-gel-2", amount = 2.5},
      {type = "fluid", name = "se-space-coolant-supercooled", amount = 50},
  }
  rcp.results = {
    {"se-deep-space-science-pack-1", 1},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 50},
  }

-- 2
  rcp = data.raw.recipe["se-deep-space-science-pack-2"]
  rcp.ingredients = {
      {"se-annihilation-data", 1},
      {"se-hyperlattice-data", 1},
      {"se-singularity-data", 1},
      {"se-timespace-anomaly-data", 1},
      {"se-deep-space-science-pack-1", 1},
      {"se-naquium-cube", 1},
      {type = "fluid", name = "se-neural-gel-2", amount = 2.5},
      {type = "fluid", name = "se-space-coolant-supercooled", amount = 100},
  }
  rcp.results = {
    {"se-deep-space-science-pack-2", 2},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 100},
  }

-- 3
  rcp = data.raw.recipe["se-deep-space-science-pack-3"]
  rcp.ingredients = {
      {"se-space-dilation-data", 1},
      {"se-space-fold-data", 1},
      {"se-space-injection-data", 1},
      {"se-space-warp-data", 1},
      {"se-deep-space-science-pack-2", 2},
      {"se-naquium-tessaract", 1},
      {type = "fluid", name = "se-neural-gel-2", amount = 2.5},
      {type = "fluid", name = "se-space-coolant-supercooled", amount = 100},
  }
  rcp.results = {
    {"se-deep-space-science-pack-3", 3},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 100},
  }

-- 4
  rcp = data.raw.recipe["se-deep-space-science-pack-4"]
  rcp.ingredients = {
      {"se-interstellar-data", 1},
      {"se-rhga-data", 1},
      {"se-teleportation-data", 1},
      {"se-wormhole-data", 1},
      {"se-deep-space-science-pack-3", 3},
      {"se-naquium-processor", 1},
      {type = "fluid", name = "se-space-coolant-supercooled", amount = 100},
  }
  rcp.results = {
    {"se-deep-space-science-pack-4", 4},
    {"se-junk-data", 4},
    {type = "fluid", name = "se-space-coolant-hot", amount = 100},
  }
