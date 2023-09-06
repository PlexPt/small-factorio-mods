local scaleutil = {}

scaleutil.scale = 1 / 3

-- 如果 value 不是 nil，就调用函数 func
scaleutil.scale_if_not_nil = function(value, func)
    return value and func(value) or value
end

-- 缩放向量
local function scale_vector(v)
    v[1] = v[1] * scaleutil.scale
    v[2] = v[2] * scaleutil.scale
end

-- 缩放层
local function scale_layer(layer)
    layer.scale = (layer.scale or 1) * scale
    scale_if_not_nil(layer.shift, scale_vector)  -- 可选地缩放 shift
    scale_if_not_nil(layer.hr_version, scale_layer)  -- 可选地缩放 hr_version
end

-- 缩放动画
local function scale_animation(animation)
    if animation.layers then
        for _, layer in pairs(animation.layers) do
            scale_layer(layer)
        end
    else
        scale_layer(animation)
    end
end

-- 缩放图形集
local function scale_graphics_set(graphics_set)
    -- 假设不同动画或向量的键是已知的
    -- 并将它们放在一个列表中
    local animations_keys = { "animation", "north_animation", "west_animation", "south_animation", "east_animation" }
    local vectors_keys = { "north_position", "west_position", "south_position", "east_position" }

    for _, key in pairs(animations_keys) do
        scale_if_not_nil(graphics_set[key], scale_animation)  -- 可选地缩放动画
    end
    for _, key in pairs(vectors_keys) do
        scale_if_not_nil(graphics_set[key], scale_vector)  -- 可选地缩放向量
    end
end

-- 类型到函数的映射
local type_to_func = {
    ["vector"] = scale_vector,
    ["layer"] = scale_layer,
    ["animation"] = scale_animation,
    ["graphics_set"] = scale_graphics_set,
    -- 在这里添加其他类型及其相应的缩放函数
}

-- 通用缩放函数
local function scale_generic(entity, type)
    local scaling_func = type_to_func[type]
    if scaling_func then
        scaling_func(entity)
    else
        error("Unknown type: 未知的类型：" .. tostring(type))
    end
end

-- 使用示例
local entity = data.raw["mining-drill"]["electric-mining-drill"]
scale_generic(entity.graphics_set, "graphics_set")
