local gui_util = {}

--Create a frame with a close button 使用关闭按钮创建框架
gui_util.create_window_with_closebtn = function(player, frame_name, title)
    local frame = player.gui.screen.add { type = 'frame', name = frame_name, direction = 'vertical' }
    frame.add { type = 'flow', name = 'header', direction = 'horizontal' }
    frame.header.drag_target = frame
    local tit = frame.header.add { type = 'label', caption = title, style = 'frame_title' }
    tit.drag_target = frame
    local drag = frame.header.add { type = 'empty-widget', name = 'dragspace', style = 'draggable_space_header' }
    drag.drag_target = frame
    drag.style.right_margin = 8
    drag.style.height = 24
    drag.style.horizontally_stretchable = true
    local closebtn = frame.header.add { type = 'sprite-button', name = 'closebtn', sprite = 'utility/close', style = 'frame_action_button', mouse_button_filter = { 'left' } }
    local innerframe = frame.add { type = 'flow', name = 'innerframe', direction = 'vertical' }
    frame.auto_center = true
    return frame, closebtn, innerframe
end

