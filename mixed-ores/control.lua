--script.on_event(defines.events.on_chunk_generated, function(event)
--
--    local surface = event.surface
--    local left_top = event.area.left_top
--    local right_bottom = event.area.right_bottom
--
--    for x = left_top.x, right_bottom.x do
--        for y = left_top.y, right_bottom.y do
--            local position = { x, y }
--            local resources = surface.find_entities_filtered { position = position, type = "resource" }
--            if resources then
--
--                for _, resource in pairs(resources) do
--                    if resource.name == "stone" or resource.name == "copper-ore" or resource.name == "iron-ore" or resource.name == "coal" or resource.name == "uranium-ore" then
--                        -- 删除原始资源实体
--                        --resource.destroy()
--
--                        -- 创建所有类型的混矿实体
--                        local ores = { "stone", "copper-ore", "iron-ore", "coal", "uranium-ore" }
--                        local resource_amount = resource.amount
--
--                        for _, ore in pairs(ores) do
--                            surface.create_entity {
--                                name = ore,
--                                position = position,
--                                amount = resource_amount
--                            }
--                        end
--                    end
--
--                    if resource.name == "calcite" or resource.name == "tungsten-ore" then
--                        -- 删除原始资源实体
--                        --resource.destroy()
--
--                        -- 创建所有类型的混矿实体
--                        local ores = { "stone", "calcite", "tungsten-ore", "coal" }
--                        local resource_amount = resource.amount
--
--                        for _, ore in pairs(ores) do
--                            surface.create_entity {
--                                name = ore,
--                                position = position,
--                                amount = resource_amount
--                            }
--                        end
--                    end
--
--                    if resource.name == "scrap" then
--                        -- 删除原始资源实体
--                        --resource.destroy()
--
--                        -- 创建所有类型的混矿实体
--                        local ores = { "stone" }
--                        local resource_amount = resource.amount
--
--                        for _, ore in pairs(ores) do
--                            surface.create_entity {
--                                name = ore,
--                                position = position,
--                                amount = resource_amount
--                            }
--                        end
--                    end
--
--                end
--            end
--        end
--    end
--end)

script.on_event(defines.events.on_chunk_generated, function(event)

    local surface = event.surface
    local left_top = event.area.left_top
    local right_bottom = event.area.right_bottom

    local resources = surface.find_entities_filtered { area = event.area, type = "resource" }

    if resources then

        for _, resource in pairs(resources) do
            if resource.name == "stone" or resource.name == "copper-ore" or resource.name == "iron-ore" or resource.name == "coal" or resource.name == "uranium-ore" then
                -- 删除原始资源实体
                --resource.destroy()

                -- 创建所有类型的混矿实体
                local ores = { "stone", "copper-ore", "iron-ore", "coal", "uranium-ore" }
                local resource_amount = resource.amount

                for _, ore in pairs(ores) do
                    surface.create_entity {
                        name = ore,
                        position = resource.position,
                        amount = resource_amount
                    }
                end
            end

            if resource.name == "calcite" or resource.name == "tungsten-ore" then
                -- 删除原始资源实体
                --resource.destroy()

                -- 创建所有类型的混矿实体
                local ores = { "stone", "calcite", "tungsten-ore", "coal" }
                local resource_amount = resource.amount

                for _, ore in pairs(ores) do
                    surface.create_entity {
                        name = ore,
                        position = resource.position,

                        amount = resource_amount
                    }
                end
            end

            if resource.name == "scrap" then
                -- 删除原始资源实体
                --resource.destroy()

                -- 创建所有类型的混矿实体
                local ores = { "stone" }
                local resource_amount = resource.amount

                for _, ore in pairs(ores) do
                    surface.create_entity {
                        name = ore,
                        position = resource.position,
                        amount = resource_amount
                    }
                end
            end
        end
    end
end)
