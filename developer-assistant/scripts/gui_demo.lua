--https://lua-api.factorio.com/latest/concepts/GuiElementType.html
--https://lua-api.factorio.com/latest/classes/LuaGuiElement.html

--https://wiki.factorio.com/Rich_text

local bigunpack = require("lib.unpack")

-- 定义常量表，映射GUI元素类型和样式类型
local GUI_TYPE_TO_STYLE_MAP = {
    -- https://lua-api.factorio.com/latest/types/StyleSpecification.html
    ["activity_bar"] = "activity_bar_style",
    ["button"] = "button_style",
    ["sprite-button"] = "button_style",
    ["camera"] = "camera_style",
    ["checkbox"] = "checkbox_style",
    ["drop-down"] = "dropdown_style",
    ["flow"] = "flow_style", -- 注意：horizontal_flow_style 和 vertical_flow_style 都映射到 flow_style
    ["frame"] = "frame_style",
    ["graph"] = "graph_style",
    ["line"] = "line_style",
    ["sprite"] = "image_style",
    ["label"] = "label_style",
    ["list-box"] = "list_box_style",
    ["progressbar"] = "progressbar_style",
    ["radiobutton"] = "radiobutton_style",
    ["scrollbar"] = "horizontal_scrollbar_style", -- 注意：horizontal_scrollbar_style 和 vertical_scrollbar_style 都映射到 scrollbar
    ["scroll-pane"] = "scroll_pane_style",
    ["slider"] = "slider_style",
    ["switch"] = "switch_style",
    ["table"] = "table_style",
    ["tab"] = "tab_style",
    ["textfield"] = "textbox_style",
    ["text-box"] = "textbox_style",
    ["tabbed-pane"] = "tabbed_pane_style",
    ["empty-widget"] = "empty_widget_style",
    ["minimap"] = "minimap_style",
    ["choose-elem-button"] = "technology_slot_style",
    ["glow"] = "glow_style",
    ["speech-bubble"] = "speech_bubble_style",
    ["double_slider"] = "double_slider_style"
}

local ELEMENT_PROPERTIES = {
    button = {
        { name = "caption", type = "textfield", default = "Button" }
    },
    ["sprite-button"] = {
        { name = "caption", type = "textfield", default = "Sprite Button" },
        { name = "sprite", type = "textfield", default = "item/iron-plate" }
    },
    textfield = {
        { name = "text", type = "textfield", default = "Sample text" }
    },
    checkbox = {
        { name = "state", type = "checkbox", default = true, caption = "Checked" }
    },
    radiobutton = {
        { name = "state", type = "radiobutton", default = true, caption = "Radio Button" }
    },
    progressbar = {
        { name = "value", type = "slider", default = 0.7, min = 0, max = 1 }
    },
    slider = {
        { name = "value", type = "slider", default = 50, min = 0, max = 100 }
    },
    table = {
        { name = "column_count", type = "textfield", default = "3" }
    },
    ["tabbed-pane"] = {
        { name = "tab1_caption", type = "textfield", default = "Tab 1" },
        { name = "tab2_caption", type = "textfield", default = "Tab 2" }
    },
    sprite = {
        { name = "sprite", type = "textfield", default = "item/iron-plate" }
    },
    customize = {
        { name = "code", type = "text-box", default = '{\n type = "button",\n caption = "button" \n}' }
    }
}


-- Constants for element types and their properties
local ELEMENT_TYPES = {
    "button", "sprite-button", "textfield", "text-box", "checkbox",
    "radiobutton", "progressbar", "slider", "table", "camera",
    "switch",  "tabbed-pane", "sprite", "customize"
}

--  根据给定的GUI元素类型筛选所有样式的名称
local function filterStyleNamesByGuiType(guiType)
    -- 根据GUI元素类型获取对应的样式类型
    local styleType = GUI_TYPE_TO_STYLE_MAP[guiType]
    if not styleType then
        return {}  -- 如果没有找到对应的样式类型，返回空表
    end

    -- 创建一个空表来存储匹配的样式名称
    local matchingNames = {}

    -- 遍历所有原型样式
    for name, type in pairs(prototypes.style) do
        -- 检查当前样式的类型是否与给定的样式类型相匹配
        if type == styleType then
            -- 如果匹配，则将名称添加到结果表中
            table.insert(matchingNames, name)
        end
    end

    -- 返回匹配的样式名称列表
    return matchingNames
