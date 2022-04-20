local modtool = {}


modtool.items = {}
modtool.icons = {}

modtool.items.item_types = {
    "ammo",
    "armor",
    "capsule",
    "fluid",
    "gun",
    "item",
    "mining-tool",
    "module",
    "tool",
    "item-with-entity-data",
}

function modtool.items.exist(item_name)
    return modtool.items.getItem(item_name) ~= nil
end

function modtool.items.getItem(item_name)
    if type(item_name) == "string" then
        for _, type_name in pairs(modtool.items.item_types) do
            local item = data.raw[type_name][item_name]
            if item then
                return item
            end
        end
    end
    return nil
end

function modtool.items.getAllItemsOfType(item_type)
    local exist = false
    local items = {}
    for _, _type in pairs(modtool.items.item_types) do
        if _type == item_type then
            exist = true
            break
        end
    end
    if exist then
        for name, item in pairs(data.raw[item_type]) do
            table.insert(items, item)
        end
    end
    return items
end

function modtool.items.getItemType(item_name)
    local item = modtool.items.getItem(item_name)
    if item and item.type then
        return item.type
    end
    return ""
end

function modtool.items.isaType(item_name, type_name)
    if data.raw[type_name] and data.raw[type_name][item_name] then
        return true
    end
    return false
end

function modtool.items.getItemName(item)
    return item.name or item[1]
end


-- -- Items

-- @ _recipe_name
-- @ _icon_path
-- @ _icon_size
function modtool.icons.setItemIcon(_item_name, _icon_path, _icon_size, _icon_mipmaps)
    if modtool.items.exist(_item_name) then
        local item_type = modtool.items.getItemType(_item_name)
        if data.raw[item_type][_item_name].icons then
            data.raw[item_type][_item_name].icons = nil
        end
        data.raw[item_type][_item_name].icon = _icon_path
        data.raw[item_type][_item_name].icon_size = _icon_size or 64
        data.raw[item_type][_item_name].icon_mipmaps = _icon_mipmaps

        return true
    end
    return false
end

return modtool
