local starship_silo = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])
starship_silo.name = "starship-silo"
starship_silo.rocket_entity = "starship-silo-rocket"
starship_silo.to_be_inserted_to_rocket_inventory_size = 40

-- 复制火箭实体并关联
local starship_silo_rocket = table.deepcopy(data.raw["rocket-silo-rocket"]["rocket-silo-rocket"])
starship_silo_rocket.name = "starship-silo-rocket"
starship_silo_rocket.rocket_sprite = {
    filename = "__starship__/graphics/entities/star3.png",
    width = 1024, -- 根据实际图像尺寸调整
    height = 1024, -- 根据实际图像尺寸调整
    scale = 0.4,
    shift = util.by_pixel(0, 0)
}

data:extend { starship_silo, starship_silo_rocket }


--rocket_flame_animation
