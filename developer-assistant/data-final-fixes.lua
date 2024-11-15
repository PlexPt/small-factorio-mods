local bigpack = require("lib.pack")

for typeName, typeData in pairs(table.deepcopy(data.raw)) do
    for name, one in pairs(typeData) do
        local k = "dev_" .. typeName .. "_" .. name
        --local dump = serpent.dump(one)
        --print("adding " .. k)

        data:extend { bigpack(k, serpent.block(one)) }

    end
end

-- 创建一个空表来存储所有的键
local keys = {}


-- 循环遍历 "sprite" 并将键添加到表中
for k, v in pairs(data.raw["sprite"]) do
    table.insert(keys, k)
end

-- 循环遍历 "utility-sprites" 并将键添加到表中
for k, v in pairs(data.raw["utility-sprites"]["default"]) do
    table.insert(keys, "utility." .. k)
end


-- 循环遍历 "shortcut" 并将键添加到表中
for k, v in pairs(data.raw["shortcut"]) do
    table.insert(keys, "shortcut." .. k)
end

data:extend { bigpack("dev_utility_sprites", serpent.block(keys)) }
