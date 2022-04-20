
local crafting_categories = {}
for k, v in pairs(data.raw["recipe-category"]) do
    if k then
        table.insert(crafting_categories, k)
    end
end

data.raw["assembling-machine"]["universal-machine"]["crafting_categories"] = crafting_categories
