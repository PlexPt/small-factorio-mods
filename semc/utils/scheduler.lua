local Event = require 'utils.event'
local Global = require 'utils.global'

local Public = {}

local this = {}
local loaded = {}
local count = 1

Global.register(
    this,
    function(t)
        this = t
    end
)

function Public.set(var)
    if game then
        return
    end

    count = count + 1
    loaded[count] = var

    return count
end

function Public.get(id)
    return loaded[id]
end

function Public.timer(tick, id, data)
    if not id then
        return
    end
    if not data then
        return
    end
    if not tick then
        return
    end
    if not this then
        this = {}
    end
    if this[tick] then
        tick = tick + 1
    end
    this[tick] = {id = id, data = data}
end

local function on_tick()
    local tick = game.tick
    if not this then
        this = {}
    end

    if not this[tick] then
        return
    end

    local id = this[tick].id
    local data = this[tick].data

    local func = Public.get(id)
    if not func then
        return
    end
    if not data then
        return
    end

    func(data)
    this[tick] = nil
end

Event.add(defines.events.on_tick, on_tick)

return Public
