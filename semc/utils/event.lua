
local EventCore = require 'utils.event_core'
local Global = require 'utils.global'
local Token = require 'utils.token'
local Debug = require 'utils.debug'

local table_remove = table.remove
local core_add = EventCore.add
local core_on_init = EventCore.on_init
local core_on_load = EventCore.on_load
local core_on_nth_tick = EventCore.on_nth_tick
local stage_load = _STAGE.load
local script_on_event = script.on_event
local script_on_nth_tick = script.on_nth_tick
local generate_event_name = script.generate_event_name

local Event = {}

local handlers_added = false -- set to true after the removeable event handlers have been added.

local event_handlers = EventCore.get_event_handlers()
local on_nth_tick_event_handlers = EventCore.get_on_nth_tick_event_handlers()

local token_handlers = {}
local token_nth_tick_handlers = {}
local function_handlers = {}
local function_nth_tick_handlers = {}

Global.register(
    {
        token_handlers = token_handlers,
        token_nth_tick_handlers = token_nth_tick_handlers,
        function_handlers = function_handlers,
        function_nth_tick_handlers = function_nth_tick_handlers
    },
    function(tbl)
        token_handlers = tbl.token_handlers
        token_nth_tick_handlers = tbl.token_nth_tick_handlers
        function_handlers = tbl.function_handlers
        function_nth_tick_handlers = tbl.function_nth_tick_handlers
    end
)

local function remove(tbl, handler)
    if tbl == nil then
        return
    end

    -- the handler we are looking for is more likly to be at the back of the array.
    for i = #tbl, 1, -1 do
        if tbl[i] == handler then
            table_remove(tbl, i)
            break
        end
    end
end

--- Register a handler for the event_name event.
-- This function must be called in the control stage or in Event.on_init or Event.on_load.
-- See documentation at top of file for details on using events.
-- @param event_name<number>
-- @param handler<function>
function Event.add(event_name, handler)
    if _LIFECYCLE == 8 then
        error('Calling Event.add after on_init() or on_load() has run is a desync risk.', 2)
    end

    core_add(event_name, handler)
end

--- Register a handler for the script.on_init event.
-- This function must be called in the control stage or in Event.on_init or Event.on_load
-- See documentation at top of file for details on using events.
-- @param handler<function>
function Event.on_init(handler)
    if _LIFECYCLE == 8 then
        error('Calling Event.on_init after on_init() or on_load() has run is a desync risk.', 2)
    end

    core_on_init(handler)
end

--- Register a handler for the script.on_load event.
-- This function must be called in the control stage or in Event.on_init or Event.on_load
-- See documentation at top of file for details on using events.
-- @param handler<function>
function Event.on_load(handler)
    if _LIFECYCLE == 8 then
        error('Calling Event.on_load after on_init() or on_load() has run is a desync risk.', 2)
    end

    core_on_load(handler)
end

--- Register a handler for the nth_tick event.
-- This function must be called in the control stage or in Event.on_init or Event.on_load.
-- See documentation at top of file for details on using events.
-- @param tick<number> The handler will be called every nth tick
-- @param handler<function>
function Event.on_nth_tick(tick, handler)
    if _LIFECYCLE == 8 then
        error('Calling Event.on_nth_tick after on_init() or on_load() has run is a desync risk.', 2)
    end

    core_on_nth_tick(tick, handler)
end

