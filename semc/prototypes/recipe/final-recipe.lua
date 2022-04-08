local data_util=require("data-util")

data_util.change_ingredients("productivity-module-5", {"se-vitamelange-extract"}, {{"se-vitamelange-spice", 20}})
if mods["Krastorio2"] then
    data_util.change_ingredients("space-research-data", {"se-vitamelange-extract"}, {{"se-vitamelange-spice", 4}})
    --data_util.change_ingredients("rocket-fuel-with-ammonia", {"oxygen"}, {{"oxygen", 10}})
    --data_util.change_ingredients("rocket-fuel-with-ammonia", {"ammonia"}, {{"ammonia", 10}})
end
