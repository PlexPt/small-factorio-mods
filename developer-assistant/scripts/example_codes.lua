return {
    -- 常用变量获取
    [[
           local player = game.player
           local surface = player.surface -- or game.get_surface(1)
           local position = player.position
           local character = player.character  --这个玩家的角色（如果有）
           --获取当前存在的所有行星的表
           local planets = game.planets
           local space_enabled = script.active_mods["space-age"]   -- 太空DLC开启了吗

    ]],
    -- 玩家打印
    [[
           game.print('Hello, World!')
    ]],

    -- 修改玩家属性
    [[
           local player = game.players[1]

           -- 确保玩家与角色相关联
           if player.character then
               -- 修改角色的crafting速度
               player.character_crafting_speed_modifier = 2.0

               -- 修改角色的mining速度
               player.character_mining_speed_modifier = 1.5

               -- 修改角色的额外mining类别
               player.character_additional_mining_categories = {"basic-solid", "basic-liquid"}

               -- 修改角色的奔跑速度
               player.character_running_speed_modifier = 0.8

               -- 修改角色的建造距离bonus
               player.character_build_distance_bonus = 5

               -- 修改角色的物品丢弃距离bonus
               player.character_item_drop_distance_bonus = 10

               -- 修改角色的reach距离bonus
               player.character_reach_distance_bonus = 2

               -- 修改角色的资源reach距离bonus
               player.character_resource_reach_distance_bonus = 3

               -- 修改角色的物品捡取距离bonus
               player.character_item_pickup_distance_bonus = 4

               -- 修改角色的战利品捡取距离bonus
               player.character_loot_pickup_distance_bonus = 6

               -- 修改角色的库存槽位bonus
               player.character_inventory_slots_bonus = 2

               -- 修改角色的垃圾槽位bonus
               player.character_trash_slot_count_bonus = 1

               -- 修改角色的最大跟随机器人数量bonus
               player.character_maximum_following_robot_count_bonus = 5

               -- 修改角色的健康bonus
               player.character_health_bonus = 50
           end
    ]],

    -- 获取玩家属性
    [[
           local player = game.players[1]

           -- 确保玩家与角色相关联
           if player.character then
               -- 获取角色的crafting速度
               local crafting_speed_modifier = player.character_crafting_speed_modifier
               player.print("Crafting Speed Modifier: " .. crafting_speed_modifier)

               -- 获取角色的mining速度
               local mining_speed_modifier = player.character_mining_speed_modifier
               player.print("Mining Speed Modifier: " .. mining_speed_modifier)

               -- 获取角色的额外mining类别
               local additional_mining_categories = player.character_additional_mining_categories
               player.print("Additional Mining Categories: " .. table.concat(additional_mining_categories, ", "))

               -- 获取角色的奔跑速度
               local running_speed_modifier = player.character_running_speed_modifier
               player.print("Running Speed Modifier: " .. running_speed_modifier)

               -- 获取角色的建造距离bonus
               local build_distance_bonus = player.character_build_distance_bonus
               player.print("Build Distance Bonus: " .. build_distance_bonus)

               -- 获取角色的物品丢弃距离bonus
               local item_drop_distance_bonus = player.character_item_drop_distance_bonus
               player.print("Item Drop Distance Bonus: " .. item_drop_distance_bonus)

               -- 获取角色的reach距离bonus
               local reach_distance_bonus = player.character_reach_distance_bonus
               player.print("Reach Distance Bonus: " .. reach_distance_bonus)

               -- 获取角色的资源reach距离bonus
               local resource_reach_distance_bonus = player.character_resource_reach_distance_bonus
               player.print("Resource Reach Distance Bonus: " .. resource_reach_distance_bonus)

               -- 获取角色的物品捡取距离bonus
               local item_pickup_distance_bonus = player.character_item_pickup_distance_bonus
               player.print("Item Pickup Distance Bonus: " .. item_pickup_distance_bonus)

               -- 获取角色的战利品捡取距离bonus
               local loot_pickup_distance_bonus = player.character_loot_pickup_distance_bonus
               player.print("Loot Pickup Distance Bonus: " .. loot_pickup_distance_bonus)

               -- 获取角色的库存槽位bonus
               local inventory_slots_bonus = player.character_inventory_slots_bonus
               player.print("Inventory Slots Bonus: " .. inventory_slots_bonus)

               -- 获取角色的垃圾槽位bonus
               local trash_slot_count_bonus = player.character_trash_slot_count_bonus
               player.print("Trash Slot Count Bonus: " .. trash_slot_count_bonus)

               -- 获取角色的最大跟随机器人数量bonus
               local maximum_following_robot_count_bonus = player.character_maximum_following_robot_count_bonus
               player.print("Maximum Following Robot Count Bonus: " .. maximum_following_robot_count_bonus)

               -- 获取角色的健康bonus
               local health_bonus = player.character_health_bonus
               player.print("Health Bonus: " .. health_bonus)
           end
    ]],

    -- 在指定位置创建一个箱子
    [[
           local player = game.player
           local surface = player.surface
           local position = {10, 10}
           surface.create_entity {
               name = "wooden-chest",
               position = position
           }
    ]],

    -- 读取玩家的位置
    [[
           local player = game.players[1]  -- 获取第一个玩家
           return player.position
    ]],

    -- 传送玩家
    [[
           local player = game.players[1]  -- 获取第一个玩家
           player.teleport({0,0}, player.surface )

    ]],

    -- 在玩家附近创建一个机器人
    [[
           local player = game.players[1]  -- 获取第一个玩家
           local position = player.position
           local surface = player.surface -- or game.get_surface(1)
           surface.create_entity {
               name = "construction-robot",
               position = {position.x + 1, position.y}
           }
    ]],

    -- 获取玩家屏幕height
    [[
           local player = game.players[1]  -- 获取第一个玩家
           player.print(player.display_resolution.height / player.display_scale)
    ]],

    -- serpent 表序列化为string
    [[
           serpent.block({})
           serpent.dump({})
    ]],

    -- 添加新的资源补丁
    [[
           local player = game.players[1]
           -- 以玩家为中心，创造一个新的5x5的资源补丁，对于除了石头以外的资源，只需将"stone"改为"iron-ore"，"copper-ore"或者"coal"。
           local surface = player.surface;
           for y=-6,6 do
            for x=-6,6 do
             surface.create_entity({name="stone", amount=5000, position={player.position.x+x, player.position.y+y}})
            end
           end
    ]],

    -- 玩家手持物品增加
    [[
           local player = game.players[1]
           player.insert{name=game.player.cursor_stack.name, count=10000}
    ]],

    -- 向玩家库存添加物品
    [[
           local player = game.players[1]
           player.insert{name="iron-plate", count=100}
           player.insert{name="advanced-circuit", count=100}
           player.insert{name="processing-unit", count=100}
           player.insert{name="steel-plate", count=100}
           player.insert{name="mech-armor",count=1, quality = "legendary"} -- 传奇品质的
    ]],

    -- 完成研究
    [[
           local player = game.players[1]
           player.print(game.player.force.current_research.name )
           player.force.current_research.researched=true
           -- player.force.technologies['se-zone-discovery-random'].researched=true
           -- 所有队伍
           -- for _, e in pairs(game.players)
           --    do game.player.force.technologies['se-zone-discovery-random'].researched=true
           -- end

    ]],
    -- 启用和平模式
    [[
           local player = game.players[1]
           -- 在和平模式下，虫子只会在被激怒的情况下才会发起攻击。
           player.surface.peaceful_mode = true

    ]],

    -- 杀死所有虫子
    [[
           local player = game.players[1]
           -- 杀死所有“敌方”势力的虫子  虫巢不会被杀死。
           game.forces["enemy"].kill_all_units()
    ]],

    -- 找东西
    [[
           local player = game.players[1]
           return (player.surface.find_entities_filtered {  name = 'tree-01'} )
    ]],

    -- 清理杂草
    [[
           local player = game.players[1]
           player.surface.destroy_decoratives{}
    ]],

    -- 清理尸体
    [[
           local player = game.players[1]
           local surface = player.surface
           for c in surface.get_chunks() do
           for key, entity in pairs(surface.find_entities_filtered({area={{c.x * 32, c.y * 32}, {c.x * 32 + 32, c.y * 32 + 32}}, type = "corpse"})) do
                 entity.destroy()
               end
           end
    ]],

    -- 删除所有悬崖
    [[
           local player = game.players[1]
           for _, v in pairs(player.surface.find_entities_filtered{type="cliff"}) do
             v.destroy()
           end
           --Turn off cliff generation
           --Sets size to "none". Only effective on chunks that are generated after using this command. Use #Remove all cliffs to delete existing cliffs.
           local mgs = player.surface.map_gen_settings
           mgs.cliff_settings.cliff_elevation_0 = 0
           player.surface.map_gen_settings = mgs

    ]],

    -- 清除所有污染
    [[
           local player = game.players[1]
           -- 清除所有污染
           player.surface.clear_pollution()
           -- Completely turn off pollution
           for _, surface in pairs(game.surfaces) do
             surface.clear_pollution()
           end
           game.map_settings.pollution.enabled = false

    ]],

}
