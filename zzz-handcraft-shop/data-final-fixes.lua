local machine_types = {
    "furnace",
    "assembling-machine",
    "mining-drill",
    "generator",
    "lab",
    "boiler"
}
-- 如果 space-age mod 开启，追加类型
if mods["space-age"] then
    table.insert(machine_types, "agricultural-tower")
    table.insert(machine_types, "fusion-reactor")
    table.insert(machine_types, "fusion-generator")
    table.insert(machine_types, "lightning-attractor")
    table.insert(machine_types, "thruster")
    table.insert(machine_types, "asteroid-collector")
end

for k, v in pairs(data.raw["recipe"]) do
    local results = data.raw["recipe"][k]["results"]
    if results then
        local resultname = results[1] and results[1].name or "zzz-handcraft-shop-unknown"
        -- 组装机炉子，除了石头做的，都替换成铁板，堆叠改大
        if resultname and string.match(resultname, "stone") == nil then
            for _, machine_type in ipairs(machine_types) do
                if data.raw[machine_type][resultname] then
                    data.raw["recipe"][k].ingredients = { { type = "item", name = "iron-plate", amount = 100 } }
                    data.raw["recipe"][k].energy_required = 0.1
                    local dataItem = data.raw["item"][resultname]

                    if dataItem then
                        if dataItem.stack_size and dataItem.stack_size < 100 then
                            dataItem.stack_size = 100
                        end
                    end
                end
            end
        end
    end
end
