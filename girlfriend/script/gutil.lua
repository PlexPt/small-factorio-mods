local is_sprite = function(array)
    return array.width and array.height and (array.filename or array.stripes or array.filenames)
end

-- 修改精灵数组的色调
function hack_tint(array, tint, check_runtime)
    for k, v in pairs(array) do
        if type(v) == "table" then
            if is_sprite(v) then
                if not check_runtime or v.apply_runtime_tint then
                    v.tint = tint
                    v.apply_runtime_tint = false
                    if v.hr_version then
                        v.hr_version.apply_runtime_tint = false
                        v.hr_version.tint = tint
                    end
                end
            end
            hack_tint(v, tint, check_runtime)
        end
    end
end

-- 修改精灵数组的缩放比例
function hack_scale(array, scale)
    for k, v in pairs(array) do
        if type(v) == "table" then
            if is_sprite(v) then
                v.scale = (v.scale or 1) * scale
                if v.shift then
                    v.shift[1], v.shift[2] = v.shift[1] * scale, v.shift[2] * scale
                end
            end
            if v.source_offset then
                v.source_offset[1] = v.source_offset[1] * scale
                v.source_offset[2] = v.source_offset[2] * scale
            end
            if v.projectile_center then
                v.projectile_center[1] = v.projectile_center[1] * scale
                v.projectile_center[2] = v.projectile_center[2] * scale
            end
            if v.projectile_creation_distance then
                v.projectile_creation_distance = v.projectile_creation_distance * scale
            end
            hack_scale(v, scale)
        end
    end
end

function scale_box(box, scale)
    box[1][1] = box[1][1] * scale
    box[1][2] = box[1][2] * scale
    box[2][1] = box[2][1] * scale
    box[2][2] = box[2][2] * scale
    return box
end

-- 获取给定位置附近的随机位置
function get_random_pos_near(pos, dist)
    return { x = pos.x + math.random(-dist, dist), y = pos.y + math.random(-dist, dist) }
end

-- 判断字符串是否以指定的前缀开头
function start_with(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function get_runtime_user_setting (player, key)

    local p_settings = settings.get_player_settings(player)
    if p_settings ~= nil then

        local v = p_settings[key].value
        return v
    end
    return nil
end

function get_runtime_setting (key)
    return settings.global[key].value

end

-- 根据概率随机出结果
function get_random_call (rate)
    local r = math.random()
    return r < rate
end







