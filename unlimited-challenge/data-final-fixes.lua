local sc = data.raw["container"]["steel-chest"]
if sc then
    sc.inventory_size = 60000
end

local ic = data.raw["container"]["iron-chest"]
if ic then
    ic.inventory_size = 30000
end

local wc = data.raw["container"]["wooden-chest"]
if wc then
    wc.inventory_size = 10000
end

--local belt1 = data.raw["transport-belt"]["transport-belt"]
--if belt1 then
--    belt1.speed = 10
--end
--
--local belt2 = data.raw["transport-belt"]["fast-transport-belt"]
--if belt2 then
--    belt2.speed = 100
--end
--
--local belt3 = data.raw["transport-belt"]["express-transport-belt"]
--if belt3 then
--    belt3.speed = 1000
--end
--
--local splitter1 = data.raw["splitter"]["splitter"]
--if splitter1 then
--    splitter1.speed = 10
--end
--
--local splitter2 = data.raw["splitter"]["fast-splitter"]
--if splitter2 then
--    splitter2.speed = 100
--end
--
--local splitter3 = data.raw["splitter"]["express-splitter"]
--if splitter3 then
--    splitter3.speed = 1000
--end

local ubelt1 = data.raw["underground-belt"]["underground-belt"]
if ubelt1 then
    ubelt1.max_distance = 250
end
local ubelt2 = data.raw["underground-belt"]["fast-underground-belt"]
if ubelt2 then
    ubelt2.max_distance = 250
end
local ubelt3 = data.raw["underground-belt"]["express-underground-belt"]
if ubelt3 then
    ubelt3.max_distance = 250
end

local u1 = data.raw["unit"]["small-biter"]
if u1 then
    u1.max_health = 100000
end

local u2 = data.raw["unit"]["small-spitter"]
if u2 then
    u2.max_health = 100000
end

local u3 = data.raw["unit"]["big-biter"]
if u3 then
    u3.max_health = 10000000
end

local u4 = data.raw["unit"]["big-spitter"]
if u4 then
    u4.max_health = 10000000
end

local u5 = data.raw["unit"]["behemoth-spitter"]
if u5 then
    u5.max_health = 1000000000
end

local u6 = data.raw["unit"]["behemoth-biter"]
if u6 then
    u6.max_health = 1000000000
end

--for x = 1, 9 do
--    local mytree = data.raw["tree"]["tree-0" .. x]
--    if mytree then
--        mytree.max_health = 100000 * x
--    end
--end

local beacon1 = data.raw["beacon"]["beacon"]
if beacon1 then
    beacon1.supply_area_distance = 64
    beacon1.module_specification = {
        module_slots = 600,
        module_info_icon_shift = { 0, 0 },
        module_info_multi_row_initial_height_modifier = -0.3,
        module_info_max_icons_per_row = 20
    }
end
