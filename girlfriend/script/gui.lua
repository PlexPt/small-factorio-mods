local mod_gui = require("mod-gui")

local gui_frame_name = "girl_frame"
local gui_top_name = "girl_top"
local gui_top_sprite = "girl_top"
local girl_selection_frame = "girl_selection_frame"

function show_gui(player)
    if not (player and player.valid) then
        return
    end
    local gui = mod_gui.get_button_flow(player)
    if not (gui and gui.valid) then
        return
    end

    if not gui[gui_top_name] then
        local button = gui.add {
            type = "sprite-button",
            name = gui_top_name,
            sprite = "girlfriend_button",
            style = mod_gui.button_style,
            tooltip = { 'mod-name.girlfriend' }
        }
    end
end

function top_button_on_click(event)
    local element = event.element

    if element.name ~= gui_top_name then
        return
    end
    local player = game.players[event.player_index]
    if not (player and player.valid) then
        return
    end
    showEntitySelectionGUI(player)

end

function changeGirl(entity_name, player)

    if not (player and player.valid) then
        return
    end

    local girl = storage.girlfriends[player.name]
    if girl then
        girl.destroy()
        storage.player_chosen_girlfriend = storage.player_chosen_girlfriend or {}
        storage.player_chosen_girlfriend[player.name] = entity_name
    end

end

script.on_event(defines.events.on_gui_click, function(event)
    local element = event.element
    if not (element and element.valid and event.player_index) then
        return
    end
    local name = element.name

    top_button_on_click(event)

    if name == "close_girl_selection" then
        element.parent.parent.destroy()
    end

    if start_with(name, "select_girl_") then
        local entity_name = string.sub(name, string.len("select_girl_") + 1)
        local player = game.players[event.player_index]

        changeGirl(entity_name, player)
        local frame = player.gui.center[girl_selection_frame] or player.gui.screen[girl_selection_frame]
        if frame then
            frame.destroy()
            return
        end
    end
end)

function getAllGirl()
    if storage.girl_list then
        return
    end
    storage.girl_list = {
        --{ name = "Item 1", image = "path/to/image1.png" },
        -- Add more items here.
    }
    local characters = prototypes.get_entity_filtered({
        { filter = "type", type = "unit" }
    })
    for name, character in pairs(characters) do
        if start_with(name, girlfreed_base_name) then

            local entity = {
                name = character.localised_name,
                image = "entity/" .. name,
                entity = character.name
            }
            table.insert(storage.girl_list, entity)

        end
    end


end
--请注意，这段代码假设已经定义了全局变量storage.girl_list和storage.selected_entity。storage.girl_list是一个包含要在GUI中显示的实体的表，
--每个实体都应该有一个字符串名称和一个图像路径。 storage.selected_entity是一个变量，用于保存玩家选择的实体。
--在调用此函数时，它将向玩家显示一个竖排的列表，列表中的每个项目都有一个名称，一张图片和一个选择按钮。玩家可以点
function showEntitySelectionGUI(player)
    getAllGirl()

    storage.girl_list = storage.girl_list or {
        --{ name = "Item 1", image = "path/to/image1.png" },
        -- Add more items here.
    }

    -- close main panel
    -- game.print( serpent.block( game.player.gui.screen[girl_selection_frame].style ))
    --game.player.gui.screen[girl_selection_frame].style = "quick_bar_window_frame"
    local frame = player.gui.center[girl_selection_frame] or player.gui.screen[girl_selection_frame]
    if frame then
        frame.destroy()
        return
    end

    local gui = player.gui.screen.add { type = "frame",
                                        name = girl_selection_frame,
                                        direction = "vertical",
                                        style = mod_gui.frame_style,
        --                                caption = { "girlfriend.girlfriend_who" }
    }
    gui.auto_center = true

    --local WIDTH = 412 + 25;
    --local HEIGHT = 200 + 170;
    --frame.location = {
    --    (res.width / 2) - ((WIDTH / 2) * scl),
    --    (res.height / 2) - ((HEIGHT / 2) * scl)
    --}

    local scl = player.display_scale
    local res = player.display_resolution
    gui.style.minimal_height = res.width / 2 / scl
    gui.style.maximal_height = (res.height / 2 / scl * 1.5)
    --gui.style.minimal_width = res.width / 2 / scl
    gui.style.maximal_width = (res.width / 2 / scl)
    --gui.style.vertical_align = "center"

    local title_table = gui.add { type = "table", name = "title_table", column_count = 4,
        --draw_horizontal_lines = false
    }
    title_table.style.horizontally_stretchable = true
    title_table.style.column_alignments[1] = "left"
    title_table.style.column_alignments[2] = "right"
    title_table.style.column_alignments[3] = "right"
    title_table.style.column_alignments[4] = "right"
    title_table.drag_target = gui

    local title_frame = title_table.add { type = "frame", name = "title_frame", caption = { "girlfriend.girlfriend_who" }, draw_horizontal_lines = false } --
    title_frame.ignored_by_interaction = true

    local tagfield = title_table.add { type = "textfield", name = "ctag_field", text = player.tag }
    tagfield.style.width = 200
    tagfield.visible = false

    --local edittag = title_table.add { name = "rpg_bt_edittag", type = "sprite-button", sprite = "utility/rename_icon_normal", style = "shortcut_bar_button_small", tooltip = { 'player_tag' } }
    --edittag.visible = false
    local closeb = title_table.add { name = "close_girl_selection", type = "sprite-button", sprite = "utility/close_black", style = "shortcut_bar_button_small" }

    local scroll_pane = gui.add { type = "scroll-pane", name = "girl_selection_scroll_pane", direction = "vertical" }
    local flow = scroll_pane.add { type = "flow", name = "girl_selection_flow", direction = "vertical" }

    -- Iterate through the list of entities and add a button for each one
    for _, entity in pairs(storage.girl_list) do
        local list_frame = flow.add { type = "frame", name = "list_frame_" .. entity.entity, direction = "horizontal", } --

        -- Add the entity's image as a sprite to the button
        --local sprite = button.add { type = "sprite", name = "entity_sprite_" .. entity.name }

        local sprite = list_frame.add({
            type = "sprite-button",
            name = "girl_friend_sprite_" .. entity.entity,
            sprite = entity.image,
            visible = true,
        })
        sprite.style.width = 100
        sprite.style.height = 100
        sprite.style.margin = { 0, 0, 0, 0 }
        sprite.style.padding = { 0, 0, 0, 0 }
        sprite.style.horizontal_align = "center"
        sprite.enabled = false

        local button = list_frame.add { type = "button", name = "select_girl_" .. entity.entity, caption = entity.name, style = "green_button" }
        button.style.minimal_width = 300
        button.style.height = 100
        button.style.font = "default-bold"
        button.style.vertical_align = "center"


        --sprite.sprite = "entity/" .. entity.name

    end

end

script.on_event({ defines.events.on_player_created, defines.events.on_player_joined_game, defines.events.on_player_respawned }, function(event)
    if event.player_index then
        local player = game.players[event.player_index]
        if player and player.valid then
            show_gui(player)
        end
    end
end)

