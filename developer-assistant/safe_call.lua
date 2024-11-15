-- 定义一个通用的 pcall 封装函数
function safe_call(player, func, ...)
    -- 使用 pcall 调用函数
    local args = { ... }  -- 收集所有参数
    local success, result = pcall(func, unpack(args))

    if not success then
        -- 处理错误
        local error_message = "Error: " .. serpent.block(result)
        log(error_message)
        if player then
            player.print(error_message)
        else
            game.print("Error: " .. error_message)
        end

        return nil
    end

    return result
end