end

-- 模糊搜索函数
local function style_search(pattern)
    local results = {}
    for style_name, one in pairs(prototypes.style) do
        if string.find(style_name, pattern, 1, true) then
            table.insert(results, style_name)
            log("style---------name:" .. style_name .. "====" .. serpent.block(one))
        end
    end
    return results
end

-- 模糊搜索函数
local function sprite_search(pattern)
    local results = {}
    local dev_utility_sprites = bigunpack("dev_utility_sprites")
    local sprites = loadstring("return " .. dev_utility_sprites)()

    for _, name in pairs(sprites) do
        if string.find(name, pattern, 1, true) then
            name = table.insert(results, "[img=" .. name .. "] " .. name)
        end
    end
    return results
end


-- Helper function to create a scroll pane
local function create_scroll_pane(parent, name, max_height)
    local scroll = parent.add {
        type = "scroll-pane",
        name = name,
        horizontal_scroll_policy = "never",
        vertical_scroll_policy = "auto"
    }
    scroll.style.maximal_height = max_height or 600
    return scroll
end

local function create_preview_panel(main_tab)

    -- 创建预览面板
    local preview_panel = create_scroll_pane(main_tab, "preview_panel", 800)


    -- 添加元素类型选择下拉框
    local element_type_flow = preview_panel.add { type = "flow", name = "element_type_flow", direction = "horizontal" }
    element_type_flow.add { type = "label", caption = "Element Type: " }

    local dev_element_type_dropdown = element_type_flow.add { type = "drop-down", name = "dev_element_type_dropdown" }
    dev_element_type_dropdown.items = ELEMENT_TYPES


    -- 添加"Add Element"按钮
    local add_button = element_type_flow.add { type = "button", name = "dev_add_button", caption = "Add Element", style = "confirm_button" }
    element_type_flow.add { type = "button", name = "dev_add_all_style_button", caption = "Add All Style", style = "confirm_button" }

    -- 添加属性编辑区
    preview_panel.add { type = "line" }
    local properties_flow = preview_panel.add { type = "flow", name = "properties_flow", direction = "vertical" }

    return preview_panel
end

local function load_styles(textfield1, dev_style_search_listbox)
    local text = textfield1.text or ""
    local results = style_search(text)
    dev_style_search_listbox.items = results

end
local function load_sprite(textfield1, dev_style_search_listbox)
    local text = textfield1.text or ""
    local results = sprite_search(text)
    dev_style_search_listbox.items = results

end
local function create_search_tab(search_tab)

    local tab1 = search_tab.add { type = "tab", caption = "GUI Style" }
    local tab2 = search_tab.add { type = "tab", caption = "Sprite" }
    local content1 = search_tab.add { type = "flow", direction = "vertical" }
    local textfield1 = content1.add { type = "textfield", name = "dev_search_style" }
    local scroll1 = create_scroll_pane(content1, "scroll")

    local dev_style_search_listbox = scroll1.add { type = "list-box", name = "dev_style_search_listbox", items = {} }
    --------------------------------------
    local content2 = search_tab.add { type = "flow", direction = "vertical" }
    local textfield2 = content2.add { type = "textfield", name = "dev_search_sprite" }
    local scroll2 = create_scroll_pane(content2, "scroll")

    local dev_sprite_search_listbox = scroll2.add { type = "list-box", name = "dev_sprite_search_listbox", items = {} }
    dev_sprite_search_listbox.style.maximal_width = 600

    search_tab.add_tab(tab1, content1)
    search_tab.add_tab(tab2, content2)
    -- 初始加载样式
    load_styles(textfield1, dev_style_search_listbox)
    load_sprite(textfield2, dev_sprite_search_listbox)

    return search_tab
