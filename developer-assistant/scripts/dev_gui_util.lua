local gui_util = {}

-- Create a frame with a close button 创建带有关闭按钮的窗口框架 返回 1 流式布局 2 整个窗口frame
-- @param player 玩家对象
-- @param title 框架标题
-- @param frame_name 框架名称
-- @return inner_flow 内部流对象
-- @return frame 主框架对象
-- 调用示例
-- 假设 player 是当前玩家对象
--local player = game.players[1]
--local inner_flow = cgui_util.create_window_with_close(player, "example_frame", "Example Window")
-- 现在可以使用返回的对象进行进一步操作，例如：
-- inner_flow.add { type = 'label', caption = 'Hello, World!' }
gui_util.create_window_with_close = function(player, title, frame_name)
    -- 创建主框架
    local frame = player.gui.screen.add { type = 'frame', name = frame_name, direction = 'vertical' }
    frame.auto_center = true

    -- 创建标题栏
    local header = frame.add { type = 'flow', name = 'header', direction = 'horizontal' }
    header.drag_target = frame

    -- 创建标题标签
    local title_label = header.add { type = 'label', caption = title, style = 'frame_title' }
    title_label.drag_target = frame


    -- 创建拖动空间
    local drag_space = header.add { type = 'empty-widget', name = 'drag_space', style = 'draggable_space_header' }
    drag_space.drag_target = frame
    drag_space.style.right_margin = 8
    drag_space.style.height = 24
    drag_space.style.horizontally_stretchable = true


    -- 创建关闭按钮 https://lua-api.factorio.com/latest/concepts/Tags.html
    local close_button = header.add { type = 'sprite-button', name = 'close_button', sprite = 'utility/close', tags = { close_button = true }, style = 'frame_action_button', mouse_button_filter = { 'left' } }
    -- 创建内部垂直流布局
    local inner_flow = frame.add { type = 'flow', name = 'inner_flow', direction = 'vertical' }

    return inner_flow, frame
end

return gui_util
