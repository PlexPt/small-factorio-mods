-- control.lua

function loge(entity, name)
    if name == nil then
        name = ""
    end
    log("=======================" .. name .. "==============================")
    log(serpent.block(entity))
    log("=======================" .. name .. "==============================")
end

-- 注册事件，当玩家建造实体时触发
script.on_event(defines.events.on_built_entity, function(event)
    local entity = event.entity  -- 获取新建的实体
    local player = game.get_player(event.player_index)  -- 获取玩家

    -- 打印实体的基础信息
    log("Entity built by player " .. player.name)
    log("Entity type: " .. entity.type)
    log("Entity name: " .. entity.name)
    log("Position: (" .. entity.position.x .. ", " .. entity.position.y .. ")")
    log("Force: " .. entity.force.name)

    local one = ("data.raw[\"" .. entity.type .. "\"][\"" .. entity.name .. "\"]")

    log("Entity: " .. one)


    -- 如果实体有更多详细信息，可以继续打印
    loge(entity.prototype)

end)
