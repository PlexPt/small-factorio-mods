-- Make this a global variable so you have to load the file just once. Also,
-- make the name unique (e.g. "MIKU" or the initials of your mod, "MBS") so
-- other mods won't touch it.
MIKU = require("lib.common")


------------------------------------------------------------------------------------
--                  Initialize properties of character and corpse                 --
--  Put these in tables so we can easily apply the changes to the new character,  --
--  and keep track of what properties to skip when we copy properties from the    --
--  default character to the new character to retain changes made by other mods.  --
------------------------------------------------------------------------------------
MIKU.character = {}
MIKU.corpse = {}

--~ MIKU.character.name = MIKU.char_name
--~ MIKU.corpse.name = MIKU.char_name .. "-corpse"


-- Create character and character corpse
require("my_character")


-- Char selector mods can register if we shouldn't overwrite the default character.
-- (It really makes sense to use the same table for all character mods, so that
-- character selector mods need only register once. It should have a more neutral
-- name, but "GEAR_GIRL_" will work for now.)
GEAR_GIRL_keep_default_character = GEAR_GIRL_keep_default_character or {}
