require 'utils.data_stages'
_LIFECYCLE = _STAGE.control
_DEBUG = false
_DUMP_ENV = false
require 'utils.utils'

local Event = require 'utils.event'
local Scheduler = require 'utils.scheduler'

local zone_content_pane = 'zone_content_pane'

local remove_buttons = {
    'zone_scan_surface_button',
    'zone_trim_surface_button'
}

local pressed_buttons = {
    ['zone_delete_surface_button'] = 'delete button.',
    ['zone_scan_surface_button'] = 'scan button.',
    ['zone_trim_surface_button'] = 'trim button.'
}

local clear_gui_token =
    Scheduler.set(
    function(elem)
        local function renew(e, n)
            if e and e.valid then
                for _, child in pairs(e.children) do
                    if child.name == n then
                        child.destroy()
                    end
                    local found = renew(child)
                    if found then
                        return
                    end
                end
            end
        end

        if not (elem and elem.valid) then
            return
        end

        for _, child in pairs(elem.children) do
            for _, children in pairs(remove_buttons) do
                if child and child.valid and child.name == children then
                    child.destroy()
                end
                local found = renew(child, children)
                if found then
                    return
                end
            end
        end
    end
)

local function find_gui(elem)
    local tick = game.tick
    for _, child in pairs(elem.children) do
        if child.name == zone_content_pane then
            Scheduler.timer(tick + 2, clear_gui_token, child)
            return
        end
        local found = find_gui(child)
        if found then
            return
        end
    end
end

local find_gui_token = Scheduler.set(find_gui)

Event.add(
    defines.events.on_gui_click,
    function(event)
        local player = game.get_player(event.player_index)
        if not (player and player.valid) then
            return
        end

        local element = event.element
        if element and element.valid then
            if pressed_buttons[element.name] then
                log('[SE-Addons] ' .. player.name .. ' pressed ' .. pressed_buttons[element.name])
                game.print('[SE-Addons] ' .. player.name .. ' pressed [color=blue]' .. pressed_buttons[element.name] .. '[/color]')
            end
        end

        if player.admin then
            return
        end

        local SE = player.gui.screen['se-zonelist_main']
        if SE and SE.valid then
            find_gui(SE)
        end

        local SEZ = player.gui.screen['se-map-view-zone-details']
        if SEZ and SEZ.valid then
            find_gui(SEZ)
        end
    end
)

Event.add(
    defines.events.on_gui_opened,
    function(event)
        local player = game.get_player(event.player_index)
        if not (player and player.valid) then
            return
        end
        local tick = game.tick

        if player.admin then
            return
        end

        local SE = player.gui.screen['se-zonelist_main']
        if SE and SE.valid then
            Scheduler.timer(tick + 2, find_gui_token, SE)
        end

        local SEZ = player.gui.screen['se-map-view-zone-details']
        if SEZ and SEZ.valid then
            Scheduler.timer(tick + 2, find_gui_token, SEZ)
        end
    end
)
