-- Make this a global variable so you have to load the file just once. Also,
-- make the name unique (e.g. "MIKU" or the initials of your mod, "MBS") so
-- other mods won't touch it.
MIKU = require("__CharacterModHelper__.common")("miku-bikini-swimsuit")

MIKU.IMG_PATH = MIKU.modRoot.."/images/"
local character_creator = require("character_creator")


------------------------------------------------------------------------------------
--                  Initialize properties of character and corpse                 --
--  Put these in tables so we can easily apply the changes to the new character,  --
--  and keep track of what properties to skip when we copy properties from the    --
--  default character to the new character to retain changes made by other mods.  --
------------------------------------------------------------------------------------
MIKU.new_characters = {}

local name = "miku-bikini-swimsuit-skin"
MIKU.new_characters[name] = require("my_character")(name)

name = "miku-bikini-miku-fox-skin"
MIKU.new_characters[name] = character_creator.create(MIKU.IMG_PATH.."miku-fox/", name)


-- Create prototypes
for name, prototypes in pairs(MIKU.new_characters) do
  CharModHelper.create_prototypes(prototypes)
end
