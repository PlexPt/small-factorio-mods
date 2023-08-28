log("==============================开始加载复制item=================================")

local function table_contains(table, value)
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end


local items = data.raw["item"]

for _, item in pairs(items) do
    -- 检查物品是否有not-stackable标志
    if not (item.flags and table_contains(item.flags, "not-stackable")) then
        -- 创建复制配方的代码

        data:extend({
            {
                type = "recipe",
                name = "cloning-vat-" .. item.name,
                category = "cloning",
                enabled = true,
                hidden = true,
                hide_from_player_crafting = true,
                allow_decomposition = false,
                allow_as_intermediate = false,
                energy_required = 10,
                ingredients = { { item.name, 1 } },
                result = item.name,
                result_count = 2
            }
        })
    else
        log("==============================跳过复制=================================")
        log(serpent.block(item))
    end
end
log("==============================开始加载复制fluid=================================")

local fluids = data.raw["fluid"]

for _, fluid in pairs(fluids) do

        data:extend({
            {
                type = "recipe",
                name = "cloning-vat-fluid-" .. fluid.name,
                category = "cloning",
                enabled = true,
                hidden = true,
                hide_from_player_crafting = true,
                allow_decomposition = false,
                allow_as_intermediate = false,
                energy_required = 10,
                ingredients = { { type = "fluid", name = fluid.name, amount = 100 } }, -- 可以调整amount值以匹配您希望的输入量
                results = {
                    { type = "fluid", name = fluid.name, amount = 200 }, -- 输出是输入的两倍
                },
                main_product = fluid.name,
            }
        })

end
