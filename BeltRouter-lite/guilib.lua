--- @type ArrayList
local ArrayList = require("array_list")
local assertNotNull = require("assert_not_null")

--- @class GuiLib
--- @type GuiLib
local GuiLib = {}
GuiLib.listeningEvents = ArrayList.new()

--- @class event
--- @field player_index player_index
--- @field element LuaGuiElement

--- @alias EventHandler fun(e: event)

--- Master table for tracking all handlers
--- @type table<defines.events, table<player_index, table<string, EventHandler>>>
GuiLib.guiHandlers = {}

--- @type table<defines.events, table<string, EventHandler>>
GuiLib.globalGuiHandlers = {}

--- Default gui root
GuiLib.rootName = "left"

--- This function should be called in control.lua. Should be called in control.lua to initialize all events to be listened.
--- @param event defines.events
function GuiLib.listenToEvent(event)
    GuiLib.listeningEvents:add(event)
    GuiLib.guiHandlers[event] = {}
    GuiLib.globalGuiHandlers[event] = {}
    script.on_event(event, function(e)
        if not e.element then
            return
        end
        -- handle persistent events
        for path, handler in pairs(GuiLib.globalGuiHandlers[event]) do
            if GuiLib.path_of(e.element) == path then
                handler(e)
                return
            end
        end
        if not GuiLib.guiHandlers[event][e.player_index] then
            return
        end

        -- handle player events
        for path, handle in pairs(GuiLib.guiHandlers[event][e.player_index]) do
            if e.element == GuiLib.elem_of(path, e.player_index) then
                handle(e)
                return
            end
        end
    end
    )
end

--- Helper function for listenToEvent. Should be called in control.lua to initialize all events to be listened.
--- @param event_list defines.events[]
function GuiLib.listenToEvents(event_list)
    for _, event in ipairs(event_list) do
        GuiLib.listenToEvent(event)
    end
end

--- @param elementName string
function GuiLib.registerGuiHandlerForAllPlayers(elementName, event_to_handler_table)
    assertNotNull(elementName, event_to_handler_table)
    for event, handler in ipairs(event_to_handler_table) do
        GuiLib.globalGuiHandlers[event][elementName] = handler
    end
end

--- Helper function for adding a gui element while at the same time add event handlers to it.
--- With this function, you are able to write gui element definition and gui event handler together for better readability.
--- @param gui_parent LuaGuiElement
--- @param element_spec LuaGuiElement gui element specification table, but not an actual gui element
--- @param event_to_handler_table table<defines.events, EventHandler>
--- @return LuaGuiElement
function GuiLib.addGuiElementWithHandler(gui_parent, element_spec, event_to_handler_table)
    assertNotNull(gui_parent, element_spec)
    local newElement = gui_parent.add(element_spec)
    if event_to_handler_table then
        for event, handler in pairs(event_to_handler_table) do
            GuiLib.registerGuiHandler(newElement, event, handler)
        end
    end
end

--- register a *handler* that handles *event* for gui element *gui_elem* of player with *player_index*
--- @param guiElement LuaGuiElement
--- @param event defines.events
--- @param handler fun(e)
function GuiLib.registerGuiHandler(guiElement, event, handler)
    assertNotNull(guiElement, event, handler)
    assert(type(handler) == "function", "handler should be a function")
    assert(guiElement.name ~= "", "gui's name can't be nil")
    assert(GuiLib.guiHandlers[event] ~= nil, "event is not listened, please call GuiLib.listenToEvent(event) first")

    local gui_path = GuiLib.path_of(guiElement)
    for _, elem_name in pairs(GuiLib.__split_path(gui_path)) do
        assert(elem_name ~= "", "there is an element in path of " .. guiElement.name .. "without name")
    end
    if not GuiLib.guiHandlers[event][guiElement.player_index] then
        GuiLib.guiHandlers[event][guiElement.player_index] = {}
    end
    GuiLib.guiHandlers[event][guiElement.player_index][gui_path] = handler
end

--- @param element LuaGuiElement
--- @param event defines.events
function GuiLib.unregisterGuiHandler(element, event)
    assertNotNull(element, event)
    GuiLib.guiHandlers[event][element.player_index][GuiLib.path_of(element)] = nil
end

--- Unregister all handlers of gui element as well as its children.
--- @param element LuaGuiElement
function GuiLib.unregisterAllHandlers(element)
    assert(element)
    local player_index = element.player_index
    for _, event in pairs(GuiLib.listeningEvents) do
        if GuiLib.guiHandlers[player_index] and GuiLib.guiHandlers[event][player_index] then
            GuiLib.guiHandlers[event][player_index][GuiLib.path_of(element)] = nil
        end
    end
    for _, child in pairs(element.children) do
        GuiLib.unregisterAllHandlers(child)
    end
end

--- @return LuaGuiElement root gui of player for this mod
function GuiLib.gui_root(player_index)
    assertNotNull(player_index)

    local root = game.players[player_index].gui[GuiLib.rootName]
    assert(root ~= nil, "unable to find player's gui root")
    return root
end

--- @param element LuaGuiElement
--- @return boolean true if remove is successful
function GuiLib.removeGuiElement(element)
    if element ~= nil then
        GuiLib.unregisterAllHandlers(element)
        element.destroy()
        return true
    end
    return false
end

--- @return boolean true if remove is successful
function GuiLib.removeGuiElementWithName(player_index, element_name)
    assertNotNull(player_index, element_name)
    local element = GuiLib.gui_root(player_index)[element_name]
    if element then
        return GuiLib.removeGuiElement(element)
    end
    return false
end

--- @param gui_elem LuaGuiElement
--- @return string the path of a gui element represented by "root_name|parent_name|my_name ..."
function GuiLib.path_of(gui_elem)
    assertNotNull(gui_elem)

    local path = gui_elem.name
    local current_element = gui_elem.parent
    while current_element and current_element.name ~= GuiLib.rootName do
        path = current_element.name .. "|" .. path
        current_element = current_element.parent
    end
    path = GuiLib.rootName .. "|" .. path
    return path
end

--- returns the path of a gui element represented by a list in order of [elem_name, parent_name, ... , root_name]
function GuiLib.__split_path(str)
    local t = {}
    for s in string.gmatch(str, "([^|]+)") do
        table.insert(t, s)
    end
    return t
end

--- @param path string guilib path for the GuiElement
--- @param player_index player_index
--- @return LuaGuiElement
function GuiLib.elem_of(path, player_index)
    assertNotNull(path, player_index)

    local path_list = GuiLib.__split_path(path)
    local i = 1
    local current_element = GuiLib.gui_root(player_index)

    while i < #path_list do
        local found = false
        for _, child in ipairs(current_element.children) do
            if child.name == path_list[i + 1] then
                current_element = child
                i = i + 1
                found = true
                break
            end
        end
        if not found then
            return nil
        end
    end

    return current_element
end

return GuiLib