--- Register a token handler that can be safely added and removed at runtime.
-- Do NOT call this method during on_load.
-- See documentation at top of file for details on using events.
-- @param  event_name<number>
-- @param  token<number>
function Event.add_removable(event_name, token)
    if type(token) ~= 'number' then
        error('token must be a number', 2)
    end
    if _LIFECYCLE == stage_load then
        error('cannot call during on_load', 2)
    end

    local tokens = token_handlers[event_name]
    if not tokens then
        token_handlers[event_name] = {token}
    else
        tokens[#tokens + 1] = token
    end

    if handlers_added then
        local handler = Token.get(token)
        core_add(event_name, handler)
    end
end

--- Removes a token handler for the given event_name.
-- Do NOT call this method during on_load.
-- See documentation at top of file for details on using events.
-- @param  event_name<number>
-- @param  token<number>
function Event.remove_removable(event_name, token)
    if _LIFECYCLE == stage_load then
        error('cannot call during on_load', 2)
    end
    local tokens = token_handlers[event_name]

    if not tokens then
        return
    end

    local handler = Token.get(token)
    local handlers = event_handlers[event_name]

    remove(tokens, token)
    remove(handlers, handler)

    if #handlers == 0 then
        script_on_event(event_name, nil)
    end
end

--- Register a handler that can be safely added and removed at runtime.
-- The handler must not be a closure, as that is a desync risk.
-- Do NOT call this method during on_load.
-- See documentation at top of file for details on using events.
-- @param  event_name<number>
-- @param  func<function>
function Event.add_removable_function(event_name, func)
    if _LIFECYCLE == stage_load then
        error('cannot call during on_load', 2)
    end
    if type(func) ~= 'function' then
        error('func must be a function', 2)
    end

    if Debug.is_closure(func) then
        error('func cannot be a closure as that is a desync risk. Consider using Event.add_removable(event_name, token) instead.', 2)
    end

    local funcs = function_handlers[event_name]
    if not funcs then
        function_handlers[event_name] = {func}
    else
        funcs[#funcs + 1] = func
    end

    if handlers_added then
        core_add(event_name, func)
    end
end

--- Removes a handler for the given event_name.
-- Do NOT call this method during on_load.
-- See documentation at top of file for details on using events.
-- @param  event_name<number>
-- @param  func<function>
function Event.remove_removable_function(event_name, func)
    if _LIFECYCLE == stage_load then
        error('cannot call during on_load', 2)
    end
    local funcs = function_handlers[event_name]

    if not funcs then
        return
    end

    local handlers = event_handlers[event_name]

    remove(funcs, func)
    remove(handlers, func)

    if #handlers == 0 then
        script_on_event(event_name, nil)
    end
end

--- Register a token handler for the nth tick that can be safely added and removed at runtime.
-- Do NOT call this method during on_load.
-- See documentation at top of file for details on using events.
-- @param  tick<number>
-- @param  token<number>
function Event.add_removable_nth_tick(tick, token)
    if _LIFECYCLE == stage_load then
        error('cannot call during on_load', 2)
    end
    if type(token) ~= 'number' then
        error('token must be a number', 2)
    end

    local tokens = token_nth_tick_handlers[tick]
    if not tokens then
        token_nth_tick_handlers[tick] = {token}
    else
        tokens[#tokens + 1] = token
    end

    if handlers_added then
        local handler = Token.get(token)
        core_on_nth_tick(tick, handler)
    end
end

--- Removes a token handler for the nth tick.
-- Do NOT call this method during on_load.
-- See documentation at top of file for details on using events.
-- @param  tick<number>
-- @param  token<number>
function Event.remove_removable_nth_tick(tick, token)
    if _LIFECYCLE == stage_load then
        error('cannot call during on_load', 2)
    end
    local tokens = token_nth_tick_handlers[tick]

    if not tokens then
        return
    end

    local handler = Token.get(token)
    local handlers = on_nth_tick_event_handlers[tick]

    remove(tokens, token)
    remove(handlers, handler)

    if #handlers == 0 then
        script_on_nth_tick(tick, nil)
    end
end

--- Register a handler for the nth tick that can be safely added and removed at runtime.
-- The handler must not be a closure, as that is a desync risk.
-- Do NOT call this method during on_load.
-- See documentation at top of file for details on using events.
-- @param  tick<number>
-- @param  func<function>
function Event.add_removable_nth_tick_function(tick, func)
    if _LIFECYCLE == stage_load then
        error('cannot call during on_load', 2)
    end
    if type(func) ~= 'function' then
        error('func must be a function', 2)
    end

    if Debug.is_closure(func) then
        error('func cannot be a closure as that is a desync risk. Consider using Event.add_removable_nth_tick(tick, token) instead.', 2)
    end

    local funcs = function_nth_tick_handlers[tick]
    if not funcs then
        function_nth_tick_handlers[tick] = {func}
    else
        funcs[#funcs + 1] = func
    end

    if handlers_added then
        core_on_nth_tick(tick, func)
    end
end

--- Removes a handler for the nth tick.
-- Do NOT call this method during on_load.
-- See documentation at top of file for details on using events.
-- @param  tick<number>
-- @param  func<function>
function Event.remove_removable_nth_tick_function(tick, func)
    if _LIFECYCLE == stage_load then
        error('cannot call during on_load', 2)
    end
    local funcs = function_nth_tick_handlers[tick]

    if not funcs then
        return
    end

    local handlers = on_nth_tick_event_handlers[tick]

    remove(funcs, func)
    remove(handlers, func)

    if #handlers == 0 then
        script_on_nth_tick(tick, nil)
    end
end

--- Generate a new, unique event ID.
-- @param <string> name of the event/variable that is exposed
function Event.generate_event_name(name)
    local event_id = generate_event_name()

    -- If we're in debug, add the event ID into defines.events for the debuggertron's event module
    if _DEBUG then
        defines.events[name] = event_id -- luacheck: ignore 122
    end

    return event_id
end

local function add_handlers()
    for event_name, tokens in pairs(token_handlers) do
        for i = 1, #tokens do
            local handler = Token.get(tokens[i])
            core_add(event_name, handler)
        end
    end

    for event_name, funcs in pairs(function_handlers) do
        for i = 1, #funcs do
            local handler = funcs[i]
            core_add(event_name, handler)
        end
    end

    for tick, tokens in pairs(token_nth_tick_handlers) do
        for i = 1, #tokens do
            local handler = Token.get(tokens[i])
            core_on_nth_tick(tick, handler)
        end
    end

    for tick, funcs in pairs(function_nth_tick_handlers) do
        for i = 1, #funcs do
            local handler = funcs[i]
            core_on_nth_tick(tick, handler)
        end
    end

    handlers_added = true
end

core_on_init(add_handlers)
core_on_load(add_handlers)

return Event
