local bigunpack = require("lib.unpack")

-- Function to create GUI for entity details
local function create_entity_details_gui(player)
    -- Check if GUI already exists and destroy it
    if player.gui.screen["dev_entity_details_frame"] then
        player.gui.screen["dev_entity_details_frame"].destroy()
    end

    -- Create main frame in screen location
    local main_frame = player.gui.screen.add {
        type = "frame",
        name = "dev_entity_details_frame",
        direction = "vertical"
    }
    main_frame.style.maximal_width = 960
    main_frame.style.maximal_height = 800
    main_frame.auto_center = true

    -- Title bar with drag handle and close button
    local title_table = main_frame.add {
        type = "table",
        name = "title_table",
        column_count = 3
    }
    title_table.style.horizontally_stretchable = true
    title_table.style.column_alignments[1] = "left"
    title_table.style.column_alignments[2] = "left"
    title_table.style.column_alignments[3] = "right"

    -- Title
    title_table.add {
        type = "label",
        name = "title_label",
        caption = "Entity Details",
        style = "frame_title"
    }

    -- Drag handle
    local drag_handle = title_table.add {
        type = "empty-widget",
        style = "draggable_space"
    }
    drag_handle.style.height = 24
    drag_handle.style.horizontally_stretchable = true
    drag_handle.drag_target = main_frame

    -- Close button
    local close_button = title_table.add {
        type = "sprite-button",
        name = "dev_entity_details_close",
        sprite = "utility/close",
        style = "frame_action_button"
    }

    -- Main content area
    local content_frame = main_frame.add {
        type = "frame",
        name = "content_frame",
        style = "inside_shallow_frame",
        --    direction = "vertical"
    }
    content_frame.style.horizontally_stretchable = true

    -- Scroll pane for content
    local scroll_pane = content_frame.add {
        type = "scroll-pane",
        name = "scroll_pane",
        horizontal_scroll_policy = "never",
        vertical_scroll_policy = "auto-and-reserve-space"
    }
    scroll_pane.style.maximal_height = 780
    scroll_pane.style.horizontally_stretchable = true

    -- Main content flow - Changed to table instead of flow
    local content_table = scroll_pane.add {
        type = "flow",
        name = "entity_details_table",
        direction = "vertical",
        --column_count = 1
    }
    --content_table.style.vertical_spacing = 8
    --content_table.style.horizontal_spacing = 8
    content_table.style.padding = 12

    return main_frame
end

-- 函数：将 Direction 转换为 defines.direction 格式
local function convertDirection(direction)
    for k, v in pairs(defines.direction) do
        if v == direction then
            return string.format("defines.direction.%s (%d)", k, v)
        end
    end
    return direction -- 如果没有匹配的方向，返回原始值
end

-- Function to update GUI with entity details
local function update_entity_details_gui(player, entities)
    local main_frame = player.gui.screen["dev_entity_details_frame"]
    if not main_frame then
        main_frame = create_entity_details_gui(player)
    end

    local content_table = main_frame.content_frame.scroll_pane.entity_details_table
    -- content_table.clear()

    -- Add entity details
    for i, entity in ipairs(entities) do
        -- Entity header frame
        local entity_frame = content_table.add {
            type = "frame",
            --style = "content_deep_frame",
            direction = "vertical"
        }
        entity_frame.style.maximal_width = 760

        -- Entity header
        local header_flow = entity_frame.add {
            type = "flow",
            name = "header_flow_" .. i,
            direction = "horizontal"
        }
        header_flow.style.vertical_align = "center"

        -- Entity title
        local title = header_flow.add {
            type = "label",
            caption = { "", "Entity #", i, ": ", entity.name },
            style = "frame_title"
        }

        -- Properties table
        local properties_table = entity_frame.add {
            type = "table",
            column_count = 2,
            style = "bordered_table"
        }
        properties_table.style.horizontal_spacing = 16
        properties_table.style.vertical_spacing = 8
        properties_table.style.margin = 8
        --properties_table.style.width = 760

        --properties_table.style.column_widths = {
        --    {
        --        column = 1,
        --        width = 80
        --    },
        --    {
        --        column = 1,
        --        minimal_width = 240,
        --        maximal_width = 600
        --    },
        --}

        local prototype = bigunpack("dev_" .. entity.type .. "_" .. entity.name)
        if not prototype then
            return
        end

        -- Add entity properties
        local properties = {
            { "Name", "[entity=" .. entity.name .. "] " .. entity.name },
            { "Type", entity.type },
            { "Direction", convertDirection(entity.direction) },
            { "prototype", prototype },
        }

        for k, prop in ipairs(properties) do
            properties_table.add {
                type = "label",
                caption = prop[1] .. ":",
                style = "bold_label"
            }
            local type = prop[1] == "prototype" and "text-box" or "textfield"
            local box = properties_table.add {
                type = type,
                text = tostring(prop[2]),
                tooltip = { "gvv-mod.right-to-select-all" },
            }
            --if prop[1] == "prototype" then
            --    box.style = "editor_lua_textbox"
            --end
            box.style.maximal_height = 300
            box.style.width = 560

        end

        -- Add separator between entities
        if i < #entities then
            content_table.add {
                type = "line"
            }
        end
    end
