local path = "__genshin-impact-music__/sounds/"
data.raw["ambient-sound"] = {}

data:extend({
    {
        type = "ambient-sound",
        track_type = "menu-track",
        name = "main-menu-track",
        sound = { filename = path .. "Genshin-Impact-Main-Theme-原神192.ogg" }
    },
    {
        type = "ambient-sound",
        track_type = "main-track",
        name = "A-Day-in-Mondstadt",
        sound = { filename = path .. "A-Day-in-Mondstadt-蒙德的一日.ogg" }
    },
    {
        type = "ambient-sound",
        track_type = "main-track",
        name = "Dream-Aria",
        sound = { filename = path .. "Dream-Aria-_Genshin-Impact-Main-Theme-梦之咏叹.ogg" }
    },
    {
        type = "ambient-sound",
        track_type = "main-track",
        name = "Genshin-Impact-Main-Theme",
        sound = { filename = path .. "Genshin-Impact-Main-Theme-原神192.ogg" }
    },
    {
        type = "ambient-sound",
        track_type = "interlude",
        name = "The-City-Favored-By-Wind",
        sound = { filename = path .. "The-City-Favored-By-Wind-风所爱之城.ogg" }
    },
    {
        type = "ambient-sound",
        track_type = "interlude",
        name = "Twilight-Serenity",
        sound = { filename = path .. "Twilight-Serenity-_Genshin-Impact-Main-Theme-宁静的黄昏.ogg" }
    },
})
