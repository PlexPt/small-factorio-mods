local Event = require('__stdlib__/stdlib/event/event')

if script.active_mods["gvv"] then
    require("__gvv__.gvv")()
end

--Event.on_nth_tick(60, function(e)
--    game.print("111")
--end)
--
--Event.on_nth_tick(60, function(e)
--    game.print("222")
--end)

-- Register our hotkeys


-- Anytime we build something lets run this function
Event.register(defines.events.on_built_entity, function(event)
    game.print(event.created_entity.name .. "  was built")
end)
-- Anytime we build something lets run this function
Event.register(defines.events.on_built_entity, function(event)
    game.print(event.created_entity.name .. "  完成 built")
end)
