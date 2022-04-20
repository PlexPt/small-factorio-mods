require("item_stack_upgrade")

data.raw["recipe"]["small-lamp"].ingredients = {
    { "iron-stick", 10 },
}
data.raw["recipe"]["lab"].ingredients = {
    { "iron-stick", 10 },
}

local wb = data.raw["recipe"]["warehouse-basic"]
if wb then
    wb .ingredients = {
        { "iron-plate", 10 },
    }
end

local sb = data.raw["recipe"]["storehouse-basic"]
if sb then
    sb .ingredients = {
        { "iron-plate", 10 },
    }
end

--解锁皮带
if data.raw["recipe"]["belt"] then
    data.raw["recipe"]["belt"].enabled = true
end

for k, v in pairs(data.raw["recipe"]) do

    local resultname = data.raw["recipe"][k]["result"]
    --组装机炉子，除了石头做的，都替换成铁板，堆叠改成1000
    if resultname and string.match(resultname, "stone") == nil then
        if (data.raw.furnace[resultname] or  data.raw["assembling-machine"][resultname] or  data.raw["mining-drill"][resultname]) then
            data.raw["recipe"][k].ingredients= {
                { "iron-plate", 100 },
            }

            local dataItem = data.raw["item"][resultname]

            if dataItem then
                dataItem.stack_size = 1000
            end
        end
    end
    --  配料表
    --if data.raw["recipe"][k]["ingredients"] then
    --
    --    if ((data.raw["recipe"][k]["result"]) and data.raw["recipe"][k]["result"]) then
    --
    --    end
    --
    --
    --    -- debug, see what recipe looks like before being modified
    --    --log(serpent.block(data.raw["recipe"][k]))
    --
    --    --end
    --
    --    -- debug, see what recipe looks like after being modified
    --    --log(serpent.block(data.raw["recipe"][k]))
    --end
end
