-- Make this a global variable so you have to load the file just once. Also,
-- make the name unique (e.g. "MIKU" or the initials of your mod, "MBS") so
-- other mods won't touch it.
minecraft = require("__CharacterModHelper__.common")("minecraft")

IMG_PATH_CREEPER = minecraft.modRoot .. "/images/creeper/"
--local my_character = require("my_character")
local character_creator = require("character_creator")

minecraft.new_characters = {}

minecraft.new_characters["creeper-skin"] = character_creator.create(IMG_PATH_CREEPER, "creeper-skin")


-- Create prototypes
for name, prototypes in pairs(minecraft.new_characters) do
    CharModHelper.create_prototypes(prototypes)
end
