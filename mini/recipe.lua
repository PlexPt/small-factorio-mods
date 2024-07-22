--修改炼油厂2配方
--    type = "recipe",
--    name = "advanced-oil-processing",

local r1 = data.raw["recipe"]["advanced-oil-processing"]

if r1 then

    if r1.ingredients[1] and r1.ingredients[1].name == "water" then
        r1.ingredients[1] = { type = "item", name = "water-barrel", amount = 1 }
    end

    -- 确保使用后的水桶返回
    table.insert(r1.results, { type = "item", name = "empty-barrel", amount = 1 })
end

-- 修改 coal-liquefaction 配方
local r2 = data.raw["recipe"]["coal-liquefaction"]
if r2 then

    if r2.ingredients[3] and r2.ingredients[3].name == "steam" then
        r2.ingredients[3] = { type = "item", name = "steam-barrel", amount = 1 }
    end

    -- 确保使用后的蒸汽桶返回
    table.insert(r2.results, { type = "item", name = "empty-barrel", amount = 1 })
end


-- 修改 basic-oil-processing 配方
local r3 = data.raw["recipe"]["basic-oil-processing"]
r3.ingredients[1].fluidbox_index = nil
r3.results[1].fluidbox_index = nil



-- 修改 coke-liquefaction 配方（针对 K2 模组）
--{
--  {
--    type = "recipe",
--    name = "coke-liquefaction",
--    category = "oil-processing",
--    icon = kr_recipes_icons_path .. "coke-liquefaction.png",
--    icon_size = 64,
--    enabled = false,
--    energy_required = 5,
--    ingredients = {
--      { type = "item", name = "coke", amount = 10 },
--      { type = "fluid", name = "light-oil", amount = 25 },
--      { type = "fluid", name = "steam", amount = 50 },
--    },
--    results = {
--      { type = "fluid", name = "heavy-oil", amount = 20 },
--      { type = "fluid", name = "light-oil", amount = 90 },
--      { type = "fluid", name = "petroleum-gas", amount = 10 },
--    },
--
--    subgroup = "fluid-recipes",
--    order = "a[oil-processing]-d[coke-liquefaction]",
--    allow_productivity = true,
--    always_show_made_in = true,
--    always_show_products = true,
--    allow_decomposition = false,
--  },
--}
local r4 = data.raw["recipe"]["coke-liquefaction"]

if r4 then
    --if r4.ingredients[2] and r4.ingredients[2].name == "light-oil" then
    --    r4.ingredients[2] = { type = "item", name = "light-oil-barrel", amount = 1 }
    --end

    if r4.ingredients[3] and r4.ingredients[3].name == "steam" then
        r4.ingredients[3] = { type = "item", name = "steam-barrel", amount = 1 }
    end

    -- 确保使用后的蒸汽桶返回
    table.insert(r4.results, { type = "item", name = "empty-barrel", amount = 1 })
end

