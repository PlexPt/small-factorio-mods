---- INIT ----
-- 初始化事件，当游戏加载或重置时调用
script.on_init(function()
    storage.ion = storage.ion or {}
    -- 初始化存储表，用于存储实体和电源实体
    storage.ion.entities = storage.ion.entities or {}
    storage.ion.generators = storage.ion.generators or {} -- 使用复数形式以区分两个生成器
end)

---- ON EVENT ----
-- 监听机器人建造实体和玩家建造实体的事件
script.on_event({ defines.events.on_robot_built_entity, defines.events.on_built_entity, defines.events.on_space_platform_built_entity }, function(event)
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
    end
end)

-- 监听实体死亡、机器人预挖掘和玩家预挖掘的事件
script.on_event({ defines.events.on_entity_died, defines.events.on_robot_pre_mined, defines.events.on_pre_player_mined_item }, function(event)
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
    end
end)


