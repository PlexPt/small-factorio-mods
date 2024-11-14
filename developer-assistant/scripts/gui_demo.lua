
-- control.lua
local function create_demo_window(player)
    -- 关闭已存在的窗口
    if player.gui.screen.demo_window then
        player.gui.screen.demo_window.destroy()
        return
    end

    -- 创建主窗口
    local main_window = player.gui.screen.add {
        type = "frame",
        name = "demo_window",
        direction = "vertical",
        caption = "GUI Elements Demo"
    }

    -- 让窗口可拖动
    main_window.force_auto_center()
    --main_window.draggable = true

    -- 创建滚动窗格
    local scroll = main_window.add {
        type = "scroll-pane",
        name = "scroll",
        horizontal_scroll_policy = "never",
        vertical_scroll_policy = "auto"
    }
    scroll.style.maximal_height = 600

    -- 主内容流
    local flow = scroll.add {
        type = "flow",
        name = "main_flow",
        direction = "vertical"
    }

    -- 基础按钮类型
    flow.add { type = "label", caption = "Button Types:" }
    local button_flow = flow.add { type = "flow", direction = "horizontal" }
    button_flow.add { type = "button", caption = "Regular Button" }
    button_flow.add { type = "sprite-button", sprite = "item/iron-plate" }

    -- 文本输入
    flow.add { type = "label", caption = "Text Input:" }
    local text_flow = flow.add { type = "flow", direction = "horizontal" }
    text_flow.add { type = "textfield", text = "Single line text" }
    text_flow.add { type = "text-box", text = "Multi\nline\ntext" }

    -- 选择器
    flow.add { type = "label", caption = "Selectors:" }
    local select_flow = flow.add { type = "flow", direction = "horizontal" }
    local dropdown = select_flow.add { type = "drop-down" }
    dropdown.items = { "Option 1", "Option 2", "Option 3" }
    local list = select_flow.add { type = "list-box" }
    list.items = { "Item 1", "Item 2", "Item 3" }

    -- 复选框和单选按钮
    flow.add { type = "label", caption = "Checkboxes and Radio Buttons:" }
    local check_flow = flow.add { type = "flow", direction = "horizontal" }
    check_flow.add { type = "checkbox", caption = "Checkbox 1", state = false }
    check_flow.add { type = "checkbox", caption = "Checkbox 2", state = true }
    local radio_flow = flow.add { type = "flow", direction = "horizontal" }
    radio_flow.add { type = "radiobutton", caption = "Radio 1", state = true }
    radio_flow.add { type = "radiobutton", caption = "Radio 2", state = false }

    -- 进度条和滑块
    flow.add { type = "label", caption = "Progress and Slider:" }
    local progress_flow = flow.add { type = "flow", direction = "horizontal" }
    local progress = progress_flow.add { type = "progressbar", value = 0.7 }
    progress.style.width = 200
    local slider = progress_flow.add { type = "slider", value = 50, minimum_value = 0, maximum_value = 100 }
    slider.style.width = 200

    -- 表格示例
    flow.add { type = "label", caption = "Table Example:" }
    local table = flow.add { type = "table", column_count = 3 }
    for i = 1, 9 do
        table.add { type = "label", caption = "Cell " .. i }
    end

    -- 选项卡示例
    flow.add { type = "label", caption = "Tabbed Pane:" }
    local tabbed_pane = flow.add { type = "tabbed-pane" }
    local tab1 = tabbed_pane.add { type = "tab", caption = "Tab 1" }
    local tab2 = tabbed_pane.add { type = "tab", caption = "Tab 2" }
    local content1 = tabbed_pane.add { type = "flow" }
    content1.add { type = "label", caption = "Content of tab 1" }
    local content2 = tabbed_pane.add { type = "flow" }
    content2.add { type = "label", caption = "Content of tab 2" }
    tabbed_pane.add_tab(tab1, content1)
    tabbed_pane.add_tab(tab2, content2)

    -- 精灵和图像
    flow.add { type = "label", caption = "Sprites and Images:" }
    local sprite_flow = flow.add { type = "flow", direction = "horizontal" }
    sprite_flow.add { type = "sprite", sprite = "item/iron-plate" }
    sprite_flow.add { type = "sprite", sprite = "item/copper-plate" }

    -- 工具提示示例
    flow.add { type = "label", caption = "Tooltip Example:" }
    flow.add {
        type = "button",
        caption = "Hover me",
        tooltip = { "", "This is a tooltip\n", "With multiple lines" }
    }
end

-- 创建打开演示的按钮
MyEvent.on_init(function()
    for _, player in pairs(game.players) do
        if player.gui.left.demo_button then
            player.gui.left.demo_button.destroy()
        end
        player.gui.left.add {
            type = "button",
            name = "demo_button",
            caption = "Show GUI Demo"
        }
    end
end)

-- 创建打开演示的按钮
MyEvent.on_configuration_changed(function()
    for _, player in pairs(game.players) do
        if player.gui.left.demo_button then
            player.gui.left.demo_button.destroy()
        end
        player.gui.left.add {
            type = "button",
            name = "demo_button",
            caption = "Show GUI Demo"
        }
    end
end)

-- 处理按钮点击
MyEvent.on_event(defines.events.on_gui_click, function(event)
    if event.element.name == "demo_button" then
        local player = game.players[event.player_index]
        create_demo_window(player)
    end
end)
