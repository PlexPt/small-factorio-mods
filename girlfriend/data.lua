require("config")

data:extend({
    {
        type = "sprite",
        name = "girlfriend_button",
        filename = "__girlfriend__/graphics/girlfriend/head.png",
        priority = "extra-high-no-scale",
        width = 225,
        height = 225
    },
})

require("datas/compilatron")

if mods["genshin-impact-skin"] then
    require("datas/genshen")
end


if mods["miku-bikini-swimsuit"] then
    require("datas/miku")
end


if mods["tianyi"] then
    require("datas/tianyi")
end

