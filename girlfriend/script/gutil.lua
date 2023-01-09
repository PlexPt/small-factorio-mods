


local is_sprite = function(array)
    return array.width and array.height and (array.filename or array.stripes or array.filenames)
end


function hack_tint(array, tint,check_runtime)
    for k, v in pairs (array) do
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


function hack_scale(array, scale)
    for k, v in pairs (array) do
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

function get_random_pos_near(pos,dist)
    return {x=pos.x+math.random(-dist,dist),y=pos.y+math.random(-dist,dist)}
end




function start_with(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end










