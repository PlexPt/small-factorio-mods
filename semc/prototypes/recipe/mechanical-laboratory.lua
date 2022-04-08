local data_util=require("data-util")

data_util.change_ingredients("se-naquium-structural-data", {"se-naquium-ingot"}, {{"se-naquium-plate", 1}})

data_util.change_results("se-compressive-strength-data", {"se-contaminated-space-water"}, nil)

data_util.change_results("se-tensile-strength-data", {"se-contaminated-space-water"}, nil)

data_util.change_results("se-rigidity-data", {"se-contaminated-space-water"}, nil)

data_util.change_results("se-ballistic-shielding-data", {"se-contaminated-space-water"}, nil)

data_util.change_results("se-friction-data", {"se-contaminated-space-water"}, nil)
  
data_util.change_results("se-biomechanical-data", {"se-contaminated-space-water"}, nil)

data_util.change_results("se-biomechanical-resistance-data", {"se-contaminated-space-water"}, nil)
