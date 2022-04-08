local bt = data.raw["burner-generator"]["burner-turbine"]
--热力涡轮发电+++
if bt then
    bt.max_power_output = "1GW"
    bt.localised_name = { "entity-name.semcbt" }
    bt.localised_description = { "entity-description.semcbt" }
end

local st = data.raw["generator"]["steam-turbine"]

if st then
    st.max_power_output = "10GW"
    st.localised_name = { "entity-name.semcbt2" }
    st.localised_description = { "entity-description.semcbt2" }
end

--隔热瓦多一些
local rcp = data.raw.recipe["se-heat-shielding"]
if rcp then
    rcp.result_count = 10
    rcp.energy_required = 1
end

--火箭燃料多一些
local rcp = data.raw.recipe["rocket-fuel-with-ammonia"]
if rcp then
    rcp.result_count = 100
    rcp.energy_required = 1
end

--时间短一些 quick-craft
if settings.startup["quick-craft"].value then
    for k, v in pairs(data.raw["recipe"]) do
        if v.energy_required and v.energy_required > 1 then
            v.energy_required = 1
        end
    end
end
