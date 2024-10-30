for k, v in pairs(data.raw["recipe"]) do

    local resultname = data.raw["recipe"][k]["result"]
    --组装机炉子，除了石头做的，都替换成铁板，堆叠改大
    if resultname and string.match(resultname, "stone") == nil then
        if (data.raw.furnace[resultname]
                or data.raw["assembling-machine"][resultname]
                or data.raw["mining-drill"][resultname]
                or data.raw["generator"][resultname]
                or data.raw["lab"][resultname]
                or data.raw["boiler"][resultname]) then
            data.raw["recipe"][k].ingredients = {
                { "iron-plate", 100 },
            }
            data.raw["recipe"][k].energy_required = 0.1
            local dataItem = data.raw["item"][resultname]

            if dataItem then
                dataItem.stack_size = 600
            end
        end
    end

end
