-- 碎片代码

rendering.draw_animation { animation = "animation-laurel",
                           target = game. player.character,
                           target_offset = { 0, -5 },
                           surface = game.player.surface,
                           x_scale = 0.2,
                           y_scale = 0.2,
                           time_to_live = 144,
                           animation_speed = 1,
                           animation_offset = 0, }

rendering.draw_polygon {
    target = { x = 0, y = 0 },
    color = { r = 1, g = 179 / 255, b = 230 / 255, a = 1 },
    vertices = {
        { target = { 0, 0 } },
        { target = { 10, 10 } },
        { target = { 0, 10 } },
        { target = { 10, 0 } },
        { target = { 8, 8 } },
        { target = { 2, 2 } },
        { target = { 12, 13 } }
    },
    surface = game.surfaces[1],
    time_to_live = 180,
    draw_on_ground = true,
}

rendering.draw_line({
    color = { r = 1, g = 179 / 255, b = 230 / 255, a = 1 },
    width = 8,
    gap_length = 0.2,
    dash_length = 0.2,
    from = { 0, 0 },
    to = { 0, 50 },
    surface = game.surfaces[1],
    time_to_live = 90,
    draw_on_ground = false,
})
