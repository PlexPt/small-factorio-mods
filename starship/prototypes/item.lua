
local starship_silo_item = table.deepcopy(data.raw["item"]["rocket-silo"])
starship_silo_item.name = "starship-silo-item"
starship_silo_item.place_result = "starship-silo"
data:extend{starship_silo_item}

