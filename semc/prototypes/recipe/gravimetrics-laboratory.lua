local data_util=require("data-util")

data.raw.recipe["se-timespace-anomaly-data"].energy_required = 60
data_util.change_results("se-wormhole-data", {"se-space-coolant-warm"}, {{type = "fluid", name = "se-space-coolant-hot", amount = 10}})

-- remove significant data
  data_util.change_ingredients("se-space-fold-data", {"se-significant-data"}, {{"se-empty-data", 1}})
  data_util.change_ingredients("se-space-fold-data-alt", {"se-significant-data"}, {{"se-empty-data", 1}})
  data_util.change_ingredients("se-space-warp-data", {"se-significant-data"}, {{"se-empty-data", 1}})
  data_util.change_ingredients("se-space-warp-data-alt", {"se-significant-data"}, {{"se-empty-data", 1}})
  data_util.change_ingredients("se-space-dilation-data", {"se-significant-data"}, {{"se-empty-data", 1}})
  data_util.change_ingredients("se-space-dilation-data-alt", {"se-significant-data"}, {{"se-empty-data", 1}})
  data_util.change_ingredients("se-space-injection-data", {"se-significant-data"}, {{"se-empty-data", 1}})
  data_util.change_ingredients("se-space-injection-data-alt", {"se-significant-data"}, {{"se-empty-data", 1}})
