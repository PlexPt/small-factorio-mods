local data_util=require("data-util")

data_util.change_results("se-radiation-shielding-data", {"uranium-235"}, {{"uranium-238", 1}})

data_util.change_results("se-radiation-data", {"uranium-235"}, {{"uranium-238", 1}})

data_util.change_results("se-radiation-exposure-data", {"uranium-235"}, {{"uranium-238", 1}})

data_util.change_results("se-radiation-exposure-resistance-data", {"uranium-235"}, {{"uranium-238", 1}})