end


-- 当下拉框选择改变时更新属性编辑区
local function update_properties_flow(player)
    local dev_main_window = player.gui.screen.dev_main_window

    if not dev_main_window then
        return
    end
    local panel = player.gui.screen.dev_main_window.dev_tab.preview_panel

    if not (panel and panel.element_type_flow and panel.properties_flow) then
        return
    end

    local dev_element_type_dropdown = panel.element_type_flow.dev_element_type_dropdown
    if not dev_element_type_dropdown then
        return
    end

    local selected_type = dev_element_type_dropdown.items[dev_element_type_dropdown.selected_index]

    local properties_flow = panel.properties_flow
    -- 清空属性编辑区
    properties_flow.clear()

    -- 根据选择的元素类型添加相应的属性编辑控件
    if selected_type == "button" then
        properties_flow.add { type = "label", caption = "caption: " }
        properties_flow.add { type = "textfield", name = "thecaption", text = "Button" }
    elseif selected_type == "sprite-button" then
        properties_flow.add { type = "label", caption = "caption: " }
        properties_flow.add { type = "textfield", name = "thecaption", text = "Sprite Button" }
        properties_flow.add { type = "label", caption = "sprite: " }
        properties_flow.add { type = "textfield", name = "thesprite", text = "item/iron-plate" }
    elseif selected_type == "textfield" then
        properties_flow.add { type = "label", caption = "text: " }
        properties_flow.add { type = "textfield", name = "thetext", text = "Sample text" }
    elseif selected_type == "text-box" then
        properties_flow.add { type = "label", caption = "text: " }
        properties_flow.add { type = "textfield", name = "thetext", text = "Sample\n text" }
    elseif selected_type == "checkbox" then
    elseif selected_type == "radiobutton" then
    elseif selected_type == "progressbar" then

    elseif selected_type == "slider" then

    elseif selected_type == "table" then
        properties_flow.add { type = "label", caption = "column_count: " }
        properties_flow.add { type = "textfield", name = "thecolumn_count", text = "3" }
    elseif selected_type == "camera" then
        properties_flow.add { type = "label", caption = "camera position: " }
        properties_flow.add { type = "textfield", name = "the_position", text = "{0,0}" }
    elseif selected_type == "tabbed-pane" then
        properties_flow.add { type = "label", caption = "tab1_caption: " }
        properties_flow.add { type = "textfield", name = "tab1_caption", text = "Tab 1" }
        properties_flow.add { type = "label", caption = "tab2_caption: " }
        properties_flow.add { type = "textfield", name = "tab2_caption", text = "Tab 2" }
    elseif selected_type == "sprite" then
        properties_flow.add { type = "label", caption = "sprite: " }
        properties_flow.add { type = "textfield", name = "thesprite", text = "item/iron-plate" }
    elseif selected_type == "customize" then
        properties_flow.add { type = "label", caption = "code: " }
        properties_flow.add { type = "text-box", name = "code", style = "editor_lua_textbox",
                              text = '{\n type = "button",\n caption = "button" \n}' }
    end
    properties_flow.add { type = "label", caption = "style: " }
    local dev_style_dropdown = properties_flow.add { type = "drop-down", name = "dev_style_dropdown" }
    local styles = filterStyleNamesByGuiType(selected_type)
    dev_style_dropdown.items = styles


end

