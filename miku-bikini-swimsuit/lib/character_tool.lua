require("util")

local GG = require('lib.common')

------------------------------------------------------------------------------------
-- In this file, the base character will be overwritten with the newly created one
-- unless another mod that allows to use both characters is active.
------------------------------------------------------------------------------------
local CHAR_NAME = "miku-bikini-swimsuit-skin"

------------------------------------------------------------------------------------
-- List of mods that support multiple characters in a game and the number of the
-- earliest version of that mod where this is supported.
------------------------------------------------------------------------------------
local mod_list = {
    -- Not yet available on the modportal!
    ["CharSelect"] = "0.18.1",
    -- Available and known to work
    ["minime"] = "0.0.14",
    -- Current version (0.0.3) still depends on Gear Girl replacing the default
    -- character -- I hope this will be fixed in 0.0.4!
    ["RitnCharacters"] = "0.0.4",
}

GG.dwrite("mod_list: " .. serpent.block(mod_list))
-- Add any mod that may have registered itself to list.
for mod, version in pairs(GEAR_GIRL_keep_default_character) do
    -- Sanity check: modname must be a string!
    if type(mod) ~= "string" then
        log(string.format("%s is not a valid mod -- ignoring mod \"%s\"!", version, mod))

        -- Sanity check: version must be a string and have the correct format!
    elseif type(version) ~= "string" or not string.match(version, "^%d+%.%d+%.%d+$") then
        log(string.format("%s is not a valid version number -- ignoring mod \"%s\"!", version, mod))

        -- Everything seems to be OK, add this to the list!
    else
        log(string.format("Adding \"%s\" (%s) to mod list!", mod, version))
        mod_list[mod] = version
    end
end
GG.dwrite("new mod_list: " .. serpent.block(mod_list))

------------------------------------------------------------------------------------
-- Check that mod exists in a version that supports using multiple characters
------------------------------------------------------------------------------------
-- name: Name of the mod to check for
-- needed: We need this or a later version of the mod!
-- Return: boolean
local function check_version(name, needed)
    if not (name and type(name) == "string") then
        error(tostring(name) .. " is not a valid mod name!")
    elseif not (needed and type(needed) == "string") then
        error(tostring(needed) .. " is not a valid version number (string value required)!")
    end

    local found = mods[name]
    local ret

    -- Mod is active
    if found then
        GG.dwrite(string.format("Checking mod \"%s\": Found version %s, require version %s",
                name, found, needed))

        local version = util.split(found, '.')
        needed = util.split(needed, '.')

        for i = 1, 3 do
            version[i] = tonumber(version[i])
            needed[i] = tonumber(needed[i])
        end


        -- Version number: {major, minor, subversion}
        -- Major number may not be smaller than needed
        if version[1] < needed[1] then
            GG.dwrite(string.format("Major number is too small: %g < %g", version[1], needed[1]))
            ret = false

            -- Major number is greater: Hit!
        elseif version[1] > needed[1] then
            GG.dwrite(string.format("Major number is greater: %g > %g", version[1], needed[1]))
            ret = true

            -- Major number is same, minor number is greater: Hit!
        elseif version[2] > needed[2] then
            GG.dwrite(string.format("Minor number is greater: %g > %g", version[2], needed[2]))
            ret = true

            -- Major number is same, minor number is same, subversion number is same or greater: Hit!
        elseif version[2] == needed[2] and version[3] >= needed[3] then
            GG.dwrite(string.format("Least number is greater or equal: %g >= %g", version[3], needed[3]))
            ret = true

            -- Version is smaller than required
        else
            GG.dwrite(string.format("Least number is too small: %g < %g", version[3], needed[3]))
            ret = false
        end

        -- Mod isn't active
    else
        GG.dwrite(string.format("Mod \"%s\" is not active!", name))
        ret = false
    end

    return ret
end

------------------------------------------------------------------------------------
-- If any mod is found that supports multiple characters in a game,
-- this will be false.
------------------------------------------------------------------------------------
local replace_base_char = true

------------------------------------------------------------------------------------
-- Check each mod in mod_list if it exists and has the required version.
------------------------------------------------------------------------------------
for name, version in pairs(mod_list) do
    if check_version(name, version) then
        GG.dwrite(string.format("\"%s\" is active! Won't overwrite vanilla character and corpse.",
                name))
        replace_base_char = false
        break
    end
end

-- This game doesn't support multiple characters -- overwrite the base character!
local char = data.raw["character"]
local corpse = data.raw["character-corpse"]
local base_name, name, c

for e, entities in ipairs({ char, corpse }) do
    if entities == char then
        base_name = "character"
        name = CHAR_NAME
        c = true
    else
        base_name = "character-corpse"
        name = CHAR_NAME .. "-corpse"
        c = false
    end

    -- Overwrite base character/corpse
    -- ("character-corpse" is already set as new character_corpse, so there's nothing to do!)
    if replace_base_char then
        GG.dwrite(string.format("Stand-alone mode: Overwriting vanilla \"%s\" with \"%s\"",
                entities[name].type, name))
        entities[base_name] = entities[name]
        entities[base_name].name = base_name
        entities[name] = nil

        -- Keep base character/corpse
    else
        GG.dwrite(string.format("Keeping both vanilla \"%s\" and \"%s\"!", entities[name].type, name))

        -- Localise new character/corpse
        entities[name].localised_name = { "entity-name." .. name }
        entities[name].localised_description = { "entity-description." .. name }
        GG.dwrite(string.format("Added localization for \"%s\"!", name))

        -- Make sure the Gear Girl won't have the default character's corpse!
        if c then
            entities[name].character_corpse = name .. "-corpse"
            GG.dwrite(string.format("Activated new corpse for \"%s\": \"%s\"!",
                    name, entities[name].character_corpse))
        end
    end
end
