require("util")

--~ -- "GG" (the initials of "Gear Girl") doesn't really make sense for your mod. How
--~ -- about something more telling, like "MIKU" or "MBS"? Anyway, it's a local var,
--~ -- it can't break anything, so I won't change that now.
--~ local GG = require('lib.common')

------------------------------------------------------------------------------------
-- In this file, the base character will be overwritten with the newly created one
-- unless another mod that allows to use both characters is active.
------------------------------------------------------------------------------------
local CHAR_NAME = MIKU.char_name

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

--~ GEAR_GIRL_keep_default_character = GEAR_GIRL_keep_default_character or {}

MIKU.dwrite("mod_list: " .. serpent.block(mod_list))
-- Add any mod that may have registered itself to mod_list.
for mod_name, version in pairs(GEAR_GIRL_keep_default_character or {}) do
    -- Sanity check: mod_namename must be a string!
    if type(mod_name) ~= "string" then
        log(string.format("%s is not a valid mod_name -- ignoring mod_name \"%s\"!", version, mod_name))

        -- Sanity check: version must be a string and have the correct format!
    elseif type(version) ~= "string" or not string.match(version, "^%d+%.%d+%.%d+$") then
        log(string.format("%s is not a valid version number -- ignoring mod_name \"%s\"!", version, mod_name))

        -- Everything seems to be OK, add this to the list!
    else
        log(string.format("Adding \"%s\" (%s) to mod_name list!", mod_name, version))
        mod_name_list[mod_name] = version
    end
end
MIKU.dwrite("new mod_list: " .. serpent.block(mod_list))

------------------------------------------------------------------------------------
-- Check that mod exists in a version that supports using multiple characters
------------------------------------------------------------------------------------
-- name: Name of the mod to check for
-- needed: We need this or a later version of the mod!
-- Return: boolean
------------------------------------------------------------------------------------
--                                Mod-version check                               --
------------------------------------------------------------------------------------
local function check_version(mod_name, need_version)
    local version = mods[mod_name]

    local function parse_version(vstr)
        -- string "Major.Minor.Patch"
        local r = type(vstr) == "string" and { vstr:match('^(%d+)%.(%d+)%.(%d+)$') }

        if #r ~= 3 then
            error(string.format("%s is not a valid version number!", serpent.line(vstr)))
        end

        for i = 1, 3 do
            r[i] = tonumber(r[i])
        end

        return r
    end

    version = version and parse_version(version)
    local need = need_version and parse_version(need_version)

    local a, b, c = unpack(version)
    local x, y, z = unpack(need)

    return (a > x) or (a == x and b > y) or (a == x and b == y and c >= z)
end


------------------------------------------------------------------------------------
-- If any mod is found that supports multiple characters in a game,
-- this will be false.
------------------------------------------------------------------------------------
local replace_base_char = true

------------------------------------------------------------------------------------
-- At least one mod in mod_list must exist and have the required version.
------------------------------------------------------------------------------------
for name, version in pairs(mod_list) do
    if mods[name] and check_version(name, version) then
        MIKU.dwrite(string.format("\"%s\" (%s) is active! Won't overwrite vanilla character and corpse.",
                name, mods[name]))
        replace_base_char = false
        break
    end
end

-- 确保没有其他模组做了愚蠢的事情并删除了默认角色！ --
-- Make sure no other mod did something stupid and deleted the default character! --
local chars = data.raw.character
if chars["character"] then
    local src, dst

    -- This game doesn't support multiple characters
    if replace_base_char then
        src = MIKU.character
        dst = chars["character"]

        -- Modify default character
        log("Overwriting properties of default character!")
        for p_name, property in pairs(src) do
            if p_name ~= "name" then
                dst[p_name] = table.deepcopy(property)
                --~ log(string.format("Set property \"%s\" of character \"%s\": %s", p_name, dst.name, type(property) == "table" and "table" or property))
            end
        end

        -- 移除我们创建的额外角色。 现在已经过时了！
        -- Remove the additional character we've created. It's obsolete now!
        chars[src.name] = nil
        log(string.format("Removed character \"%s\".", src.name))


        -- Game supports multiple characters
    else
        log(string.format("Will keep new character \"%s\"!", MIKU.character.name))

        src = chars["character"]
        dst = chars[MIKU.character.name]

        -- Copy all properties that are NOT stored in our table from the default character
        -- to the new one, just in case other mods changed stuff.
        log("Adding properties from default character to new character!")
        for p_name, property in pairs(src) do
            if MIKU.character[p_name] == nil then
                dst[p_name] = table.deepcopy(property)
                --~ log(string.format("Set property \"%s\" of character \"%s\": %s", p_name, dst.name, type(property) == "table" and "table" or property))
            end
        end
    end

    -- Default character has been deleted. If there is no character selector, restore
    -- the default character by moving ours there.
elseif replace_base_char then
    chars["character"] = table.deepcopy(chars[MIKU.character.name])
    chars["character"].name = "character"
    log("Re-created default character!")

    chars[MIKU.character.name] = nil
    log(string.format("Removed character \"%s\"!", MIKU.character.name))
end