-- 处理"添加元素"按钮点击
local function add_element(player, style_type)
    local dev_main_window = player.gui.screen.dev_main_window

    if not dev_main_window then
        return
    end
    local panel = dev_main_window.dev_tab.preview_panel

    if not (panel and panel.element_type_flow) then
        return
    end

    local dev_element_type_dropdown = panel.element_type_flow.dev_element_type_dropdown
    if not dev_element_type_dropdown then
        return
    end

    local selected_type = dev_element_type_dropdown.items[dev_element_type_dropdown.selected_index]

    local properties_flow = panel.properties_flow
    style_type = style_type or properties_flow.dev_style_dropdown.items[properties_flow.dev_style_dropdown.selected_index]

    local panel_flow = panel.add { type = "flow", direction = "horizontal" }
    --panel_flow.add { type = "line" }
    -- 添加销毁按钮
    panel_flow.add { type = 'sprite-button', name = 'close_element', sprite = 'utility/close', style = 'frame_action_button', mouse_button_filter = { 'left' } }

    local element = nil
    -- 根据选择的元素类型创建相应的GUI元素
    if selected_type == "customize" then
        local code = loadstring("return " .. properties_flow.children[2].text)()
        element = panel_flow.add(code)
    elseif selected_type == "button" then
        element = panel_flow.add {
            type = "button",
            name = "preview_" .. selected_type,
            caption = properties_flow.children[2].text
        }
    elseif selected_type == "sprite-button" then
        element = panel_flow.add {
            type = "sprite-button",
            name = "preview_" .. selected_type,
            caption = properties_flow.children[2].text,
            sprite = properties_flow.children[4].text
        }
    elseif selected_type == "textfield" then
        element = panel_flow.add {
            type = "textfield",
            name = "preview_" .. selected_type,
            text = properties_flow.children[2].text
        }
    elseif selected_type == "text-box" then
        element = panel_flow.add {
            type = "text-box",
            name = "preview_" .. selected_type,
            text = properties_flow.children[2].text
        }
    elseif selected_type == "checkbox" then
        element = panel_flow.add {
            type = "checkbox",
            name = "preview_" .. selected_type,
            caption = "checkbox caption",
            state = true
        }
    elseif selected_type == "switch" then
        element = panel_flow.add {
            type = "switch",
            name = "preview_" .. selected_type,
            caption = "switch caption",
            left_label_caption = "left_label_caption",
            right_label_caption = "right_label_caption"
            --state = true
        }
    elseif selected_type == "radiobutton" then
        element = panel_flow.add {
            type = "radiobutton",
            name = "preview_" .. selected_type,
            caption = properties_flow.children[2].caption,
            state = true
        }
    elseif selected_type == "progressbar" then
        element = panel_flow.add {
            type = "progressbar",
            name = "preview_" .. selected_type,
            value = 0.7
        }
    elseif selected_type == "slider" then
        element = panel_flow.add {
            type = "slider",
            name = "preview_" .. selected_type,
            value = 70,
            minimum_value = 0,
            maximum_value = 100
        }
    elseif selected_type == "table" then
        element = panel_flow.add {
            type = "table",
            name = "preview_" .. selected_type,
            column_count = tonumber(properties_flow.children[2].text)
        }

        for i = 1, tonumber(properties_flow.children[2].text) * 4 do
            element.add { type = "label", caption = "label Cell " .. i }
        end

    elseif selected_type == "camera" then
        local position = loadstring("return " .. properties_flow.children[2].text)()

        element = panel_flow.add {
            type = "camera",
            name = "preview_" .. selected_type,
            position = position
        }
        element.visible = true

    elseif selected_type == "tabbed-pane" then

        local pane = panel_flow.add {
            type = "tabbed-pane",
            name = "preview_" .. selected_type
        }
        local tab1 = pane.add { type = "tab", name = "preview_tab1", caption = properties_flow.children[2].text }
        local tab2 = pane.add { type = "tab", name = "preview_tab2", caption = properties_flow.children[4].text }

        pane.add_tab(tab1, pane.add { type = "label", caption = "preview_tab1_content" })
        pane.add_tab(tab2, pane.add { type = "label", caption = "preview_tab2_content" })
        element = pane
        --    tabs must be owned by the tabbed-pane they're added to.
    elseif selected_type == "sprite" then
        element = panel_flow.add {
            type = "sprite",
            name = "preview_" .. selected_type,
            sprite = properties_flow.children[2].text
        }
    end

    if style_type and style_type ~= "" then
        element.style = style_type
    end
end

