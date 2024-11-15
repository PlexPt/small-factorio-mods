local debug_util = {}

debug_util.debug_mode = true

log = debug_util.debug_mode and log or function()
end

debug_log = debug_util.debug_mode and log or function()
end


---- 序列化
--print( serpent.dump( aTable ) ) -- 完整序列化
--print( serpent.line( aTable ) ) -- 转换为 1 行 , 没有自引用
--print( serpent.block( aTable ) ) -- 转换为多行 , 没有自引用

function debug_util.info(obj)
    if not debug_util.debug_mode then
        return
    end
    debug_log("------------xiuxian info------------------")

    debug_log(serpent.block(obj))

    debug_log("------------xiuxian info end--------------")

end

function debug_util.tojson(obj, level)
    level = level or 1
    local levelSpace = ""
    for i = 1, level, 1 do
        levelSpace = levelSpace .. " "
    end
    if not obj then
        return "nil"
    end

    if type(obj) == "number" then
        return obj
    end

    local size = 1
    local maxSize = table_size(obj)
    local s = level == 1 and "\n{" or "{"
    for k, v in pairs(obj) do
        s = s .. "\n" .. levelSpace .. (type(k) == "number" and "" or (tostring(k) .. " : "))
        local dataType = type(v)
        if dataType == "table" then
            s = s ..dataType --debug_util.tojson(v, level + 1)
        elseif dataType == "string" then
            s = s .. "\"" .. v .. "\""
        else
            s = s .. tostring(v)
        end
        if size < maxSize then
            s = s .. " ,"
        end
        size = size + 1
    end
    s = s .. "\n"
    for i = 1, level - 1, 1 do
        s = s .. " "
    end
    return s .. "}"
end

function debug_util.infoless(obj, level)
    if not debug_util.debug_mode then
        return
    end
    debug_log("------------ info------------------")

    --debug_log(debug_util.tojson(obj, level))

    debug_log("------------ info end--------------")

end

return debug_util
