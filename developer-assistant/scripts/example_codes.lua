return {
    ["常用变量获取"] = [[
        local player = game.player
        local surface = player.surface -- or game.get_surface(1)
        local position = player.position
        local character = player.character  --这个玩家的角色（如果有）
        --获取当前存在的所有行星的表
        local planets = game.planets
        local space_enabled = script.active_mods["space-age"]   -- 太空DLC开启了吗

    ]],
    ["玩家打印"] = [[
        game.print('Hello, World!')
    ]],

    ["修改玩家属性"] = [[
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

    ["获取玩家属性"] = [[
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

    ["在指定位置创建一个箱子"] = [[
        local player = game.player
        local surface = player.surface
        local position = {10, 10}
        surface.create_entity {
            name = "wooden-chest",
            position = position
        }
    ]],

    ["读取玩家的位置"] = [[
        local player = game.players[1]  -- 获取第一个玩家
        local mouse_position = player.position
        game.print("Mouse position:", mouse_position.x, mouse_position.y)
    ]],

    ["在玩家附近创建一个机器人"] = [[
        local player = game.players[1]  -- 获取第一个玩家
        local position = player.position
        game.create_entity {
            name = "construction-robot",
            position = {position.x + 1, position.y}
        }
    ]],

    ["获取玩家屏幕height"] = [[
        local player = game.players[1]  -- 获取第一个玩家
        player.print(player.display_resolution.height / player.display_scale)
    ]],
}
