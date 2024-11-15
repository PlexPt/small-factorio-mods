
function generate_dungeon()
    local dungeon_size = 64 -- 地牢的大小
    local wall_thickness = 2 -- 墙壁的厚度
    local wall_tiles = {} -- 存储墙壁的瓷砖坐标

    -- 遍历整个地图，生成墙壁
    for x = 1, dungeon_size do
        for y = 1, dungeon_size do
            if x <= wall_thickness or x > dungeon_size - wall_thickness or y <= wall_thickness or y > dungeon_size - wall_thickness then
                -- 当前坐标位于墙壁内，将瓷砖坐标添加到 wall_tiles 中
                table.insert(wall_tiles, {x = x, y = y})
            end
        end
    end

    -- 将墙壁瓷砖生成到地图上
    for _, tile in pairs(wall_tiles) do
        --local wall = game.surfaces["my_surface"].create_entity({name = "stone-wall", position = tile, force = game.forces.neutral})
    end
end






local function on_init()

    game.create_surface("my_surface", {map_gen_settings = {
        ["dungeon"] = {
            generate_dungeon() -- 调用 generate_dungeon 函数
        }
    }})
end

script.on_init(on_init)
