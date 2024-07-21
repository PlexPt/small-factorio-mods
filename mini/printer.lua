-- 机器
local types = {
    "assembling-machine",
    "mining-drill",
    "storage-tank",
    "furnace",
    "generator",
    "lab",
    "radar",
    "container",
    "logistic-container",
    "reactor",
    "accumulator",
    "solar-panel",
    "boiler",
    "beacon",
    "pump",
    "burner-generator",
    "electric-energy-interface",
    "roboport",
    "rocket-silo",
    "rocket-silo-rocket",
    "fluid-turret",
    "ammo-turret",
    "electric-turret",
    "artillery-turret",
    "electric-pole",
    "power-switch",
    "simple-entity-with-owner",
}
--/sc game.player.print(game.player.selected.type) log(game.player.selected.type)


--entity.collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } }
--entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }

log("==========================================================check boxing==============================================================================")

for _, type in pairs(types) do
    log("====================================================================================================" .. type .. " check box start====================================================================================================")
    local machines = data.raw[type]
    for k, machine in pairs(machines) do
        if machine.collision_box and machine.selection_box then
            local collision_box_width = machine.collision_box[2][1] - machine.collision_box[1][1]
            local collision_box_height = machine.collision_box[2][2] - machine.collision_box[1][2]

            local selection_box_width = machine.selection_box[2][1] - machine.selection_box[1][1]
            local selection_box_height = machine.selection_box[2][2] - machine.selection_box[1][2]

            --log(type .. "[" .. k .. "] - Collision Box Size: " .. collision_box_width .. ", " .. collision_box_height)
            --log(type .. "[" .. k .. "] - Selection Box Size: " .. selection_box_width .. ", " .. selection_box_height)

            local collision_box_area = collision_box_width * collision_box_height
            local selection_box_area = selection_box_width * selection_box_height

            if collision_box_area > 1 or selection_box_area > 1 then
                log("")
                log("data.raw[\"" .. type .. "\"][\"" .. k .. "\"]")
                log("data.raw[\"" .. type .. "\"][\"" .. k .. "\"] - Collision Box Size: " .. collision_box_width .. "x" .. collision_box_height)
                log("data.raw[\"" .. type .. "\"][\"" .. k .. "\"] - Selection Box Size: " .. selection_box_width .. "x" .. selection_box_height)
            end


        end
    end

    log("====================================================================================================" .. type .. " end====================================================================================================")

end

log("==========================================================check box end==============================================================================")