local function create_main_window(player)
    -- 关闭已存在的窗口
    if player.gui.screen.dev_main_window then
        player.gui.screen.dev_main_window.destroy()
        return
    end

    -- 创建主窗口
    local main_window = player.gui.screen.add {
        type = "frame",
        name = "dev_main_window",
        direction = "vertical",
        caption = "Dev Assistant"
        --caption = "GUI Elements Demo"
    }

    --main_window.force_auto_center()
    main_window.auto_center = true

    -- 让窗口可E 关闭
    player.opened = main_window

    -- 选项卡示例
    local main_tab = main_window.add { type = "tabbed-pane", name = "dev_tab" }
    local tab1 = main_tab.add { type = "tab", caption = "GUI Demos" }
    local tab2 = main_tab.add { type = "tab", caption = "GUI Edit Preview" }
    local tab3 = main_tab.add { type = "tab", caption = "Search" }
    local tab4 = main_tab.add { type = "tab", caption = "Info Tab" }
    -- 创建滚动窗格
    local content1 = create_scroll_pane(main_tab, "scroll1", 800)

    -- 主内容流
    local flow = content1.add {
        type = "flow",
        name = "main_flow",
        direction = "vertical"
    }

    local content2 = create_preview_panel(main_tab)
    ----------------------------------------------
    local search_tab = main_tab.add { type = "tabbed-pane", name = "search_tab" }

    create_search_tab(search_tab)

    ----------------------------------------------
    local content4 = main_tab.add { type = "flow" }
    local scroll4 = create_scroll_pane(content4, "scroll1")

    scroll4.add { type = "label", caption = "Use the shortcut selection-tool entity-selector in the lower right corner of the screen to view entity information" }
    scroll4.add { type = "label", caption = "TODO flat all style/sprite" }

    main_tab.add_tab(tab1, content1)
    main_tab.add_tab(tab2, content2)
    main_tab.add_tab(tab3, search_tab)
    main_tab.add_tab(tab4, content4)


    -- 基础按钮类型
    flow.add { type = "label", caption = "Button Types:" }
    local button_flow = flow.add { type = "flow", direction = "horizontal" }
    button_flow.add { type = "label", caption = "button" }
    button_flow.add { type = "button", caption = "Regular Button" }

    button_flow.add { type = "label", caption = "sprite-button" }
    button_flow.add { type = "sprite-button", sprite = "item/iron-plate" }

    -- 文本输入
    flow.add { type = "line" }
    flow.add { type = "label", caption = "Text Input:" }
    local text_flow = flow.add { type = "flow", direction = "horizontal" }
    text_flow.add { type = "label", caption = "textfield" }
    text_flow.add { type = "textfield", text = "Single line text" }
    text_flow.add { type = "label", caption = "text-box" }
    text_flow.add { type = "text-box", text = "Multi\nline\ntext" }


    -- 选择器
    flow.add { type = "line" }
    flow.add { type = "label", caption = "Selectors:" }
    local select_flow = flow.add { type = "flow", direction = "horizontal" }
    select_flow.add { type = "label", caption = "drop-down" }
    local dropdown = select_flow.add { type = "drop-down" }
    dropdown.items = { "Option 1", "Option 2", "Option 3" }

    select_flow.add { type = "label", caption = "list-box" }
    local list = select_flow.add { type = "list-box" }
    list.items = { "Item 1", "Item 2", "Item 3" }


    -- 复选框和单选按钮
    flow.add { type = "line" }
    flow.add { type = "label", caption = "checkbox and radiobutton:" }
    local check_flow = flow.add { type = "flow", direction = "horizontal" }
    check_flow.add { type = "checkbox", caption = "Checkbox 1", state = false }
    check_flow.add { type = "checkbox", caption = "Checkbox 2", state = true }
    local radio_flow = flow.add { type = "flow", direction = "horizontal" }
    radio_flow.add { type = "radiobutton", caption = "Radio 1", state = true }
    radio_flow.add { type = "radiobutton", caption = "Radio 2", state = false }

    -- 进度条和滑块
    flow.add { type = "line" }
    flow.add { type = "label", caption = "progressbar and slider:" }
    local progress_flow = flow.add { type = "flow", direction = "horizontal" }
    local progress = progress_flow.add { type = "progressbar", value = 0.7 }
    progress.style.width = 200
    local slider = progress_flow.add { type = "slider", value = 50, minimum_value = 0, maximum_value = 100 }
    slider.style.width = 200

    -- 表格示例
    flow.add { type = "line" }
    flow.add { type = "label", caption = "table Example:" }
    local table = flow.add { type = "table", column_count = 3, draw_vertical_lines = true, draw_horizontal_lines = true, draw_horizontal_line_after_headers = true }
    for i = 1, 9 do
        table.add { type = "label", caption = "label Cell " .. i }
    end

    -- 精灵和图像
    flow.add { type = "line" }
    flow.add { type = "label", caption = "Sprites and Images:" }
    local sprite_flow = flow.add { type = "flow", direction = "horizontal" }
    sprite_flow.add { type = "sprite", sprite = "item/iron-plate" }
    sprite_flow.add { type = "sprite", sprite = "item/copper-plate" }

    -- 工具提示示例
    flow.add { type = "line" }
    flow.add { type = "label", caption = "Tooltip Example:" }
    flow.add {
        type = "button",
        caption = "Hover me",
        tooltip = { "", "This is a tooltip\n", "With multiple lines" }
    }

    -- switch
    flow.add { type = "line" }
    flow.add { type = "label", caption = "switch:" }
    local switch_flow = flow.add { type = "flow", direction = "horizontal" }
    switch_flow.add { type = "switch", left_label_caption = "left_label_caption", right_label_caption = "right_label_caption" }

    -- minimap
    flow.add { type = "line" }
    flow.add { type = "label", caption = "minimap:" }
    local minimap_flow = flow.add { type = "flow", direction = "horizontal" }
    minimap_flow.add { type = "minimap", position = { 0, 0 }, right_label_caption = "right_label_caption" }

    -- camera
    flow.add { type = "line" }
    flow.add { type = "label", caption = "camera:" }
    local camera_flow = flow.add { type = "flow", direction = "horizontal" }
    camera_flow.add { type = "camera", position = { 0, 0 } }

    -- choose-elem-button
    flow.add { type = "line" }
    flow.add { type = "label", caption = "choose-elem-button:" }
    local elem_flow = flow.add { type = "flow", direction = "horizontal" }
    elem_flow.add { type = "label", caption = "item" }
    elem_flow.add { type = "choose-elem-button", elem_type = "item", }
    elem_flow.add { type = "label", caption = "entity" }
    elem_flow.add { type = "choose-elem-button", elem_type = "entity", }
    elem_flow.add { type = "label", caption = "recipe" }
    elem_flow.add { type = "choose-elem-button", elem_type = "recipe", }
    elem_flow.add { type = "label", caption = "fluid" }
    elem_flow.add { type = "choose-elem-button", elem_type = "fluid", }
    elem_flow.add { type = "label", caption = "decorative" }
    elem_flow.add { type = "choose-elem-button", elem_type = "decorative", }
    elem_flow.add { type = "label", caption = "achievement" }
    elem_flow.add { type = "choose-elem-button", elem_type = "achievement", }
    elem_flow.add { type = "label", caption = "technology" }
    elem_flow.add { type = "choose-elem-button", elem_type = "technology", }

    flow.add { type = "line" }
    flow.add { type = "label", caption = "entity-preview:" }
    local preview_flow = flow.add { type = "flow", direction = "horizontal" }
    preview_flow.add { type = "entity-preview" }

    -- 选项卡示例
    flow.add { type = "line" }
    flow.add { type = "label", caption = "Layout:" }
    flow.add { type = "label", caption = "tabbed-pane:" }
    local tabbed_pane = flow.add { type = "tabbed-pane" }
    local tab1 = tabbed_pane.add { type = "tab", caption = "Tab 1" }
    local tab2 = tabbed_pane.add { type = "tab", caption = "Tab 2" }
    local tab3 = tabbed_pane.add { type = "tab", caption = "Tab 3" }
    local content1 = tabbed_pane.add { type = "flow" }
    content1.add { type = "label", caption = "Content of tab 1" }
    content1.add { type = "label", caption = "frame" }
    content1.add { type = "label", caption = "flow" }
    content1.add { type = "label", caption = "scroll-pane" }
    content1.add { type = "label", caption = "line" }

    local content2 = tabbed_pane.add { type = "flow" }
    content2.add { type = "label", caption = "Content of tab 2" }
    content2.add { type = "frame", caption = "frame2" }
    local content3 = tabbed_pane.add { type = "flow" }
    content3.add { type = "label", caption = "Content of tab 3" }
    content3.add { type = "label", caption = "scroll-pane" }
    local scroll3 = content3.add {
        type = "scroll-pane",
        name = "scroll",
        horizontal_scroll_policy = "never",
        vertical_scroll_policy = "auto"
    }
    scroll3.style.maximal_height = 50

    tabbed_pane.add_tab(tab1, content1)
    tabbed_pane.add_tab(tab2, content2)
    tabbed_pane.add_tab(tab3, content3)

