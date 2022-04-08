local data_util=require("data-util")

data_util.change_results("se-gravity-wave-data", {"se-space-coolant-warm"}, {{type = "fluid", name = "se-space-coolant-hot", amount = 10}})

data_util.change_results("se-polarisation-data", {"se-space-coolant-warm"}, {{type = "fluid", name = "se-space-coolant-hot", amount = 10}})

data_util.change_results("se-zero-point-energy-data", {"se-space-coolant-warm"}, {{type = "fluid", name = "se-space-coolant-hot", amount = 10}})
  
data_util.change_results("se-teleportation-data", {"se-space-coolant-warm"}, {{type = "fluid", name = "se-space-coolant-hot", amount = 10}})
