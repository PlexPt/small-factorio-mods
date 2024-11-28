data:extend {
    {
        type = "selection-tool",
        name = "entity-selector",
        icon = "__developer-assistant__/graphics/picker.png",
        flags = { "only-in-cursor", "not-stackable", "spawnable" },
        subgroup = "tool",
        order = "c[selection-tools]-a[entity-selector]",
        show_in_library = true,
        hidden = true,
        stack_size = 1,
        icon_size = 341,
        stackable = false,
        select = {
            border_color = { r = 0, g = 1, b = 0 },
            cursor_box_type = "copy",
            mode = "any-entity", -- This mode allows selection of any entity
            show_entity_info = true -- This shows entity information when hovering
        },
        alt_select = {
            border_color = { r = 0, g = 0, b = 1 },
            cursor_box_type = "copy",
            mode = "any-entity",
            show_entity_info = true
        },
    },
    {
        type = "selection-tool",
        name = "dev-area-selector",
        icon = "__developer-assistant__/graphics/picker.png",
        flags = { "only-in-cursor", "not-stackable", "spawnable" },
        subgroup = "tool",
        order = "c[selection-tools]-a[entity-selector]",
        show_in_library = true,
        hidden = true,
        stack_size = 1,
        icon_size = 341,
        stackable = false,
        select = {
            border_color = { r = 0, g = 1, b = 0 },
            cursor_box_type = "copy", --默认为绿色
            mode = "nothing",
            show_entity_info = true -- This shows entity information when hovering
        },
        alt_select = {
            border_color = { r = 0, g = 0, b = 1 },
            cursor_box_type = "copy",
            mode = "nothing",
            show_entity_info = true
        },
    },
    {
        type = "shortcut",
        name = "entity-selector",
        order = "o[entity-selector]",
        action = "spawn-item",
        item_to_spawn = "entity-selector",
        toggleable = true,
        icon = "__developer-assistant__/graphics/picker.png",
        icon_size = 341,
        small_icon = "__developer-assistant__/graphics/picker.png",
        small_icon_size = 341,
    }
}


--cursor_box_type = "pair",  https://lua-api.factorio.com/latest/types/CursorBoxType.html
--mode = "nothing" }, https://lua-api.factorio.com/latest/types/SelectionModeFlags.html
-------


data.raw["gui-style"].default["textbox_dev_code"] = {
    type = "textbox_style",
    name = "textbox_dev_code",
    parent = "textbox",
    minimal_width = 1000,
    minimal_height = 600,
}
