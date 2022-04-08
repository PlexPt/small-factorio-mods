local data_util=require("data-util")
local rcp = {}

-- Multispectral Astrometric Analysis
  data_util.change_ingredients("se-astrometric-analysis-multispectral-1", nil, {{"se-empty-data", 2}})
  data_util.change_results("se-astrometric-analysis-multispectral-1", nil, {{"se-astrometric-data", 5}})
  data.raw.recipe["se-astrometric-analysis-multispectral-1"].energy_required=10
  data.raw.recipe["se-astrometric-analysis-multispectral-1"].category="space-supercomputing-1"
  data.raw.recipe["se-astrometric-analysis-multispectral-2"].category="space-supercomputing-1"
  data.raw.recipe["se-astrometric-analysis-multispectral-3"].energy_required=3
  data.raw.recipe["se-astrometric-analysis-multispectral-3"].category="space-supercomputing-2"

-- Gamma Ray Observation Data
rcp = data.raw.recipe["se-gammaray-observation-data"]
rcp.ingredients = {
  {"se-empty-data", 4},
  {"se-observation-frame-blank", 20},
  {"se-gammaray-detector", 1},
  {type = "fluid", name = "se-space-coolant-supercooled", amount =3},
}
rcp.results={
  {"se-gammaray-observation-data", 3},
  {name="se-gammaray-observation-data", amount=1, probability=0.4},
  {name="se-junk-data", amount=1, probability=0.6},
  {name="se-scrap", amount=1, probability=0.65},
  {type="fluid", name="se-space-coolant-hot", amount=3},
}
rcp.energy_required=18.2

-- Xray Observation Data
rcp = data.raw.recipe["se-xray-observation-data"]
rcp.ingredients = {
  {"se-empty-data", 3},
  {"se-observation-frame-blank", 15},
  {"se-space-mirror", 1},
  {type = "fluid", name = "se-space-coolant-supercooled", amount = 4},
}
rcp.results={
  {"se-xray-observation-data", 2},
  {name="se-xray-observation-data", amount=1, probability=0.55},
  {name="se-junk-data", amount=1, probability=0.45},
  {name="se-scrap", amount=1, probability=0.4},
  {type="fluid", name="se-space-coolant-hot", amount=4},
}
rcp.energy_required=13.65

-- UV Observation Data
rcp = data.raw.recipe["se-uv-observation-data"]
rcp.ingredients = {
  {"se-empty-data", 1},
  {"se-observation-frame-blank", 5},
  {type = "fluid", name = "se-space-coolant-cold", amount = 8},
}
rcp.results={
  {name="se-uv-observation-data", amount=1, probability=0.9},
  {name="se-junk-data", amount=1, probability=0.1},
  {name="se-scrap",  amount=1, probability=0.05},
  {type="fluid", name="se-space-coolant-hot", amount=8},
}
rcp.energy_required=5.54

-- Visable Observation Data
rcp = data.raw.recipe["se-visible-observation-data"]
rcp.ingredients = {
  {"se-empty-data", 1},
  {"se-observation-frame-blank", 5},
  {type = "fluid", name = "se-space-coolant-cold", amount = 9.6},
}
rcp.results={
  {name="se-visible-observation-data", amount=1, probability=0.98},
  {name="se-junk-data", amount=1, probability=0.02},
  {name="se-scrap",  amount=1, probability=0.05},
  {type="fluid", name="se-space-coolant-hot", amount=9.6},
}
rcp.energy_required=6.58

-- Infrared Observation Data
rcp = data.raw.recipe["se-infrared-observation-data"]
rcp.ingredients = {
  {"se-empty-data", 1},
  {"se-observation-frame-blank", 5},
  {type = "fluid", name = "se-space-coolant-cold", amount = 6},
}
rcp.results={
  {name="se-infrared-observation-data", amount=1, probability=0.85},
  {name="se-junk-data", amount=1, probability=0.15},
  {name="se-scrap", amount=1, probability=0.05},
  {type="fluid", name="se-space-coolant-hot", amount=6},
}
rcp.energy_required=5.51

-- Microwave Observation Data
rcp = data.raw.recipe["se-microwave-observation-data"]
rcp.ingredients = {
  {"se-empty-data", 1},
  {"se-observation-frame-blank", 5},
  {type = "fluid", name = "se-space-coolant-supercooled", amount = 4},
}
rcp.results={
  {name="se-microwave-observation-data", amount=1, probability=0.75},
  {name="se-junk-data", amount=1, probability=0.25},
  {name="se-scrap",  amount=1, probability=0.05},
  {type="fluid", name="se-space-coolant-hot", amount=4},
}
rcp.energy_required=5.25

-- Radio Wave Observation Data
rcp = data.raw.recipe["se-radio-observation-data"]
rcp.ingredients = {
  {"se-empty-data", 1},
  {"se-observation-frame-blank", 5},
  {type = "fluid", name = "se-space-coolant-supercooled", amount = 2.4},
}
rcp.results={
  {name="se-radio-observation-data", amount=1, probability=0.6},
  {name="se-junk-data", amount=1, probability=0.4},
  {name="se-scrap",  amount=1, probability=0.05},
  {type="fluid", name="se-space-coolant-hot", amount=2.4},
}
rcp.energy_required=3.96

-- data.raw["assembling-machine"]["se-space-astrometrics-laboratory"]=nil
