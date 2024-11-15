-- event_dispatcher.lua
local EventDispatcher = {}
EventDispatcher.handlers = {}
EventDispatcher.gui_click_handlers = {}  -- 新增：专门存储GUI点击事件处理器
EventDispatcher.inited = false

-- 定义核心事件
EventDispatcher.CORE_EVENTS = {
    on_init = "on_init",
    on_load = "on_load",
    on_configuration_changed = "on_configuration_changed"
}

-- 确保输入是数组的辅助函数
local function ensure_array(value)
    if type(value) ~= "table" then
        return { value }
    end
    return value
end

-- 检查是否是核心事件
local function is_core_event(event_id)
    for _, core_event in pairs(EventDispatcher.CORE_EVENTS) do
        if event_id == core_event then
            return true
        end
    end
    return false
end

-- 内部注册函数
local function register_event(event_id, handler_func)
    if not EventDispatcher.handlers[event_id] then
        EventDispatcher.handlers[event_id] = {}

        -- 注册事件回调
        local event_handler = function(event)
            EventDispatcher.dispatch_event(event_id, event)
        end

        -- 根据事件类型设置监听器
        if event_id == EventDispatcher.CORE_EVENTS.on_init then
            script.on_init(event_handler)
        elseif event_id == EventDispatcher.CORE_EVENTS.on_load then
            script.on_load(event_handler)
        elseif event_id == EventDispatcher.CORE_EVENTS.on_configuration_changed then
            script.on_configuration_changed(event_handler)
        else
            script.on_event(event_id, event_handler)
        end
    end

    -- 直接添加处理函数到数组
    table.insert(EventDispatcher.handlers[event_id], handler_func)
end

-- GUI点击事件的专门处理函数
local function handle_gui_click(event)
    local element = event.element
    if not element or not element.valid then
        return
    end

    local element_name = element.name
    if not element_name then
        return
    end
    local player = game.players[event.player_index]

    if not player or not player.valid then
        return
    end

    -- 调用所有匹配的处理函数
    if EventDispatcher.gui_click_handlers[element_name] then
        for _, handler in ipairs(EventDispatcher.gui_click_handlers[element_name]) do
            handler(event, player)
        end
    end

    -- 调用通配符处理函数（如果有的话）
    if EventDispatcher.gui_click_handlers["*"] then
        for _, handler in ipairs(EventDispatcher.gui_click_handlers["*"]) do
            handler(event, player)
        end
    end
end

-- 注册GUI点击事件处理函数
function EventDispatcher.on_gui_click(element_names, handler_func)
    -- 确保已经注册了on_gui_click事件
    if not EventDispatcher.inited then
        EventDispatcher.on_event(defines.events.on_gui_click, handle_gui_click)
        EventDispatcher.inited = true
    end

    -- 转换为数组形式
    local names = ensure_array(element_names)

    -- 注册到所有指定的元素名称
    for _, name in ipairs(names) do
        if not EventDispatcher.gui_click_handlers[name] then
            EventDispatcher.gui_click_handlers[name] = {}
        end
        table.insert(EventDispatcher.gui_click_handlers[name], handler_func)
    end
end

-- 为每个核心事件提供专门的注册函数
function EventDispatcher.on_init(handler_func)
    return register_event(EventDispatcher.CORE_EVENTS.on_init, handler_func)
end

function EventDispatcher.on_load(handler_func)
    return register_event(EventDispatcher.CORE_EVENTS.on_load, handler_func)
end

function EventDispatcher.on_configuration_changed(handler_func)
    return register_event(EventDispatcher.CORE_EVENTS.on_configuration_changed, handler_func)
end

-- 用于注册普通游戏事件，支持单个事件或事件数组
function EventDispatcher.on_event(event_ids, handler_func)
    -- 转换为数组形式
    local events = ensure_array(event_ids)

    -- 检查是否包含核心事件
    for _, event_id in ipairs(events) do
        if is_core_event(event_id) then
            error("Core events should use their dedicated registration functions. Use EventDispatcher.on_" .. event_id:sub(4) .. "() instead.")
        end
    end

    -- 注册到所有指定的事件
    for _, event_id in ipairs(events) do
        register_event(event_id, handler_func)
    end
end

-- 分发事件到所有注册的处理函数
function EventDispatcher.dispatch_event(event_id, event)
    if EventDispatcher.handlers[event_id] then
        for _, handler in ipairs(EventDispatcher.handlers[event_id]) do
            handler(event)
        end
    end
end

return EventDispatcher
