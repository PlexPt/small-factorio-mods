for k, v in pairs(data.raw["assembling-machine"]) do
    local grounded = data.raw["assembling-machine"][k .. "-grounded"]
    if grounded then
        grounded.crafting_categories = v.crafting_categories
    end

    if v.collision_mask == nil then
        goto continue
    end
    for kk, vv in pairs(v.collision_mask) do
        if vv == "ground-tile" then
            table.remove(v.collision_mask, kk)
        end
    end
    :: continue ::
end
