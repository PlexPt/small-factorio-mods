-- tag.lua
-- Apr 2017
-- Allows adding play tags

-- Tag list
local roles = {
    { display_name = "[自立]" },
    { display_name = "[采矿]" },
    { display_name = "[电力]" },
    { display_name = "[原油]" },
    { display_name = "[冶炼]" },
    { display_name = "[铁路]" },
    { display_name = "[防御]" },
    { display_name = "[电路]" },
    { display_name = "[科技]" },
    { display_name = "[物流]" },
    { display_name = "[其他]" },
    { display_name = "[外星]" },
    { display_name = "[火箭]" },
    { display_name = "[挂机]" } }

function CreateTagGuiTab(tab_container, player)
    for i, role in ipairs(roles) do
        tab_container.add { type = "button", caption = role.display_name, name = role.display_name }
    end
    if (player.admin) then
        tab_container.add { type = "button", caption = "[管理员]", name = "admin" }
        tab_container.add { type = "button", caption = "[服主]", name = "moderator" }
    end
    tab_container.add { type = "button", caption = "Clear", name = "clear_btn" }
end

function TagGuiClick(event)
    if not (event and event.element and event.element.valid) then
        return
    end
    local player = game.players[event.player_index]
    local name = event.element.name

    if (name == "clear_btn") then
        player.tag = ""
        return
    end

    for i, role in ipairs(roles) do
        if (name == role.display_name) then
            player.tag = role.display_name
        elseif (name == "admin") then
            player.tag = "[管理员]"
        elseif (name == "moderator") then
            player.tag = "[服主]"
        end
    end
end