end

-- Function to update GUI with entity details
local function update_entity_details_gui2(player, entities)
    local main_frame = player.gui.screen["dev_entity_details_frame"]
    if not main_frame then
        main_frame = create_entity_details_gui(player)
    end

    local content_flow = main_frame.content_frame.scroll_pane.entity_details_flow
    --content_flow.clear()
    -- flow.clear()

    -- Add entity details
    for _, entity in ipairs(entities) do
        -- Add entity header
        flow.add({
            type = "label",
            caption = ("Entity #%d" .. entity.name),
            style = "heading_2_label"
        })

        -- Add entity details
        local details = {
            { "Name", entity.name },
            { "Type", entity.type },
            { "Direction", serpent.block(entity.direction) },
            { "prototype", serpent.block(entity.prototype) },
        }

        local details_table = flow.add({
            type = "table",
            column_count = 2,
            style = "bordered_table"
        })

        for _, detail in ipairs(details) do
            details_table.add({
                type = "label",
                caption = detail[1] .. ":",
                style = "bold_label"
            })
            details_table.add({
                type = "text-box",
                text = tostring(detail[2])
            })
        end

        -- Add separator between entities
        if i < #entities then
            flow.add({
                type = "line"
            })
        end

        --for _, detail in ipairs(details) do
        --    local label = flow.add({ type = "label", caption = detail[1] .. ": " .. tostring(detail[2]) })
        --end
        --
        --flow.add({ type = "line" })
    end
end

local function on_player_selected_area(event)
    local player = game.players[event.player_index]
    local item = event.item
    local surface = event.surface or player.surface
    local area = event.area
    local entities = event.entities
    local tiles = event.tiles

    if player and item == "entity-selector" then
        if not player.admin then
            player.print("You are not an admin so this tool will do nothing for you. 您不是管理员，因此此工具不会对您执行任何操作")
            return
        end

        -- Check if any entities were selected
        if entities and #entities > 0 then

            if not player.gui.screen["dev_entity_details_frame"] then
                create_entity_details_gui(player)
            end
            update_entity_details_gui(player, entities)

        end
    end
end

MyEvent.on_event(
        defines.events.on_player_selected_area,
        function(event)
            on_player_selected_area(event)
        end
)

MyEvent.on_event(
        defines.events.on_player_alt_selected_area,
        function(event)
            on_player_selected_area(event)
        end
)


-- Add event handler for close button
MyEvent.on_event(defines.events.on_gui_click, function(event)
    if event.element.name == "dev_entity_details_close" then
        if event.player_index then
            local p = game.players[event.player_index]
            if p.gui.screen["dev_entity_details_frame"] then
                p.gui.screen["dev_entity_details_frame"].destroy()
            end
        end
    end
end)
