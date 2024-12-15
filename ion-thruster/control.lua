if script.active_mods["gvv"] then
    require("__gvv__.gvv")()
end

---- INIT ----
-- 初始化事件，当游戏加载或重置时调用
local function on_init()
    storage.ion = storage.ion or {}
    -- 初始化存储表，用于存储实体和电源实体
    storage.ion.entities = storage.ion.entities or {}
    storage.ion.generators = storage.ion.generators or {} -- 使用复数形式以区分两个生成器
    storage.ion.unit = storage.ion.unit or {} -- 使用复数形式以区分两个生成器
end

local function on_built(event)
    local entity = event.entity
    if not entity then
        return
    end


    -- 检查实体类型是否为传送带、地下传送带、分流器或装载机
    if entity.name == "ion-thruster" then
        -- 获取实体位置
        local pos = entity.position.x .. " " .. entity.position.y
        local generator_pos = {
            x = entity.position.x - 1.5,
            y = entity.position.y,
        }
        local generator_pos2 = {
            x = entity.position.x + 1.5,
            y = entity.position.y,
        }

        -- 在相同位置创建第一个电源实体
        local generator1 = entity.surface.create_entity {
            name = "ion-thruster-xenon-generator",
            position = generator_pos,
            force = entity.force, -- 电源实体所属势力
            direction = entity.direction, -- 电源实体方向
            destructible = false -- 电源实体不可破坏
        }
        storage.ion.generators[pos .. "_1"] = generator1

        -- 在相同位置创建第二个电源实体
        local generator2 = entity.surface.create_entity {
            name = "ion-thruster-xenon-generator",
            position = generator_pos2,
            force = entity.force, -- 电源实体所属势力
            direction = defines.direction.north, -- 电源实体方向
            destructible = false -- 电源实体不可破坏
        }
        storage.ion.generators[pos .. "_2"] = generator2

        -- 存储实体
        storage.ion.entities[pos] = entity

        if entity.unit_number then
            storage.ion.unit[entity.unit_number] = {
                entity = entity.unit_number,
                generator1 = generator1.unit_number,
                generator2 = generator2.unit_number,
            }
        end

    end
end


local function on_entity_died(event)
    local entity = event.entity
    if not entity then
        return
    end

    -- 获取实体位置
    local pos = entity.position.x .. " " .. entity.position.y

    -- 如果该位置有存储的实体
    if storage.ion.entities[pos] ~= nil then
        -- 销毁第一个电源实体
        if storage.ion.generators[pos .. "_1"] then
            storage.ion.generators[pos .. "_1"].destroy()
            storage.ion.generators[pos .. "_1"] = nil
        end

        -- 销毁第二个电源实体
        if storage.ion.generators[pos .. "_2"] then
            storage.ion.generators[pos .. "_2"].destroy()
            storage.ion.generators[pos .. "_2"] = nil
        end

        -- 清空存储表中的实体
        storage.ion.entities[pos] = nil

        if entity.unit_number then
            storage.ion.unit[entity.unit_number] = nil
        end
    end
end



local filter = { { filter = "name", name = "ion-thruster" } }

script.on_init(on_init)
script.on_configuration_changed(on_init)

---- ON EVENT ----
-- 监听机器人建造实体和玩家建造实体的事件
script.on_event(defines.events.on_robot_built_entity, on_built, filter)
script.on_event(defines.events.on_built_entity, on_built, filter)
script.on_event(defines.events.script_raised_revive, on_built, filter)
script.on_event(defines.events.script_raised_built, on_built, filter)
script.on_event(defines.events.on_space_platform_built_entity, on_built, filter)

-- 监听实体死亡、机器人预挖掘和玩家预挖掘的事件
script.on_event(defines.events.on_entity_died, on_entity_died, filter)
script.on_event(defines.events.script_raised_destroy, on_entity_died, filter)
script.on_event(defines.events.on_robot_pre_mined, on_entity_died, filter)
script.on_event(defines.events.on_space_platform_mined_entity, on_entity_died, filter)
script.on_event(defines.events.on_pre_player_mined_item, on_entity_died, filter)



script.on_nth_tick(600, function()

    for unit_number, data in pairs(storage.ion.unit) do
        local entity = game.get_entity_by_unit_number(unit_number)
        local generator1 = game.get_entity_by_unit_number(data.generator1)
        local generator2 = game.get_entity_by_unit_number(data.generator2)
        if not (entity and entity.valid) then
            if generator1 and generator1.valid then
                generator1.destroy()
                storage.ion.unit[unit_number] = nil
            end
            if generator2 and generator2.valid then
                generator2.destroy()
                storage.ion.unit[unit_number] = nil
            end
        end
    end
end)
