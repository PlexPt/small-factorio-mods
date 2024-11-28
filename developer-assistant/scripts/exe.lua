function dev_safe_load_and_execute(codeString, player)
    -- 使用pcall来保护load调用
    local status, result = pcall(load, codeString)

    if not status then
        -- 如果load失败，打印错误信息
        return ("Error loading code:" .. result)
    else
        -- 如果load成功，尝试执行代码
        status, result = pcall(result)

        if not status then
            -- 如果执行失败，打印错误信息
            return ("Error executing code:" .. result)
        else
            -- 如果执行成功，根据返回值类型进行处理
            if type(result) == "string" then
                return ("Result (string):" .. result)
            elseif type(result) == "table" then
                -- 使用serpent.block()将table转换为字符串并打印
                return ("Result (table):" .. serpent.block(result))
            else
                return ("Result (other type):" .. serpent.block(result))
            end
        end
    end
end

-- 示例用法
--safeLoadAndExecute("return 'Hello, World!'")
--safeLoadAndExecute("return {a=1, b=2}")
--safeLoadAndExecute("return 123")
--safeLoadAndExecute("error('This is an error')")

function dev_exec_command(code, player)
    if not player or not player.admin then
        player.print('but you are not admin.')
        return
    end
    if not code then
        player.print('input code nil.')
        return
    end
    storage.dev = storage.dev or {}
    storage.dev.last_code = code

    local cmd = code
    cmd = cmd:gsub('game%.player([^s])', 'game.players[' .. player.index .. ']%1')
    --load函数的返回值
    --load函数返回两个值：
    --
    --成功时：
    --
    --第一个返回值是一个函数，这个函数是加载的代码块的编译结果。你可以通过调用这个函数来执行加载的代码。
    --第二个返回值是nil。
    --失败时：
    --
    --第一个返回值是nil。
    --第二个返回值是一个字符串，表示错误信息。
    local result = dev_safe_load_and_execute(cmd)
    player.print(result)

    return result
    --f, err = load(cmd)
    --if not f then
    --    cmd = 'game.players[' .. player.index .. '].print(' .. cmd .. ')'
    --    f, err = load(cmd)
    --end
    --
    --_, err = pcall(f)

end
