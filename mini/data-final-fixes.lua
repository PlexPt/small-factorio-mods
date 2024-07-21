require("mini_util")
require("rescale_entity")

require("recipe")

function check_mod(mod_name)
    if (mods and mods[mod_name]) then
        return true
    end
    if script and script.active_mods[mod_name] then
        return true
    end

    return false
end

function loge(entity, name)
    log("=======================" .. name .. "==============================")
    log(serpent.block(entity))
    log("=======================" .. name .. "==============================")
end

require("mods.base")

if check_mod("Krastorio2") then
    require("mods.Krastorio2")
end

require("printer")

