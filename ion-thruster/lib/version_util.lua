-- 比较两个版本号
-- 返回值：
-- 1 如果版本号 version1 > version2
-- -1 如果版本号 version1 < version2
-- 0 如果版本号 version1 == version2
function compare_versions(version1, version2)
    local function split_version(version)
        local parts = {}
        for part in version:gmatch("%d+") do
            table.insert(parts, tonumber(part))
        end
        return parts
    end

    local v1_parts = split_version(version1)
    local v2_parts = split_version(version2)

    local max_length = math.max(#v1_parts, #v2_parts)
    for i = 1, max_length do
        local v1_part = v1_parts[i] or 0
        local v2_part = v2_parts[i] or 0

        if v1_part > v2_part then
            return 1
        elseif v1_part < v2_part then
            return -1
        end
    end

    return 0
end

-- 示例
--local result = compare_versions("1.0.2", "1.0.10")
--if result == 1 then
--    game.print("Version 1.0.2 is greater than 1.0.10")
--elseif result == -1 then
--    game.print("Version 1.0.2 is less than 1.0.10")
--else
--    game.print("Version 1.0.2 is equal to 1.0.10")
--end

function compareVersions(version1, version2)
    local v1 = {}
    local v2 = {}

    -- 将版本号字符串拆分为数字表
    for num in string.gmatch(version1, "%d+") do
        table.insert(v1, tonumber(num))
    end
    for num in string.gmatch(version2, "%d+") do
        table.insert(v2, tonumber(num))
    end

    -- 比较版本号的每个部分
    for i = 1, math.max(#v1, #v2) do
        local n1 = v1[i] or 0
        local n2 = v2[i] or 0
        if n1 > n2 then
            return 1
        elseif n1 < n2 then
            return -1
        end
    end

    -- 如果所有部分都相等，则版本号相等
    return 0
end

-- 测试
--game.print(compareVersions("1.0.2", "1.0.3"))  -- 输出: -1
--game.print(compareVersions("1.0.2", "1.0.2"))  -- 输出: 0
--game.print(compareVersions("1.0.2", "1.0.1"))  -- 输出: 1
--game.print(compareVersions("1.0.2", "1.1.0"))  -- 输出: -1
--game.print(compareVersions("1.0.2", "0.9.9"))  -- 输出: 1
