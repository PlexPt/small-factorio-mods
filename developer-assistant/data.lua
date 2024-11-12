data:extend(
        {
            {
                type = "selection-tool",
                name = "entity-selector",
                icon = "__developer-assistant__/graphics/EntitySelector.png",
                flags = { "only-in-cursor", "not-stackable", "spawnable" },
                subgroup = "tool",
                order = "c[selection-tools]-a[entity-selector]",
                show_in_library = true,
                hidden = true,
                stack_size = 1,
                icon_size = 512,
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
                type = "shortcut",
                name = "entity-selector",
                order = "o[entity-selector]",
                action = "spawn-item",
                item_to_spawn = "entity-selector",
                toggleable = true,
                icon = "__developer-assistant__/graphics/EntitySelector.png",
                icon_size = 512,
                small_icon = "__developer-assistant__/graphics/EntitySelector.png",
                small_icon_size = 512,
            }
        }
)


--cursor_box_type = "pair",  https://lua-api.factorio.com/latest/types/CursorBoxType.html
--mode = "nothing" }, https://lua-api.factorio.com/latest/types/SelectionModeFlags.html
-------
