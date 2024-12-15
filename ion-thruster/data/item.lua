local ionthruster_item = table.deepcopy(data.raw.item["thruster"])
ionthruster_item.name = "ion-thruster"
ionthruster_item.place_result = "ion-thruster"
ionthruster_item.order = "z[thruster]"
ionthruster_item.subgroup = "space-platform"
ionthruster_item.icon = "__ion-thruster__/graphics/icon.png"
ionthruster_item.icon_size = 512

data:extend { ionthruster_item }


data:extend {
    {
        type = "fluid",
        name = "xenon",
        icon = "__ion-thruster__/graphics/neon.png",
        icon_size = 512,
        subgroup = "fluid",
        order = "b[new-fluid]-a[space]-a[neon-fuel]",
        default_temperature = 25,
        fuel_value = "10kJ",
        base_color = { 0.53, 0.1, 0 },
        flow_color = { 0.93, 0.68, 0.2 },
        auto_barrel = false
    },
}



data:extend(
        {
            {
                type = "recipe-category",
                name = "ion-thruster"
            }
        }
)
