se_delivery_cannon_recipes["se-beryllium-ingot"]=nil
se_delivery_cannon_recipes["se-iridium-ingot"]=nil
se_delivery_cannon_recipes["se-holmium-ingot"]=nil
se_delivery_cannon_recipes["se-naquium-ingot"]=nil
se_delivery_cannon_recipes["se-beryllium-plate"]={name="se-beryllium-plate"}
se_delivery_cannon_recipes["se-iridium-plate"]={name="se-iridium-plate"}
se_delivery_cannon_recipes["se-holmium-plate"]={name="se-holmium-plate"}
se_delivery_cannon_recipes["se-naquium-plate"]={name="se-naquium-plate"}

local rcp = data.raw.recipe["se-delivery-cannon-capsule"]
rcp.ingredients = {
	{"se-heat-shielding", 1},
}
rcp.result_count = 10