end

local function create_demo_button()
    for _, player in pairs(game.players) do
        if player then
            if player.gui.left.dev_button then
                player.gui.left.dev_button.destroy()
            end
            player.gui.left.add {
                type = "button",
                name = "dev_button",
                caption = "Dev GUI Demo"
            }
        end
    end
end

-- 创建打开演示的按钮
MyEvent.on_init(create_demo_button)

-- 创建打开演示的按钮
MyEvent.on_configuration_changed(create_demo_button)
MyEvent.on_event({ defines.events.on_player_created, defines.events.on_player_joined_game, defines.events.on_player_respawned }, create_demo_button)


-- 处理按钮点击
MyEvent.on_event(defines.events.on_gui_click, function(event)
    if event.element and event.element.valid then

        local player = game.players[event.player_index]
        if event.element.name == "dev_button" then
            safe_call(player, create_main_window, player)
        end
        if event.element.name == "dev_add_button" then

            safe_call(player, add_element, player)

        end
        -- 处理销毁按钮点击事件
        if event.element.name == "close_element" then
            if event.element.parent then
                event.element.parent.destroy()
            end
        end
    end
end)

MyEvent.on_gui_click("dev_add_all_style_button", function(event, player)

    local dev_main_window = player.gui.screen.dev_main_window

    if not dev_main_window then
        return
    end
    local panel = dev_main_window.dev_tab.preview_panel

    if not (panel and panel.element_type_flow) then
        return
    end

    local dev_element_type_dropdown = panel.element_type_flow.dev_element_type_dropdown
    if not dev_element_type_dropdown then
        return
    end

    local selected_type = dev_element_type_dropdown.items[dev_element_type_dropdown.selected_index]

    local styles = filterStyleNamesByGuiType(selected_type)
    for _, v in ipairs(styles) do
        add_element(player, v)
    end
end)

-- 处理按钮点击
MyEvent.on_event(defines.events.on_gui_selection_state_changed, function(event)
    if event.element and event.element.valid then
        local player = game.players[event.player_index]

        if event.element.name == "dev_element_type_dropdown" then
            update_properties_flow(player)
        end
    end
end)

-- 处理按钮点击
MyEvent.on_event(defines.events.on_gui_text_changed, function(event)
    if event.element and event.element.valid then
        local player = game.players[event.player_index]

        if event.element.name == "dev_search_style" then
            safe_call(player, function()
                load_styles(event.element, event.element.parent.scroll.dev_style_search_listbox)
            end)
        end
        if event.element.name == "dev_search_sprite" then
            safe_call(player, function()
                load_sprite(event.element, event.element.parent.scroll.dev_sprite_search_listbox)
            end)
        end
    end

end)
-- 处理按钮点击
MyEvent.on_event(defines.events.on_gui_closed, function(event)
    if event.element and event.element.valid then
        local player = game.players[event.player_index]

        if event.element.name == "dev_main_window" then
            event.element.destroy()
        end
    end

end)

commands.add_command("deva", "open dev a gui", function(command)
    local player = game.players[command.player_index];
    if player then
        create_main_window(player)
    end
end)

