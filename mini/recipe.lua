--修改炼油厂2配方
-- 修改高级炼油配方，使用水桶代替水

--    type = "recipe",
--    name = "advanced-oil-processing",

local advancedOilProcessingRecipe = data.raw["recipe"]["advanced-oil-processing"]

if advancedOilProcessingRecipe then

    if advancedOilProcessingRecipe.ingredients[1] and advancedOilProcessingRecipe.ingredients[1].name == "water" then
        advancedOilProcessingRecipe.ingredients[1] = { type = "item", name = "water-barrel", amount = 1 }
    end

    -- 确保使用后的水桶返回
    -- 添加结果中的空桶，以确保使用后的桶返回
    table.insert(advancedOilProcessingRecipe.results, { type = "item", name = "barrel", amount = 1 })
end

-- 修改 coal-liquefaction 配方
local coalLiquefactionRecipe = data.raw["recipe"]["coal-liquefaction"]
if coalLiquefactionRecipe then

    if coalLiquefactionRecipe.ingredients[3] and coalLiquefactionRecipe.ingredients[3].name == "steam" then
        coalLiquefactionRecipe.ingredients[3] = { type = "item", name = "steam-barrel", amount = 1 }
    end

    -- 确保使用后的蒸汽桶返回
    table.insert(coalLiquefactionRecipe.results, { type = "item", name = "barrel", amount = 1 })
end


-- 修改 basic-oil-processing 配方
local basicOilProcessingRecipe = data.raw["recipe"]["basic-oil-processing"]
basicOilProcessingRecipe.ingredients[1].fluidbox_index = nil
basicOilProcessingRecipe.results[1].fluidbox_index = nil



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
local cokeLiquefactionRecipe = data.raw["recipe"]["coke-liquefaction"]

if cokeLiquefactionRecipe then
    --if cokeLiquefactionRecipe.ingredients[2] and cokeLiquefactionRecipe.ingredients[2].name == "light-oil" then
    --    cokeLiquefactionRecipe.ingredients[2] = { type = "item", name = "light-oil-barrel", amount = 1 }
    --end

    if cokeLiquefactionRecipe.ingredients[3] and cokeLiquefactionRecipe.ingredients[3].name == "steam" then
        cokeLiquefactionRecipe.ingredients[3] = { type = "item", name = "steam-barrel", amount = 1 }
    end

    -- 确保使用后的蒸汽桶返回
    table.insert(cokeLiquefactionRecipe.results, { type = "item", name = "barrel", amount = 1 })
end

